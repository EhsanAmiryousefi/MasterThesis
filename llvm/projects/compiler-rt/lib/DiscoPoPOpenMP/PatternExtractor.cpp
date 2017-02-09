//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "patternextractor"

#include "llvm/Transforms/Instrumentation.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Pass.h"
#include "llvm/PassSupport.h"
#include "llvm/DebugInfo.h"
#include "llvm/Support/raw_ostream.h"
#include <set>
#include <map>

using namespace llvm;
using namespace std;

namespace {

    class PatternExtractor : public FunctionPass {
    public:
        PatternExtractor() : FunctionPass(ID) {}
//        ~PatternExtractor();

        const char* getPassName() const;
        bool runOnFunction(Function &F);
        bool doInitialization(Module &M);
        void getAnalysisUsage(AnalysisUsage &Info) const;

        static char ID; // Pass identification, replacement for typeid

    private:
        // Initializations
        void setupDataTypes();
        void initializeCallbacks();

        // Callback Inserters
        int instrumentLoad(Instruction *I, LoopInfo &LI);
        int instrumentStore(Instruction *I, LoopInfo &LI);
        bool instrumentReturn(Instruction *I);
        bool instrumentCallInvoke(Instruction *I);
        void insertPEFinalize(Instruction *before);
        void instrumentFuncEntry(Function &F);


        // Helper functions
        DIGlobalVariable* findDbgGlobalDeclare(GlobalVariable *v);
        Value* findStructMemberName(MDNode* structNode, unsigned idx, IRBuilder<>& builder);
        Type* pointsToStruct(PointerType* PTy);
        Value* getOrInsertVarName(string varName, IRBuilder<>& builder);
        Value* determineVarName(Instruction* I);

        int32_t loopUIDS;
        // Basic types
        Type *Void;
        IntegerType *Int32, *Int64;
        PointerType *CharPtr;

        // Callbacks to run-time library
        Function *PE_init, *PE_finalize;
        Function *PE_load, *PE_store;
        Function *PE_funcEntry, *PE_funcExit;

        Module *ThisModule;
        LLVMContext *ThisModuleContext;

        map<string, Value*> VarNames;
        set<DIGlobalVariable*> GlobalVars;
        map<string, MDNode*> Structs;
    };
} //namespace

char PatternExtractor::ID = 0;
INITIALIZE_PASS(PatternExtractor, "PatternExtractor", "PatternExtractor: finding potential patterns.", false, false)

FunctionPass *llvm::createPatternExtractorPass() {
    errs() << "create PatternExtractor \n";

    initializeLoopInfoPass(*PassRegistry::getPassRegistry());
    return new PatternExtractor();
}
const char* PatternExtractor::getPassName() const{
    return "PatternExtractor";
}

// Initializations
void PatternExtractor::setupDataTypes() {
    Void = const_cast<Type*>(Type::getVoidTy(*ThisModuleContext));
    Int32 = const_cast<IntegerType*>(IntegerType::getInt32Ty(*ThisModuleContext));
    Int64 = const_cast<IntegerType*>(IntegerType::getInt64Ty(*ThisModuleContext));
    CharPtr = const_cast<PointerType*>(Type::getInt8PtrTy(*ThisModuleContext));
}

// Initializing callback functions in order to instrument the code
// Any instrumentaion callback function should be defined here.
void PatternExtractor::initializeCallbacks() {
    PE_load = cast<Function>(ThisModule->getOrInsertFunction("__pe_load",
                                                            Void,
                                                            Int64,
                                                            CharPtr,
                                                            Int32,
                                                            Int32,
                                                            Int32,
                                                            (Type*)0));
    PE_store = cast<Function>(ThisModule->getOrInsertFunction("__pe_store",
                                                              Void,
                                                              Int64,
                                                              (Type*)0));
    PE_finalize = cast<Function>(ThisModule->getOrInsertFunction("__pe_finalize",
                                                                Void,
                                                                (Type*)0));
    PE_funcEntry = cast<Function>(ThisModule->getOrInsertFunction("__pe_func_entry",
                                                                 Void,
                                                                 (Type*)0));
    PE_funcExit = cast<Function>(ThisModule->getOrInsertFunction("__pe_func_exit",
                                                                Void,
                                                                (Type*)0));
}

// Module wide Initializtion takes place here
bool PatternExtractor::doInitialization(Module &M) {
    ThisModule = &M;
    ThisModuleContext = &(M.getContext());

    loopUIDS=0;

    setupDataTypes();
    initializeCallbacks();

    return true;
}

void PatternExtractor::getAnalysisUsage(AnalysisUsage &Info) const {
    Info.addRequired<LoopInfo>();
}

static bool isAtomic(Instruction *I) {
    if (LoadInst *LI = dyn_cast<LoadInst>(I))
        return LI->isAtomic() && LI->getSynchScope() == CrossThread;
    if (StoreInst *SI = dyn_cast<StoreInst>(I))
        return SI->isAtomic() && SI->getSynchScope() == CrossThread;
    if (isa<AtomicRMWInst>(I))
        return true;
    if (isa<AtomicCmpXchgInst>(I))
        return true;
    if (isa<FenceInst>(I))
        return true;
    return false;
}

DIGlobalVariable* PatternExtractor::findDbgGlobalDeclare(GlobalVariable *v) {
    assert(v && "Global variable cannot be null");
    for (set<DIGlobalVariable*>::iterator it = GlobalVars.begin(); it != GlobalVars.end(); ++it) {
        if ((*it)->getGlobal() == v)
            return *it;
    }
    return NULL;
}

Value* PatternExtractor::findStructMemberName(MDNode* structNode, unsigned idx, IRBuilder<>& builder) {
    assert(structNode);
    MDNode* memberListNodes = cast<MDNode>(structNode->getOperand(10));
    if (idx < memberListNodes->getNumOperands()) {
        MDNode* member = cast<MDNode>(memberListNodes->getOperand(idx));
        return getOrInsertVarName(string(member->getOperand(3)->getName().data()), builder);
    }
    return NULL;
}

Type* PatternExtractor::pointsToStruct(PointerType* PTy) {
    assert(PTy);
    Type* structType = PTy;
    if (PTy->getTypeID() == Type::PointerTyID) {
        while(structType->getTypeID() == Type::PointerTyID) {
            structType = cast<PointerType>(structType)->getElementType();
        }
    }
    return structType->getTypeID() == Type::StructTyID ? structType : NULL;
}

Value* PatternExtractor::getOrInsertVarName(string varName, IRBuilder<>& builder) {
    Value* vName = NULL;
    map<string, Value*>:: iterator pair = VarNames.find(varName);
    if (pair == VarNames.end()) {
        vName = builder.CreateGlobalStringPtr(StringRef(varName.c_str()), ".str");
        VarNames[varName] = vName;
    }
    else {
        vName = pair->second;
    }
    return vName;
}

Value* PatternExtractor::determineVarName(Instruction* I) {
    assert(I && "Instruction cannot be NULL \n");
    int index = isa<StoreInst>(I) ? 1 : 0;
    Value* operand = I->getOperand(index);
    IRBuilder<> builder(I);

    if (operand->hasName()) {
        // we've found a global variable
        if (isa<GlobalVariable>(*operand)) {
            DIGlobalVariable* gv = findDbgGlobalDeclare(cast<GlobalVariable>(operand));
            if (gv != NULL) {
                return getOrInsertVarName(string (gv->getDisplayName().data()), builder);
            }
        }
        if (isa<GetElementPtrInst>(*operand)) {
            GetElementPtrInst* gep = cast<GetElementPtrInst>(operand);
            Value* ptrOperand = gep->getPointerOperand();
            PointerType *PTy = cast<PointerType>(ptrOperand->getType());

            // we've found a struct/class
            Type* structType = pointsToStruct(PTy);
            if (structType && gep->getNumOperands() > 2) {
                Value* constValue = gep->getOperand(2);
                if (constValue && isa<ConstantInt>(*constValue)) {
                    ConstantInt* idxPtr = cast<ConstantInt>(gep->getOperand(2));
                    uint64_t memberIdx = *(idxPtr->getValue().getRawData());

                    string strName(structType->getStructName().data());
                    map<string, MDNode*>::iterator it = Structs.find(strName);
                    if (it != Structs.end()) {
                        Value* ret = findStructMemberName(it->second, memberIdx, builder);
                        if (ret)
                            return ret;
                    }
                }
            }

            // we've found an array
            if (PTy->getElementType()->getTypeID() == Type::ArrayTyID && isa<GetElementPtrInst>(*ptrOperand)) {
                return determineVarName((Instruction*)ptrOperand);
            }
            return determineVarName((Instruction*)gep);
        }
        return getOrInsertVarName(string(operand->getName().data()), builder);
    }

    if (isa<LoadInst>(*operand) || isa<StoreInst>(*operand)) {
        return determineVarName((Instruction*)(operand));
    }
    // if we cannot determine the name, then return *
    return getOrInsertVarName("*", builder);
}

// LLVM pass will run here
bool PatternExtractor::runOnFunction(Function &F){
    int numLoads = 0;
    int numStores = 0;
    StringRef funcName = F.getName();
    // Avoid functions we don't want to instrument
    if (funcName.find("llvm.dbg") != string::npos) {  // llvm debug calls
        return false;
    }
    if (funcName.find("__pe_") != string::npos) {     // instrumentation calls
        return false;
    }
    if (funcName.find("__cx") != string::npos) {      // c++ init calls
        return false;
    }
    if (funcName.find("__clang") != string::npos) {   // clang helper calls
        return false;
    }
    if (funcName.find("_GLOBAL_") != string::npos) {  // global init calls (c++)
        return false;
    }
    if (funcName.find("pthread_") != string::npos) {
        return false;
    }

    LoopInfo &LI = getAnalysis<LoopInfo>();

    instrumentFuncEntry(F);

    bool Res = false;
    SmallVector<Instruction*, 8> ReturnVec;
    SmallVector<Instruction*, 8> LoadsVec;
    SmallVector<Instruction*, 8> StoresVec;
    SmallVector<Instruction*, 8> AtomicAccessesVec;
    SmallVector<Instruction*, 8> MemIntrinCallsVec;

    // Traverse all instructions, collect loads/stores/returns, check for calls.
    for (Function::iterator FI = F.begin(), FE = F.end(); FI != FE; ++FI) {
        BasicBlock &BB = *FI;
        for (BasicBlock::iterator BI = BB.begin(), BE = BB.end(); BI != BE; ++BI) {
            if (isAtomic(BI))
                AtomicAccessesVec.push_back(BI);
            else if (isa<LoadInst>(BI))
                LoadsVec.push_back(BI);
            else if (isa<StoreInst>(BI))
                StoresVec.push_back(BI);
            else if (isa<ReturnInst>(BI))
                ReturnVec.push_back(BI);
            else if (isa<CallInst>(BI) || isa<InvokeInst>(BI)) {
                if (isa<MemIntrinsic>(BI))
                    MemIntrinCallsVec.push_back(BI);
                instrumentCallInvoke(BI);
            }
        }
    }

    // We have collected all loads and stores.
    // Instrument memory accesses.
    for (size_t i = 0, n = LoadsVec.size(); i < n; ++i) {
        int output = instrumentLoad(LoadsVec[i], LI);
        numLoads += output;
        Res |= output;
    }
    for (size_t i = 0, n = StoresVec.size(); i < n; ++i) {
        int output = instrumentStore(StoresVec[i], LI);
        numStores += output;
        Res |= output;
    }
    for (size_t i = 0, n = ReturnVec.size(); i < n; ++i) {
        Res |= instrumentReturn(ReturnVec[i]);
    }
    // Provide report
    errs() << "Function: " << funcName << "===> Loads = " << numLoads << ", Stores = " << numStores << "\n";

    return Res;
}

int PatternExtractor::instrumentLoad(Instruction *I, LoopInfo &LoopI) {
    LoadInst *LI = cast<LoadInst>(I);
    IRBuilder<> IRB(I);
    LLVMContext& C = I->getContext();
    // memAddr
    Value *addr = PtrToIntInst::CreatePointerCast(LI->getPointerOperand(), Int64, "", LI);
    // variable name
    // Value *varName = determineVarName(LI);

    // vairable size
    Value *vSize = ConstantInt::get(Int32, LI->getAlignment());
    // Get the closest loop where instruction lives in.
    // (L == NULL) if instruction is not in any loop.
    Loop *L = LoopI.getLoopFor(I->getParent());
    Value *currLoopID;
    Value *parentLoopID;
    Value *absolutePathFileName;
    if(L != NULL){
        MDNode *N = LI->getMetadata("dbg");
        if (N){
            StringRef File = "", Dir = "";
            DILocation Loc(N);
            File = Loc.getFilename();
            Dir = Loc.getDirectory();

            absolutePathFileName = IRB.CreateGlobalStringPtr((Dir.str() + "/" + File.str() + "::" + I->getParent()->getParent()->getName().str()).c_str(), ".str");
        }

        if(L->getHeader()->getFirstNonPHI()->getMetadata("loop.md.peID")==NULL)
        {
            MDNode* N = MDNode::get(C, ConstantInt::get(Int32, loopUIDS++));
            L->getHeader()->getFirstNonPHI()->setMetadata("loop.md.peID", N);
            currLoopID = L->getHeader()->getFirstNonPHI()->getMetadata("loop.md.peID")->getOperand(0);
            errs() << loopUIDS-1 << "Loop in function: " << L->getHeader()->getParent()->getName() << "\n";
        }
        else{
            //errs() << cast<MDString>(L->getHeader()->getFirstNonPHI()->getMetadata("loop.md.peID")->getOperand(0))->getString();
            currLoopID = L->getHeader()->getFirstNonPHI()->getMetadata("loop.md.peID")->getOperand(0);
        }

        if(L->getParentLoop() != NULL){
            if(L->getParentLoop()->getHeader()->getFirstNonPHI()->getMetadata("loop.md.peID")==NULL)
            {
                MDNode* N = MDNode::get(C, ConstantInt::get(Int32, loopUIDS++));
                L->getParentLoop()->getHeader()->getFirstNonPHI()->setMetadata("loop.md.peID", N);
                parentLoopID = L->getParentLoop()->getHeader()->getFirstNonPHI()->getMetadata("loop.md.peID")->getOperand(0);
                errs() << loopUIDS-1 << "Loop in function: " << L->getParentLoop()->getHeader()->getParent()->getName() << "\n";
            }
            else{
                //errs() << cast<MDString>(L->getHeader()->getFirstNonPHI()->getMetadata("loop.md.peID")->getOperand(0))->getString();
                parentLoopID = L->getParentLoop()->getHeader()->getFirstNonPHI()->getMetadata("loop.md.peID")->getOperand(0);
            }
        }
        else
            parentLoopID = ConstantInt::get(Int32, -1);
    }
    else{
        currLoopID = ConstantInt::get(Int32, -1);
        parentLoopID = ConstantInt::get(Int32, -1);
        absolutePathFileName = IRB.CreateGlobalStringPtr("NULL", ".str");
    }
    if(I->getParent()->getParent()->getName().str() != "main"){
        IRB.CreateCall5(PE_load, addr, absolutePathFileName, vSize, currLoopID, parentLoopID);
        return 1;
    }
    else
        return 0;

}

int PatternExtractor::instrumentStore(Instruction *I, LoopInfo &LoopI) {
    StoreInst *SI = cast<StoreInst>(I);
    // memAddr
    Value *addr = PtrToIntInst::CreatePointerCast(SI->getPointerOperand(), Int64, "", SI);

    if(I->getParent()->getParent()->getName().str() != "main"){
        IRBuilder<> IRB(I);
        IRB.CreateCall(PE_store, addr);
        return 1;
    }
    else
        return 0;
}

bool PatternExtractor::instrumentReturn(Instruction *I) {
    BasicBlock *BB = I->getParent();
    Function *parent = BB->getParent();
    assert(parent != NULL);
    StringRef fn = parent->getName();

    if (fn.equals("main")) {   // returning from main
        insertPEFinalize(I);
        return true;
    }
    return false;
}

bool PatternExtractor::instrumentCallInvoke(Instruction *I) {
    Function *F;
    if (isa<CallInst>(I))
        F = (cast<CallInst>(I))->getCalledFunction();
    else if (isa<InvokeInst>(I))
        F = (cast<InvokeInst>(I))->getCalledFunction();

    // For ordinary function calls, F has a name.
    // However, sometimes the function being called
    // in IR is encapsulated by "bitcast()" due to
    // the way of compiling and linking. In this way,
    // getCalledFunction() method returns NULL.
    StringRef fn = "";
    if (F) {
        fn = F->getName();
        if (fn.find("__pe_") != string::npos) {         // avoid instrumentation calls
            return false;
        }
        if (fn.find("__clang_") != string::npos) {      // clang helper calls
            return false;
        }
        if (fn.equals("pthread_exit")) {
            // pthread_exit does not return to its caller.
            // Therefore, we insert DpFuncExit before pthread_exit
            //IRBuilder<> IRBRet(I);
            //IRBRet.CreateCall2(DpFuncExit, ConstantInt::get(Int32, getLID(I)), ConstantInt::get(Int32, 0));
            return false;
        }
        if (fn.equals("exit") || F->doesNotReturn()) {  // using exit() to terminate program
            // only insert DpFinalize right before the main program exits
            insertPEFinalize(I);
            return true;
        }
    }
    return false;
}

void PatternExtractor::insertPEFinalize(Instruction *before) {
    IRBuilder<> IRB(before);
    IRB.CreateCall(PE_finalize);
}

void PatternExtractor::instrumentFuncEntry(Function &F) {
    IRBuilder<> IRB(F.getEntryBlock().getFirstNonPHI());
    IRB.CreateCall(PE_funcEntry);
}

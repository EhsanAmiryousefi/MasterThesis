/*
 *  CUInstantiation.cpp
 *
 *
 *  Created by Ehsan Amiryousefi on 31/08/2016.
 *  
 *  
 *
 */


#include "llvm/Transforms/Instrumentation.h"
#include "llvm/ADT/ilist.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/User.h"
#include "llvm/IR/Value.h"
#include "llvm/Analysis/Passes.h"
#include "llvm/Analysis/RegionIterator.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/RegionInfo.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/DPUtils.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Pass.h"
#include "llvm/PassAnalysisSupport.h"
#include "llvm/PassSupport.h"
#include "llvm-c/Core.h"
#include "llvm/Analysis/DominanceFrontier.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Casting.h"
#include "llvm/IR/Instructions.h"

#include <map>
#include <set>
#include <utility>
#include <iomanip>
#include <algorithm>
#include <string.h>

using namespace llvm;

#define DEBUG_TYPE "db_omp"

STATISTIC(HelloCounter, "Counts number of functions greeted");

namespace {


    static cl::opt<std::string> InputFilename("input", cl::desc("<input file>"), cl::Optional);

  // Data structures for reading input
  static map<LID, vector<pair<string,int>>> callLineToFNameMap; // location of function calls to a (functio name,PIDIndex)
  static map<LID, set<pair<string,int>,compare>> readLineToVarNameMap; // location of loads to instrument with variable names in the input
  static map<LID, set<pair<string,int>,compare>> writeLineToVarNameMap; // location of stores to instrument with variable names in the input

    int32_t fileID;

    class DiscoPoPOpenMP : public ModulePass {
    // Pass identification, replacement for typeid
    public : 
    void instrumentLoadInst(Instruction *inst, int pidIndex, string writeLine);
    void instrumentStoreInst(Instruction *inst, int pidIndex);
    string getOrInsertVarName(string varName, IRBuilder<>& builder);


    Type* pointsToStruct(PointerType* PTy);
    void setupDataTypes();
    int getLID(Instruction* BI);
    bool doInitialization(Module &M);
    void setupCallbacks();

    void readLineNumberPairs(const char* fileName);
    string findStructMemberName(MDNode* structNode, unsigned idx, IRBuilder<>& builder);
    string determineVariableName(Instruction* I);

    virtual bool runOnModule(Module &M);

    LLVMContext* ThisModuleContext;
    Module *ThisModule;
    // Basic types
    Type *Void;
    IntegerType *Int32, *Int64;
    PointerType *CharPtr;

    //DiscoPoP Data structures
      map<string, MDNode*> Structs;
      map<string, Value*> VarNames;

    vector<string> split(const string &s, const char delim);

    Function *CUInstRead, *CUInstWrite;

    static char ID; 
    DiscoPoPOpenMP() : ModulePass(ID) {}
    // DiscoPoPOpenMP() : FunctionPass(ID) {};

    // bool runOnFunction(Function &F) override {
    //    int counter =0;
    //    for(BasicBlock &bb : F) {
    //         for(Instruction &instr : bb) {
    //             if(isa<LoadInst>(instr)){
    //                 // for (Use &U : instr.operands()) {
    //                 //       if (Instruction *Inst = dyn_cast<Instruction>(U)) {
    //                 //         errs() << *Inst << "\n";
    //                 //       }
    //                 // }
    //                errs() <<  "Load Instruction found: " <<instr<< "\n";
    //                counter++;
    //             }
    //             if (isa<StoreInst>(instr))
    //             {
    //                 errs() <<"Store Instruction found: " <<instr << "\n";
    //                 counter++;
    //             }
    //         }
    //     }
    //   ++HelloCounter;
    //   errs() <<"Total No. of Instructions found: " <<counter << "\n";
    //   return false;
    // }
  };
}




void DiscoPoPOpenMP::setupCallbacks() {
    /* function name
     * return value type
     * arg types
     * NULL
     */

    CUInstRead = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPRead",
            Void,
            Int32,
            Int32,
            Int64,
            CharPtr,
            CharPtr,
            CharPtr,
            (Type*)0));
}
  void DiscoPoPOpenMP::readLineNumberPairs(const char* fileName) 
{
  ifstream inputFileStream;
  inputFileStream.open(fileName);
  if(!inputFileStream.is_open()){
    errs() << "Unable to open the input file\n";
    exit(0);
  }
  string line;

  while (std::getline(inputFileStream, line)) 
  {
    istringstream iss(line);
    string FName;
    string callLines;
    string deps;

    iss >> FName;
    iss >> callLines;
    iss >> deps;

    for(auto i:split(callLines, ',')){
      callLineToFNameMap[encodeLID(i)].push_back(pair<string,int>(FName,PIDIndex));
    }
    
    for(auto dep:split(deps, ',')){

      vector<string> i = split(dep, '|');

        pair<string,int> p(i.back(),PIDIndex);
        if(i[1] == "RAW"){
          writeLineToVarNameMap[encodeLID(i[2])].insert(p); // i[2] is the write location and i.back variable name
          string s = i.back() + ',' + i[2];
          pair<string,int> p1(s,PIDIndex);
          readLineToVarNameMap[encodeLID(i.front())].insert(p1); // i.front is the read location and i.back variable name
          
        } else if(i[1] == "WAR"){
          writeLineToVarNameMap[encodeLID(i.front())].insert(p); // i.front is the write location and i.back variable name
          string s = i.back() + ',' + i.front();
          pair<string,int> p1(s,PIDIndex);
          readLineToVarNameMap[encodeLID(i[2])].insert(p1); // i[2] is the read location and i.back variable name
        } else if(i[1] == "WAW"){
          writeLineToVarNameMap[encodeLID(i.front())].insert(p); // i.front is the write location and i.back variable name
          writeLineToVarNameMap[encodeLID(i[2])].insert(p); // i[2] is the write location and i.back variable name
        }
        
    }
    PIDIndex++;

  }
}

  string DiscoPoPOpenMP::getOrInsertVarName(string varName, IRBuilder<>& builder) {
  Value* valName = NULL;
  std::string vName = varName;
  map<string, Value*>::iterator pair = VarNames.find(varName);
  if (pair == VarNames.end()) {
      valName = builder.CreateGlobalStringPtr(StringRef(varName.c_str()), ".str");
      VarNames[varName] = valName;
  }
  else {
    vName = pair->first;
  }

  return vName;
}


bool DiscoPoPOpenMP::doInitialization(Module &M) {
    
    // Export M to the outside
    ThisModuleContext = &(M.getContext());
    setupDataTypes();
    setupCallbacks();
    return true;
}


//static RegisterPass<DiscoPoPOpenMP> X("dp_omp", "Hello World Pass");

  void DiscoPoPOpenMP::setupDataTypes() {
    Void = const_cast<Type*>(Type::getVoidTy(*ThisModuleContext));
    Int32 = const_cast<IntegerType*>(IntegerType::getInt32Ty(*ThisModuleContext));
    Int64 = const_cast<IntegerType*>(IntegerType::getInt64Ty(*ThisModuleContext));
  }

  void DiscoPoPOpenMP::instrumentLoadInst(Instruction *toInstrument, int pidIndex, string writeLine){
    vector<Value*> args;
    

    int32_t lid = getLID(toInstrument);
    if (lid == 0) return;

    args.push_back(ConstantInt::get(Int32, lid));
    args.push_back(ConstantInt::get(Int32, pidIndex));

    Value* memAddr = PtrToIntInst::CreatePointerCast(cast<LoadInst>(toInstrument)->getPointerOperand(),
            Int64, "", toInstrument);
    args.push_back(memAddr);    

    IRBuilder<> builder(toInstrument);
    Value *fName;

    if(toInstrument->getParent()->getParent()->hasName()){
      fName = builder.CreateGlobalStringPtr(string(toInstrument->getParent()->getParent()->getName().data()).c_str(), ".str");
    args.push_back(fName);      
    } else {
      fName = builder.CreateGlobalStringPtr(string("NULL").c_str(), ".str");
      args.push_back(fName);
    }

    string varName = determineVariableName(toInstrument);
  //if (varName.find(".addr") != varName.npos)
    //  varName.erase(varName.find(".addr"), 5);
    Value *vName = builder.CreateGlobalStringPtr(varName.c_str(), ".str");
    args.push_back(vName);    

    Value *writeLineNumber = builder.CreateGlobalStringPtr(writeLine.c_str(), ".str");
    args.push_back(writeLineNumber); 

    CallInst::Create(CUInstRead, args, "", toInstrument);
}

void DiscoPoPOpenMP::instrumentStoreInst(Instruction *toInstrument, int pidIndex){
    vector<Value*> args;

    int32_t lid = getLID(toInstrument);
    if (lid == 0) return;

    args.push_back(ConstantInt::get(Int32, lid));
    
    args.push_back(ConstantInt::get(Int32, pidIndex));

    Value* memAddr = PtrToIntInst::CreatePointerCast(cast<StoreInst>(toInstrument)->getPointerOperand(),
            Int64, "", toInstrument);
    args.push_back(memAddr);   

    IRBuilder<> builder(toInstrument);
    Value *fName;

    if(toInstrument->getParent()->getParent()->hasName()){
      fName = builder.CreateGlobalStringPtr(string(toInstrument->getParent()->getParent()->getName().data()).c_str(), ".str");
    args.push_back(fName);      
    } else {
      fName = builder.CreateGlobalStringPtr(string("NULL").c_str(), ".str");
      args.push_back(fName);
    }

    string varName = determineVariableName(toInstrument);
    //if (varName.find(".addr") != varName.npos)
    //  varName.erase(varName.find(".addr"), 5);
    Value *vName = builder.CreateGlobalStringPtr(varName.c_str(), ".str");
    args.push_back(vName);

    CallInst::Create(CUInstWrite, args, "", toInstrument);
}

int DiscoPoPOpenMP::getLID(Instruction* BI)
{

  int32_t lid = 0;
  int32_t lno = BI->getDebugLoc().getLine();

  if (lno == 0) {
    return 0;
  }

  if (fileID == 0)
  {
    // Get the new fileID.
    StringRef File = "", Dir = "";
    MDNode *N = BI->getMetadata("dbg");
    if (N == NULL)
    {
      // N == NULL means BI is only a helper instruction.
      // No metadata is attached to BI.
      return 0;
    }
    DILocation Loc(N);
    File = Loc.getFilename();
    Dir = Loc.getDirectory();


    if (File.str().substr(0, 2) == "./")
    {
      std::string sub = File.str().substr(0, 2);
      File = File.substr(2, File.size() - 1);
    }

    fileID = dputil::getFileID(FileMappingPath, Dir.str() + "/" + File.str());

    // file is not in FileMapping.txt
    if (fileID == 0)
      return -1;


  }
  lid = (fileID << LIDSIZE) + lno;
  //ofmap << lid << std::endl;
  return lid;
}

string DiscoPoPOpenMP::determineVariableName(Instruction* I) {
  
  assert(I && "Instruction cannot be NULL \n");
  int index = isa<StoreInst>(I) ? 1 : 0;
  Value* operand = I->getOperand(index);

  IRBuilder<> builder(I);

  if (operand == NULL) {
    return getOrInsertVarName("", builder);
  }

  if (operand->hasName()) {
    //// we've found a global variable
    if (isa<GlobalVariable>(*operand)) {
      //MOHAMMAD ADDED THIS FOR CHECKING
      return string(operand->getName());
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
            std::string ret = findStructMemberName(it->second, memberIdx, builder);
            if (ret.size() > 0)
              return ret;
            else
              return getOrInsertVarName("", builder);
            //return ret;

          }
        }
      }

      // we've found an array
      if (PTy->getElementType()->getTypeID() == Type::ArrayTyID && isa<GetElementPtrInst>(*ptrOperand)) {
        return determineVariableName((Instruction*)ptrOperand);
      }
      return determineVariableName((Instruction*)gep);
    }
    return string(operand->getName().data());
    //return getOrInsertVarName(string(operand->getName().data()), builder);
  }

  if (isa<LoadInst>(*operand) || isa<StoreInst>(*operand)) {
    return determineVariableName((Instruction*)(operand));
  }
  // if we cannot determine the name, then return *
  return "";//getOrInsertVarName("*", builder);
}


Type* DiscoPoPOpenMP::pointsToStruct(PointerType* PTy) {
  assert(PTy);
  Type* structType = PTy;
  if (PTy->getTypeID() == Type::PointerTyID) {
    while (structType->getTypeID() == Type::PointerTyID) {
      structType = cast<PointerType>(structType)->getElementType();
    }
  }
  return structType->getTypeID() == Type::StructTyID ? structType : NULL;
}

string DiscoPoPOpenMP::findStructMemberName(MDNode* structNode, unsigned idx, IRBuilder<>& builder) {
  assert(structNode);
  assert(structNode->getOperand(10));
  MDNode* memberListNodes = cast<MDNode>(structNode->getOperand(10));
  if (idx < memberListNodes->getNumOperands()) {
    assert(memberListNodes->getOperand(idx));
    MDNode* member = cast<MDNode>(memberListNodes->getOperand(idx));
    if (member->getOperand(3)) {
      //getOrInsertVarName(string(member->getOperand(3)->getName().data()), builder);
      //return string(member->getOperand(3)->getName().data());
      getOrInsertVarName(dyn_cast<MDString>(member->getOperand(3))->getString(), builder);
      return dyn_cast<MDString>(member->getOperand(3))->getString();
    }
  }
  return NULL;
}

bool DiscoPoPOpenMP::runOnModule(Module &M){

  StringRef inputFileName = InputFilename;
  if (inputFileName.empty()) //input is not given
  {
    errs() << "Input file name empty\n";
    exit(0);
  }

  const char* fileName = inputFileName.data();
  readLineNumberPairs(fileName);

  for (Module::iterator func = 
    ->begin(), E = ThisModule->end(); func != E; ++func)
  {
    determineFileID(*func);


      if (func->hasName() && func->getName().equals("main")){
        insertInitializeInst(*func);
      }

    for (inst_iterator i = inst_begin(func); i!=inst_end(func); ++i) 
    {
      Instruction *inst = &*i;
      LID line = getLID(inst);
      
      if(isa<LoadInst>(inst)){
        if(readLineToVarNameMap.find(line) != readLineToVarNameMap.end()){
          string varName = determineVariableName(inst);
          for(auto i:readLineToVarNameMap[line]){
            vector<string> tmp = split(i.first, ',');
            if(tmp[0] == varName){
              instrumentLoadInst(inst, i.second, tmp[1]);
            }   
          }
        }
      } else if(isa<StoreInst>(inst)){
        if(writeLineToVarNameMap.find(line) != writeLineToVarNameMap.end()){
          string varName = determineVariableName(inst);
          for(auto i:writeLineToVarNameMap[line]){
            if(i.first == varName){
              instrumentStoreInst(inst, i.second);
            }   
          }
        }
      } 
      
    }
  }
  return false;
}

char DiscoPoPOpenMP::ID = 0;

INITIALIZE_PASS(DiscoPoPOpenMP, "DiscoPoPOpenMP", "analyze dependences", false, false)

FunctionPass *llvm::createDiscoPoPOpenMPPass() {
   initializeLoopInfoPass(*PassRegistry::getPassRegistry());
   initializeRegionInfoPassPass(*PassRegistry::getPassRegistry());
   return new DiscoPoPOpenMP();
  }

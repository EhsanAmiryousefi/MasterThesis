//===----------------------------------------------------------------------===//
//
// This file implements a pass that instruments the code to perform run-time
// bounds checking on loads, stores, and other memory intrinsics for OpenMP applications .
//Author: Ehsan Amiryousefi
//
//===----------------------------------------------------------------------===//

#include <stdint.h>
#include <string>
#include <sstream>
#include <stdexcept>
#include <iostream>   // std::cerr 
#include <fstream>
#include <vector>
#include <utility>
#include <unistd.h>
#include <assert.h>
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
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Pass.h"
#include "llvm/PassAnalysisSupport.h"
#include "llvm/PassSupport.h"
#include "llvm-c/Core.h"
#include "llvm/Analysis/DominanceFrontier.h"
#include <map>
#include <set>
#include <iomanip>
#include <algorithm>
#include <string.h>
#include "llvm/Analysis/MemoryBuiltins.h"
#include "llvm/Analysis/TargetFolder.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/MDBuilder.h"


using namespace llvm;
using namespace std;
using LID = int32_t;

#define DEBUG_TYPE "dpomp"

// STATISTIC(LoadsInstrumented, "Loads instrumented");
// STATISTIC(StoresInstrumented, "Stores instrumented");
// STATISTIC(AtomicsInstrumented, "Atomic memory intrinsics instrumented");
// STATISTIC(IntrinsicsInstrumented, "Block memory intrinsics instrumented");


typedef IRBuilder<TargetFolder> BuilderTy;


cl::opt<string> FileMappingPath("fm-path", cl::init(""),
  cl::desc("Specify file mapping location"), cl::Hidden);

 static map<LID, vector<pair<string,int>>> callLineToFNameMap; // location of function calls to a (functio name,PIDIndex)

namespace {
  struct DiscoPoPOpenMP : public FunctionPass {
    static char ID;

    #define LIDSIZE 14    // Number of bits for holding LID
    #define MAXLNO 16384  // Maximum number of lines in a single file. Has to be 2^LIDSIZE.

    // typedef int32_t LID;
    typedef int64_t ADDR;
    LLVMContext* ThisModuleContext;
    Module *ThisModule;

    int StoresInstrumented;
    int LoadsInstrumented;

    int countCalls;
    // Basic types
    Type *Void;
    IntegerType *Int32, *Int64;
    PointerType *CharPtr;

    int32_t functionStartLineNumber;

    int32_t fileID;
    int64_t ompRegionsUID;

    Function *DPOMPRead, *DPOMPWrite,*DPOMPInitialize,*DPOMPFinalize,*DPOMPThreadCollector,*DPOMPBeforeCall,*DPOMPAfterCall;

    IRBuilder<> *Builder;
    const DataLayout *TD;
    Function *LoadCheckFunction;
    //Function *StoreCheckFunction;
    Instruction *Inst;

    map<string, MDNode*> Structs;
    map<string, Value*> VarNames;

    DiscoPoPOpenMP() : FunctionPass(ID) {
      initializeDiscoPoPOpenMPPass(*PassRegistry::getPassRegistry());
    }

    string get_exe_dir();
    int32_t getFileID(string fileMapping, string fullPathName);
    inline bool fexists(const string& filename);
    inline vector<string>* split(string input, char delim);
    inline string decodeLID(int32_t lid);

    bool doInitialization(Module &M) override;
    bool runOnFunction(Function &F) override;


    void setupDataTypes();
    void setupCallbacks();

    bool isaCallOrInvoke(Instruction* BI);

    string determineVariableName(Instruction* I);
    string getOrInsertVarName(string varName, IRBuilder<>& builder);
    Type* pointsToStruct(PointerType* PTy);
    string findStructMemberName(MDNode* structNode, unsigned idx, IRBuilder<>& builder);

    void instrumentLoadInst(Instruction *toInstrument);
    void instrumentStoreInst(Instruction *toInstrument);
    void insertInitializeInst(Function &F);
    void insertFinalizeInst(Instruction *before);
    void collectThreadInfo(Instruction *toInstrument);
    void instrumentCallInst(Instruction *toInstrument,StringRef regName);


    int getLID(Instruction* BI);
    void determineFileID(Function &F);



    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.addRequired<TargetLibraryInfoWrapperPass>();
    }

    bool instrument(Value *Ptr, Value *Val, const DataLayout &DL);
  };
}

char DiscoPoPOpenMP::ID = 0;
INITIALIZE_PASS(DiscoPoPOpenMP, "dpomp", "Run-time bounds checking",
  false, false)

FunctionPass *llvm::createDiscoPoPOpenMPPass() {
  return new DiscoPoPOpenMP();
}

void DiscoPoPOpenMP::setupDataTypes() {
  //Data types
  StoresInstrumented=0;
  Void = const_cast<Type*>(Type::getVoidTy(*ThisModuleContext));
  Int32 = const_cast<IntegerType*>(IntegerType::getInt32Ty(*ThisModuleContext));
  Int64 = const_cast<IntegerType*>(IntegerType::getInt64Ty(*ThisModuleContext));
  CharPtr = const_cast<PointerType*>(Type::getInt8PtrTy(*ThisModuleContext));
}


void DiscoPoPOpenMP::setupCallbacks() {
  DPOMPInitialize = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPInitialize", 
      Void,
      // CharPtr,
      (Type*)0));

   DPOMPThreadCollector = cast<Function>(ThisModule->getOrInsertFunction("__CollectThreadInfo", 
      Void,
      // CharPtr,
      (Type*)0));

    DPOMPFinalize = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPFinalize", 
      Void,
      (Type*)0));

  DPOMPRead = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPRead",
    Void,
    Int64,
    CharPtr,
    Int32,
    Int32,
    Int32,
    (Type*)0));

  DPOMPWrite = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPWrite",
    Void,
    Int64,
    (Type*)0));

  DPOMPBeforeCall =cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPBeforeCall",
  Void,
  CharPtr,
  (Type*)0));

  DPOMPAfterCall=cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPAfterCall",
    Void,
    (Type*)0));
}

void DiscoPoPOpenMP::collectThreadInfo(Instruction *toInstrument)
{
  CallInst::Create(DPOMPThreadCollector,NULL,"",toInstrument);
}


bool DiscoPoPOpenMP::doInitialization(Module &M) {

  countCalls=0;
  ompRegionsUID=0;
  ThisModuleContext = &(M.getContext());
  ThisModule = &M;
  setupDataTypes();
  setupCallbacks();
  return true;
}


bool DiscoPoPOpenMP::instrument(Value *Ptr, Value *InstVal,
  const DataLayout &DL) {
  return true;
}



void DiscoPoPOpenMP::insertInitializeInst(Function &F){
  int32_t lid=0;
  if (F.hasName() && F.getName().equals("main")){ 

    for (inst_iterator i = inst_begin(F), e = inst_end(F); i != e; ++i)  
    {   
      Instruction *I = &*i;
      // DILocation *diLoc= I->getDebugLoc();
      // lid=diLoc->getLine();
      lid = getLID(I);
      if (lid>0&&!isa<PHINode>(I)){ 
        CallInst::Create(DPOMPInitialize,"", I);
        break;
      }
    }
  }

  // if (DILocation *Loc = I->getDebugLoc()) { // Here I is an LLVM instruction
  //     functionStartLineNumber = Loc->getLine();

  assert((lid > 0) && "Function entry is not instrumented because LID are all invalid for the entry block.");
}


void DiscoPoPOpenMP::insertFinalizeInst(Instruction *before){
    CallInst::Create(DPOMPFinalize, "", before);
}

void DiscoPoPOpenMP::instrumentStoreInst(Instruction *toInstrument)
{

  StoreInst *SI = cast<StoreInst>(toInstrument);
  Value *addr = PtrToIntInst::CreatePointerCast(SI->getPointerOperand(), Int64, "", SI);
  vector<Value*> args;
  args.push_back(addr);
 
  CallInst::Create(DPOMPWrite,args,"",toInstrument);
  // StringRef regName=toInstrument->getParent()->getParent()->getName().str(); 

  

  // if(regName.startswith(".omp")){
  //   // errs()<<"The parent is:"<<toInstrument->getParent()->getParent()->getName().str()<<"\n";
  //  CallInst::Create(DPOMPWrite,args,"",toInstrument);
  // }
 
  //Line ID TODO:
  //  int32_t lid=getLID(toInstrument);
  // if (lid==0)
  // {
  //   // errs()<<"store instruction no. " << StoresInstrumented<<" exited since there is no line number!"<<"\n";
  //   return;
  // }

 
  // vector<Value*> args;
  // args.push_back(ConstantInt::get(Int32,lid));
  // //Memory location refrenced by the instruction
  // Value* memAddr = PtrToIntInst::CreatePointerCast(cast<StoreInst>(toInstrument)->getPointerOperand(),
  //   Int64, "", toInstrument);
  // args.push_back(memAddr); 

  // IRBuilder<> builder(toInstrument);
  // string varName =determineVariableName(toInstrument);
  // // if (varName=="")
  // // {
  // //   varName="NO NAME";
  // // }
  // // errs()<<"The varname is:"<<varName<<"\n";
  // Value *vName = builder.CreateGlobalStringPtr(varName.c_str(), ".str");
  // args.push_back(vName);
  // CallInst::Create(DPOMPWrite,args,"",toInstrument);
}


void DiscoPoPOpenMP::instrumentLoadInst(Instruction *toInstrument){

  //New implementation
  vector<Value*> args;
  LoadInst *LI = cast<LoadInst>(toInstrument);
  IRBuilder<> IRB(toInstrument);
  // LLVMContext& C = toInstrument->getContext();
  // memAddr
  Value *addr = PtrToIntInst::CreatePointerCast(LI->getPointerOperand(), Int64, "", LI);
  //vairable size
  Value *vSize = ConstantInt::get(Int32, LI->getAlignment());
  
    StringRef regName=toInstrument->getParent()->getParent()->getName().str(); 
    int currrRegionId=-1;
    string s1 = regName;
  Value *absolutePathFileName = IRB.CreateGlobalStringPtr(s1, ".str");
  Function *currentRegion=toInstrument->getParent()->getParent();


  //TODO: Complete this part with extarcting the code regions

  //errs()<<"11\n";
  
  //int32_t fLID = Loc1
  //errs()<< decodeLID(Loc1->getLine()) << "\n";
 // 
  //inst_iterator I = inst_begin(currentRegion);
  //errs()<<"----------------------------" << (*I)->getDebugLoc()->getLine() << "\n";
  
  // BasicBlock& firstBB = *currentRegion->begin();

  string s = regName;
    // errs()<< "s: " <<s<< "\n";

  MDNode *mdnode = LI->getMetadata("dbg");
  StringRef File = "", Dir = "",lno= "";
  if (mdnode){
      DILocation *Loc = toInstrument->getDebugLoc();
      
      File = Loc->getFilename();
      Dir = Loc->getDirectory();
      lno =decodeLID(Loc->getLine());
      // + "§§" +lno.str()
      absolutePathFileName=IRB.CreateGlobalStringPtr((Dir.str() + "/" + File.str() + "::" + s + " line: " + to_string(functionStartLineNumber)).c_str(), ".str");
  }
  // if(regName.startswith(".omp"))
  // {

  //   if(currentRegion->getMetadata("omp.region.ID")==NULL)
  //   {
  //     MDBuilder MDHelper(currentRegion->getContext());
  //     SmallVector<Metadata *, 1> Vals;
  //     Vals.push_back(MDHelper.createString(to_string(ompRegionsUID++)));
  //     MDNode *N = MDNode::get(currentRegion->getContext(), Vals);
  //     currentRegion->setMetadata("omp.region.ID", N); 
  //   }
  //     currrRegionId = stoi(cast<MDString>(currentRegion->getMetadata("omp.region.ID")->getOperand(0))->getString());
  //     MDString *Tag = cast<MDString>(currentRegion->getMetadata("omp.region.ID")->getOperand(0));
  //     // errs()<<regName<< "\n";
  //     // errs()<< "==RegName: " <<s<< "\n";
  //     // errs()<<Tag->getString()<<"\n";
  // }
  // else if(regName.equals("main"))
  // {
  //   // errs()<<"Memory Read in MAIN function...\n";
  //   if(currentRegion->getMetadata("main.region.ID")==NULL)
  //   {
  //     MDBuilder MDHelper(currentRegion->getContext());
  //     SmallVector<Metadata *, 1> Vals;
  //     Vals.push_back(MDHelper.createString(to_string(ompRegionsUID++)));
  //     MDNode *N = MDNode::get(currentRegion->getContext(), Vals);
  //     currentRegion->setMetadata("main.region.ID", N); 
  //   }
  //     currrRegionId = stoi(cast<MDString>(currentRegion->getMetadata("main.region.ID")->getOperand(0))->getString());
  //     MDString *Tag = cast<MDString>(currentRegion->getMetadata("main.region.ID")->getOperand(0));
  //     // errs()<<regName<< "\n";
  //     // errs()<< "==RegName: " <<s<< "\n";
  //     // errs()<<Tag->getString()<<"\n";

  // }
  // else 
  // {
  //   // errs()<<"Memory Read in OTHER function\n";
  //   if(currentRegion->getMetadata("external.region.ID")==NULL)
  //   {
  //     MDBuilder MDHelper(currentRegion->getContext());
  //     SmallVector<Metadata *, 1> Vals;
  //     Vals.push_back(MDHelper.createString(to_string(ompRegionsUID++)));
  //     MDNode *N = MDNode::get(currentRegion->getContext(), Vals);
  //     currentRegion->setMetadata("external.region.ID", N); 
  //   }
  //     currrRegionId = stoi(cast<MDString>(currentRegion->getMetadata("external.region.ID")->getOperand(0))->getString());
  //     MDString *Tag = cast<MDString>(currentRegion->getMetadata("external.region.ID")->getOperand(0));
  //     // errs()<<regName<< "\n";
  //     // errs()<< "==RegName: " <<s<< "\n";
  //     // errs()<<Tag->getString()<<"\n";
  // }


  // MDBuilder MDHelper(currentRegion->getContext());
  // SmallVector<Metadata *, 1> Vals;
  // Vals.push_back(MDHelper.createString(to_string(ompRegionsUID++)));
  // MDNode *N = MDNode::get(currentRegion->getContext(), Vals);
  // currentRegion->setMetadata("omp.region.ID", N); 

  // currrRegionId = stoi(cast<MDString>(currentRegion->getMetadata("omp.region.ID")->getOperand(0))->getString());
  // MDString *Tag = cast<MDString>(currentRegion->getMetadata("omp.region.ID")->getOperand(0));

  args.push_back(addr);
  args.push_back(absolutePathFileName);
  args.push_back(vSize);  
  args.push_back(ConstantInt::get(Int32, 0));
  args.push_back(ConstantInt::get(Int32, 0));
  CallInst::Create(DPOMPRead, args, "", toInstrument);

}

bool DiscoPoPOpenMP::runOnFunction(Function &F) {
  determineFileID(F);
  insertInitializeInst(F);

    //int32_t lid = 0;

    for (inst_iterator i = inst_begin(F), e = inst_end(F); i != e; ++i) {
    Instruction *I = &*i;
    if (DILocation *Loc = I->getDebugLoc()) { // Here I is an LLVM instruction
      functionStartLineNumber = Loc->getLine();
      if (functionStartLineNumber > 0 && !isa<PHINode>(I)) {
        
        //errs()<< "000000000000 " << functionStartLineNumber << "\n";
        break;
      }
    }else
      continue;
    }


  // check HANDLE_MEMORY_INST in include/llvm/Instruction.def for memory
  // touching instructions
  for (inst_iterator i = inst_begin(F), e = inst_end(F); i != e; ++i) {
    Instruction *I = &*i;
    if (isa<LoadInst>(I))// || isa<StoreInst>(I) || isa<AtomicCmpXchgInst>(I) || isa<AtomicRMWInst>(I))
    {
      instrumentLoadInst(I);
    }
    else if (isa<StoreInst>(I))
    {
      if (!(I->getOperand(1)->getName().equals("retval")))
      {
        // errs()<<"In Store!"<< I->getOperand(1)->getName()<<"\n";
        instrumentStoreInst(I);
      }
    }
    else if(isa<AtomicCmpXchgInst>(I))
       errs()<<"ATOMIC DETECTED! \n";
    else if (isa<ReturnInst>(I)) {
        if (F.hasName() && F.getName().equals("main")) {   // returning from main
                insertFinalizeInst(I);
            }
      }
    if(isaCallOrInvoke(I)){
         instrumentCallInst(I, cast<CallInst>(I)->getCalledFunction()->getName());
      } 
    // else if (isa<ReturnInst>(I)) {
    //   if (F.hasName() && F.getName().equals("@.omp_outlined.")) {   // returning from main
    //           collectThreadInfo(I);
    //       }
    // }
  }

  return false;
}

void DiscoPoPOpenMP::instrumentCallInst(Instruction *toInstrument,StringRef regName){


  vector<Value*> args;
  CallInst *CI = cast<CallInst>(toInstrument);
  IRBuilder<> IRB(toInstrument);
 
  Value *absolutePathFileName = IRB.CreateGlobalStringPtr("No name attached", ".str");



  MDNode *mdnode = CI->getMetadata("dbg");
  StringRef File = "", Dir = "",lno= "";
  if (mdnode){
      DILocation *Loc = toInstrument->getDebugLoc();
      
      File = Loc->getFilename();
      Dir = Loc->getDirectory();
      lno =decodeLID(Loc->getLine());
      // + "§§" +lno.str()
      absolutePathFileName=IRB.CreateGlobalStringPtr((Dir.str() + "/" + File.str() + "::" +regName.str() + " line: " + lno.str()), ".str");
  }

  args.push_back(absolutePathFileName);

    //it creates a call "CUInstCallBefore" and inserts it before the toInstrument instruction
    CallInst::Create(DPOMPBeforeCall, args, "", toInstrument);

    //it first creates a call " " and then inserts it after the toInstrument instruction
    CallInst::Create(DPOMPAfterCall,"")->insertAfter(toInstrument); 

}


bool DiscoPoPOpenMP::isaCallOrInvoke(Instruction* BI) {

  StringRef name="";
  if ((BI != NULL) && ((isa<CallInst>(BI) && (!isa<DbgDeclareInst>(BI))) || isa<InvokeInst>(BI)))
  {
     if (cast<CallInst>(BI)->getCalledFunction())
      {
         name = cast<CallInst>(BI)->getCalledFunction()->getName();
         if (name.startswith("__kmpc"))
         {
           // errs()<<"NAME--->"<<name<<"\n";
           return true;
         }
         
      }
  }
  return false; 
}

int DiscoPoPOpenMP::getLID(Instruction* BI)
{
  

  int32_t lid = 0;
  int32_t lno =0;
  StringRef File = "", Dir = "";

  if (DILocation *Loc = BI->getDebugLoc()) { // Here I is an LLVM instruction
  lno = Loc->getLine();
  File = Loc->getFilename();
  Dir = Loc->getDirectory();
}
  if (lno == 0) {
    return 0;
  }

  if (fileID == 0)
  {
    // Get the new fileID.
    
    MDNode *N = BI->getMetadata("dbg");
    if (N == NULL)
    {
      // N == NULL means BI is only a helper instruction.
      // No metadata is attached to BI.
      return 0;
    }
    DILocation *Loc = BI->getDebugLoc();
     if (Loc) { // Here I is an LLVM instruction
      //lno = Loc->getLine();
      File = Loc->getFilename();
      Dir = Loc->getDirectory();
    }
    

    if (File.str().substr(0, 2) == "./")
    {
      std::string sub = File.str().substr(0, 2);
      File = File.substr(2, File.size() - 1);
    }

    fileID = getFileID(FileMappingPath, Dir.str() + "/" + File.str());

    // file is not in FileMapping.txt
    if (fileID == 0)
      return -1;
  }
  lid = (fileID << LIDSIZE) + lno;
  return lid;  
}
void DiscoPoPOpenMP::determineFileID(Function &F) {
  fileID = 0;

  // if FileMapping.txt is not given, we use 1 as file index
  if (!fexists(FileMappingPath))
  {
    fileID = 1;
  }
  else
  {
    for (Function::iterator FI = F.begin(), FE = F.end(); FI != FE; ++FI)
    {
      BasicBlock &BB = *FI;
      for (BasicBlock::iterator BI = BB.begin(), EI = BB.end(); BI != EI; ++BI)
      {
        if (BI->getDebugLoc().getLine())
        {
          MDNode *N = BI->getMetadata("dbg");
          // N == NULL means BI is only a helper instruction.
          // No metadata is attached to BI.
          if (N)
          {
            StringRef File = "", Dir = "";
            DILocation *Loc = BI->getDebugLoc();
            File = Loc->getFilename();
            Dir = Loc->getDirectory();

            char* absolutePathFileName = realpath((Dir.str() + "/" + File.str()).c_str(), NULL);

            if (absolutePathFileName == NULL)
            {
              absolutePathFileName = realpath(File.data(), NULL);
            }

            if (absolutePathFileName)
            {
              fileID = getFileID(FileMappingPath, string(absolutePathFileName));
              delete[] absolutePathFileName;
            }
            break;
          }
        }
      }
    }
  }
}

  inline string DiscoPoPOpenMP::decodeLID(int32_t lid) {
  if (lid == 0)
    return "*";

  stringstream ss;
  ss << (lid >> LIDSIZE) << ":" << lid % MAXLNO;
  return ss.str();
}

inline vector<string>* DiscoPoPOpenMP::split(string input, char delim) {
  vector<string>* substrings = new vector<string>();
  istringstream inputStringStream(input);
  string sub;
  
  while(getline(inputStringStream, sub, delim)) {
    substrings->push_back(sub); 
  }
  
  return substrings;
}

int32_t DiscoPoPOpenMP::getFileID(string fileMapping, string fullPathName) {
  int32_t index = 0; // if the associated file id is not found, then we return 0
  string line;
  ifstream fileMap(fileMapping.c_str());

  if (fileMap.is_open()) {
    vector<string>* substrings = NULL;
    while (getline(fileMap, line)) {
      substrings = split(line, '\t');
      if (substrings->size() == 2) {
        string indexString = (*substrings)[0];
        string fileName = (*substrings)[1];
        if (fileName.compare(fullPathName) == 0) {
          index = (int32_t)atoi(indexString.c_str());
          break;  
        }
      }
      substrings->clear();
      delete substrings;  
    }
    fileMap.close();
  }

  return index;
}

inline bool DiscoPoPOpenMP::fexists(const string& filename) {
  ifstream ifile(filename.c_str());
  return ifile;
}

string DiscoPoPOpenMP::get_exe_dir() {
  char buff[1024];
  ssize_t len = ::readlink("/proc/self/exe", buff, sizeof(buff)-1);
  if (len != -1) {
    buff[len] = '\0';
    string fullPath = std::string(buff);
    return fullPath.substr(0, fullPath.find_last_of('/'));
  }
  else {
    return "";     
  }
}

string DiscoPoPOpenMP::determineVariableName(Instruction* I) {
  

//   MDNode *meta = I->getMetadata("dbg");
//   if (DILocation *Loc = I->getDebugLoc()) { // Here I is an LLVM instruction
//   unsigned Line = Loc->getLine();
//   StringRef File = Loc->getFilename();
//   StringRef Dir = Loc->getDirectory();
//   errs()<<"The Dir is:"<<Dir<<"\n";
//   errs()<<"The filename is:"<<File<<"\n";
//   errs()<<"The line number is:"<<Line<<"\n";
// }

  
  // DILocation *Loc = I->getDebugLoc();
  // MDNode *meta=Loc->getScope();
  //DIVariable div(meta->getOperand());

  // StringRef File= div.getName();
  // DIType dit=div.getType(); 

  assert(I && "Instruction cannot be NULL \n");
  int index = isa<StoreInst>(I) ? 1 : 0;
  // errs()<<"The index is:"<<index<<"\n";
  Value* operand = I->getOperand(index);

  // StringRef VarName="";
  // DIVariable *DV;
  // DbgDeclareInst *DDI;
  // //DbgDeclareInst *DDI = dyn_cast<DbgDeclareInst>(I);
  // //Value* operand= DDI->getAddress();
   // errs() <<"VARNAME: "<<operand->getName()<<"\n";

  // if (isa<DbgDeclareInst>(I)) {
  //     DDI=dyn_cast<DbgDeclareInst>(I);
  //     DV = DDI->getVariable();
  //     VarName = DV->getName();
  //     errs() <<"VARNAME1"<<VarName<<"\n";
  // }
  // errs() <<"VARNAME1"<<VarName<<"\n";
 
  // if (operand->hasName())
  // {
  //   // errs() <<"Var name provided!\n";
  //   // DILocalVariable *DV = DDI->getVariable();
  //   // VarName = DV->getName();
  //   // errs() <<"VARNAME1"<<VarName<<"\n";
  //   // return VarName;
  // }
  
  IRBuilder<> builder(I);

  if (operand == NULL) {
    // errs() <<"VARNAME2"<<operand->getName()<<"\n";
    return getOrInsertVarName("", builder);
  }

  if (operand->hasName()) {
    // errs() <<"VARNAME3"<<operand->getName()<<"\n";
    //// we've found a global variable
    if (isa<GlobalVariable>(*operand)) {
      //MOHAMMAD ADDED THIS FOR CHECKING
      return string(operand->getName());
    }
    if (isa<GetElementPtrInst>(*operand)) {
      // errs() <<"VARNAME4"<<operand->getName()<<"\n";
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
        // errs() <<"VARNAME5"<<operand->getName()
        // <<"\n";
        return determineVariableName((Instruction*)ptrOperand);
      }
      return determineVariableName((Instruction*)gep);
    }
    return string(operand->getName().data());
    //return getOrInsertVarName(string(operand->getName().data()), builder);
  }

  if (isa<LoadInst>(*operand) || isa<StoreInst>(*operand)) {
    // errs()<<"This is called \n";
    return determineVariableName((Instruction*)(operand));
  }
  // if we cannot determine the name, then return *
  // errs() <<"NO VARNAME ATTACHED!"<<operand->getName()<<"\n";
  return "NO VARNAME ATTACHED";//getOrInsertVarName("*", builder);
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





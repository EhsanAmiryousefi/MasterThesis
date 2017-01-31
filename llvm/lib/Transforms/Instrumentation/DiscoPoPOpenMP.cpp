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
    // Basic types
    Type *Void;
    IntegerType *Int32, *Int64;
    PointerType *CharPtr;

    int32_t fileID;

    Function *DPOMPRead, *DPOMPWrite,*DPOMPInitialize,*DPOMPFinalize;

    IRBuilder<> *Builder;
    const DataLayout *TD;
    Function *LoadCheckFunction;
    //Function *StoreCheckFunction;
    Instruction *Inst;

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

    void instrumentLoadInst(Instruction *toInstrument);
    void instrumentStoreInst(Instruction *toInstrument);
    void insertInitializeInst(Function &F);
    void insertFinalizeInst(Instruction *before);


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
    /* function name
     * return value type
     * arg types
     * NULL
     */

  DPOMPInitialize = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPInitialize", 
      Void,
      // CharPtr,
      (Type*)0));

    DPOMPFinalize = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPFinalize", 
      Void,
      (Type*)0));

  DPOMPRead = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPRead",
    Void,
    // Int32,
    Int32,
    Int64,
    //CharPtr,
    //CharPtr,
    (Type*)0));

  DPOMPWrite = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPWrite",
    Void,
    // Int32,
    Int32,
    Int64,
            //CharPtr,
            //CharPtr,
    (Type*)0));

    // DPOMPWrite = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPWrite",
    //         Void,
    //         Int32,
    //         Int32,
    //         Int64,
    //         CharPtr,
    //         CharPtr,
    //         (Type*)0));

    // DPOMPCallBefore = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPCallBefore",
    //         Void,
    //         Int32,
    //         (Type*)0));

    // DPOMPCallAfter = cast<Function>(ThisModule->getOrInsertFunction("__DiscoPoPOpenMPCallAfter",
    //         Void,
    //         Int32,
    //         Int32,
    //         (Type*)0));
}

bool DiscoPoPOpenMP::doInitialization(Module &M) {

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
  if (F.hasName() && F.getName().equals("main")){
    int32_t lid = 0;  

    for (inst_iterator i = inst_begin(F), e = inst_end(F); i != e; ++i)  
    {   
      Instruction *I = &*i;
      lid = getLID(I);
      if (lid>0&&!isa<PHINode>(I)){ 
        CallInst::Create(DPOMPInitialize,"", I);
        break;
      }
    }
  }
  assert((lid > 0) && "Function entry is not instrumented because LID are all invalid for the entry block.");
}


void DiscoPoPOpenMP::insertFinalizeInst(Instruction *before){
    CallInst::Create(DPOMPFinalize, "", before);
}

void DiscoPoPOpenMP::instrumentStoreInst(Instruction *toInstrument)
{
  errs()<<"store instruction found: " << ++StoresInstrumented<<"\n";
  int32_t lid=getLID(toInstrument);
  if (lid==0)
  {
    errs()<<"store instruction no. " << StoresInstrumented<<" exited since there is no line number!"<<"\n";
    return;
  }
 
  vector<Value*> args;
  args.push_back(ConstantInt::get(Int32,lid));
  //Memory location refrenced by the instruction
  Value* memAddr = PtrToIntInst::CreatePointerCast(cast<StoreInst>(toInstrument)->getPointerOperand(),
    Int64, "", toInstrument);
  args.push_back(memAddr); 
  CallInst::Create(DPOMPWrite,args,"",toInstrument);
  errs()<<"End of "<<StoresInstrumented<<" store instruction! \n";
}


void DiscoPoPOpenMP::instrumentLoadInst(Instruction *toInstrument){
  errs()<<"Load instruction found: " << ++LoadsInstrumented<<"\n";
  int32_t lid=getLID(toInstrument);
  if (lid==0)
  {
    errs()<<"Load instruction no. " << LoadsInstrumented<<" exited since there is no line number!"<<"\n";
    return;
  }
  vector<Value*> args;
  args.push_back(ConstantInt::get(Int32, lid));
  Value* memAddr = PtrToIntInst::CreatePointerCast(cast<LoadInst>(toInstrument)->getPointerOperand(),
    Int64, "", toInstrument);
  args.push_back(memAddr); 
  CallInst::Create(DPOMPRead, args, "", toInstrument);
  errs()<<"End of "<<LoadsInstrumented<<" load instruction! \n";
}

bool DiscoPoPOpenMP::runOnFunction(Function &F) {
  determineFileID(F);
  insertInitializeInst(F);

  // check HANDLE_MEMORY_INST in include/llvm/Instruction.def for memory
  // touching instructions
  for (inst_iterator i = inst_begin(F), e = inst_end(F); i != e; ++i) {
    Instruction *I = &*i;
    if (isa<LoadInst>(I))// || isa<StoreInst>(I) || isa<AtomicCmpXchgInst>(I) || isa<AtomicRMWInst>(I))
    {
      instrumentLoadInst(I);
      errs()<<"The line Id is: " << decodeLID(getLID(I))<<"\n";
    }
    else if (isa<StoreInst>(I))
      instrumentStoreInst(I);
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





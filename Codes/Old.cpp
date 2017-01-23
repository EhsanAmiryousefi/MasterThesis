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


    class DiscoPoPOpenMP : public FunctionPass {
        public : 
   

    static char ID; 
    // DiscoPoPOpenMP() : ModulePass(ID) {};
    DiscoPoPOpenMP() : FunctionPass(ID) {};

    bool runOnFunction(Function &F) override {
       int counter =0;
       for(BasicBlock &bb : F) {
            for(Instruction &instr : bb) {
                if(isa<LoadInst>(instr)){
                    // for (Use &U : instr.operands()) {
                    //       if (Instruction *Inst = dyn_cast<Instruction>(U)) {
                    //         errs() << *Inst << "\n";
                    //       }
                    // }
                   errs() <<  "Load Instruction found: " <<instr<< "\n";
                   counter++;
                }
                if (isa<StoreInst>(instr))
                {
                    errs() <<"Store Instruction found: " <<instr << "\n";
                    counter++;
                }
            }
        }
      ++HelloCounter;
      errs() <<"Total No. of Instructions found: " <<counter << "\n";
      return false;
    }
  };
}


char DiscoPoPOpenMP::ID = 0;

INITIALIZE_PASS(DiscoPoPOpenMP, "DiscoPoPOpenMP", "analyze dependences", false, false)

FunctionPass *llvm::createDiscoPoPOpenMPPass() {
   initializeLoopInfoPass(*PassRegistry::getPassRegistry());
   return new DiscoPoPOpenMP();
  }

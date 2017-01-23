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

#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;

#define DEBUG_TYPE "Ehsan"

STATISTIC(HelloCounter, "Counts number of functions greeted");

namespace {
  // Hello - The first implementation, without getAnalysisUsage.
  struct Ehsan : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    Ehsan() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {
      ++HelloCounter;
      errs() << "Ehsan Pass 1 has found Function #" << HelloCounter << ":" ;
      errs().write_escaped(F.getName()) << '\n';
      return false;
    }
  };
}

char Ehsan::ID = 0;
static RegisterPass<Ehsan> X("Ehsan", "Hello world pass from Ehsan");

namespace {
  // Hello2 - The second implementation with getAnalysisUsage implemented.
  struct Ehsan2 : public FunctionPass {
    static char ID; // Pass identification, replacement for typeid
    Ehsan2() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {
      ++HelloCounter;
      errs() << "Hello World Pass From Ehsan Pass 2: ";
      errs().write_escaped(F.getName()) << '\n';
      return false;
    }
    // We don't modify the program, so we preserve all analyses.
    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesAll();
    }
  };
}


static RegisterPass<Ehsan2>
Y("Ehsan2", "Hello World Pass From Ehsan (with getAnalysis)" );

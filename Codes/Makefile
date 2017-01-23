comp:
	clang sourcefile.c -fopenmp -g -I ../build/projects/openmp/runtime/src/ -emit-llvm -S -o  output.bc

instm: comp
	opt -S -DiscoPoPOpenMP < output.bc > InstrumentedOutput.ll

iFunComp:
	clang++ -emit-llvm -c -std=c++11 -g ~/dp-clang-llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.cpp -o ~/dp-clang-llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll

compExec:
	clang++ InstrumentedOutput.ll ~/dp-clang-llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll -o outputname

exec:
	./outputname

clean:
	rm -f outputname InstrumentedOutput.ll output.bc

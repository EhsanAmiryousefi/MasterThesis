comp:
	/home/amiryousefi/repbuild/bin/clang sourcefile.c -fopenmp -g -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -emit-llvm -S -o  output.ll

instm: comp
	/home/amiryousefi/repbuild/bin/opt -S -dpomp < output.ll > InstrumentedOutput.ll

iFunComp:
	/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll

compExec:
	/home/amiryousefi/repbuild/bin/clang++ InstrumentedOutput.ll /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll -o outputname

exec:
	./outputname

clean:
	rm -f outputname InstrumentedOutput.ll output.bc

comp:
	/home/amiryousefi/buildforinstm/bin/clang sourcefile.c -fopenmp -O0 -g -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -emit-llvm -S -o  output.ll

instm:comp
	/home/amiryousefi/repbuild/bin/opt -S -dpomp < output.ll > InstrumentedOutput.ll

iFunComp:#instm
	/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll

compExec:iFunComp
	/home/amiryousefi/repbuild/bin/clang++ -fopenmp  InstrumentedOutput.ll  /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll -o outputname

exec:compExec
	./outputname

clean:
	rm -f outputname InstrumentedOutput.ll output.ll output.bc outputname_DiscoPoPOpenMPResult.txt

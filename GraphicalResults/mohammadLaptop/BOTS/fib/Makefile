openmpClang = /media/norouzi/90cafd61-f918-48a5-9298-db353cb6be30/software/llvm-3.8/build
comp:clean
	$(openmpClang)/bin/clang bots_common.c -fopenmp -c -O0 -g -I $(openmpClang)/projects/openmp/runtime/src/ -emit-llvm -o  bots_common.bc
	$(openmpClang)/bin/clang bots_main.c -fopenmp -c -O0 -g -I $(openmpClang)/projects/openmp/runtime/src/ -emit-llvm -o  bots_main.bc
	$(openmpClang)/bin/clang fib.c -fopenmp -c -O0 -g -I $(openmpClang)/projects/openmp/runtime/src/ -emit-llvm -o  fib.bc

	$(openmpClang)/bin/llvm-link bots_common.bc bots_main.bc fib.bc -o  fib-full.bc
	$(openmpClang)/bin/clang++ bots_common.bc bots_main.bc fib.bc -fopenmp -O0 -g -o fib-full

instm:comp
	/home/norouzi/Desktop/software/llvmTemp/build/bin/opt -S -dpomp < fib-full.bc > InstrumentedFib-full.bc

iFunComp:instm
	/home/norouzi/Desktop/software/llvmTemp/build/bin/clang++ -emit-llvm -fopenmp -I /home/norouzi/Desktop/software/llvmTemp/build/projects/openmp/runtime/src/ -c -std=c++11 -g /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.cpp -o /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.ll
	/home/norouzi/Desktop/software/llvmTemp/build/bin/clang++ -emit-llvm -fopenmp -I /home/norouzi/Desktop/software/llvmTemp/build/projects/openmp/runtime/src/ -c -std=c++11 -g /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.cpp -o /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.ll
	/home/norouzi/Desktop/software/llvmTemp/build/bin/clang++ -emit-llvm -fopenmp -I /home/norouzi/Desktop/software/llvmTemp/build/projects/openmp/runtime/src/ -c -std=c++11 -g /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.cpp -o /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.ll
	/home/norouzi/Desktop/software/llvmTemp/build/bin/clang++ -emit-llvm -fopenmp -I /home/norouzi/Desktop/software/llvmTemp/build/projects/openmp/runtime/src/ -c -std=c++11 -g /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.cpp -o /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.ll
	/home/norouzi/Desktop/software/llvmTemp/build/bin/clang++ -emit-llvm -fopenmp -I /home/norouzi/Desktop/software/llvmTemp/build/projects/openmp/runtime/src/ -c -std=c++11 -g /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.cpp -o /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll
	/home/norouzi/Desktop/software/llvmTemp/build/bin/llvm-link  /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.ll  /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.ll /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.ll /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.ll /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll -o /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions-final.ll
compExec:iFunComp
	/home/norouzi/Desktop/software/llvmTemp/build/bin/clang++ -fopenmp  InstrumentedFib-full.bc  /home/norouzi/Desktop/software/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions-final.ll -o outputname

exec:compExec
	./outputname

clean:
	rm -f *.bc  *-full

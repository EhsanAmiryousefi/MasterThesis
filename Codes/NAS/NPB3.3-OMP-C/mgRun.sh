cd ./bin/
rm -R mg/ 
cd ../MG/
make clean
cd ../
make mg CLASS=S
cd bin/
mkdir mg/
mv mg.S.bc mg/
cd mg/
/home/amiryousefi/llvmTemp/build/bin/opt -S -dpomp < mg.S.bc > mg.S_DpOMPInstrumented.bc

/home/amiryousefi/llvmTemp/build/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/llvmTemp/build/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.cpp -o /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.ll
/home/amiryousefi/llvmTemp/build/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/llvmTemp/build/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.cpp -o /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.ll
/home/amiryousefi/llvmTemp/build/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/llvmTemp/build/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.cpp -o /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.ll
/home/amiryousefi/llvmTemp/build/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/llvmTemp/build/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.cpp -o /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.ll
/home/amiryousefi/llvmTemp/build/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/llvmTemp/build/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.cpp -o /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll
/home/amiryousefi/llvmTemp/build/bin/llvm-link  /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.ll  /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.ll /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.ll /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.ll /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll -o /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions-final.ll

/home/amiryousefi/llvmTemp/build/bin/clang++ -fopenmp  mg.S_DpOMPInstrumented.bc  /home/amiryousefi/llvmTemp/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions-final.ll -o mg.S_DpOMPInstrumented

./mg.S_DpOMPInstrumented

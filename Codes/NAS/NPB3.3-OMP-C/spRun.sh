cd ./bin/
rm -R sp/ 
cd ../sp/
make clean
cd ../
make sp CLASS=S
cd bin/
mkdir sp/
mv sp.S.bc sp/
cd sp/
#/home/amiryousefi/repbuild/bin/opt -S -dpomp < sp.S.bc > sp.S_DpOMPInstrumented.bc
/home/amiryousefi/repbuild/bin/opt -S -dpomp < sp.S.bc > sp.S_DpOMPInstrumented.bc

/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.ll
/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.ll
/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.ll
/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.ll
/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll
/home/amiryousefi/repbuild/bin/llvm-link  /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.ll  /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.ll /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.ll /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.ll /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions-final.ll

/home/amiryousefi/repbuild/bin/clang++ -fopenmp  sp.S_DpOMPInstrumented.bc  /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions-final.ll -o sp.S_DpOMPInstrumented

./sp.S_DpOMPInstrumented
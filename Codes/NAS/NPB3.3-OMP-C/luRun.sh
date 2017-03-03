cd ./bin/
rm -R lu/ 
cd ../lu/
make clean
cd ../
make lu CLASS=S
cd bin/
mkdir lu/
mv lu.S.bc lu/
cd lu/
/home/amiryousefi/repbuild/bin/opt -S -dpomp < lu.S.bc > lu.S_DpOMPInstrumented.bc

/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.ll
/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.ll
/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.ll
/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.ll
/home/amiryousefi/repbuild/bin/clang++ -emit-llvm -fopenmp -I /home/amiryousefi/repbuild/projects/openmp/runtime/src/ -c -std=c++11 -g /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.cpp -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll
/home/amiryousefi/repbuild/bin/llvm-link  /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/murmur.ll  /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bitvector.ll /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/bloom.ll /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/signature.ll /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions.ll -o /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions-final.ll

/home/amiryousefi/repbuild/bin/clang++ -fopenmp  lu.S_DpOMPInstrumented.bc  /home/amiryousefi/MasterThesis/llvm/projects/compiler-rt/lib/DiscoPoPOpenMP/iFunctions-final.ll -o lu.S_DpOMPInstrumented

./lu.S_DpOMPInstrumented
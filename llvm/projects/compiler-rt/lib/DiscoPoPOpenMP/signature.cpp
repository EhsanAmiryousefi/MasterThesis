#include "signature.h"
#include "stdint.h"
#include <iostream>

using namespace std;

namespace __DpOMP{

void ReadSignature::insert(int64_t elem, pid_t systid) {
    uint64_t pos  = SimpleMurmurHash64A(&elem, 8, (0xdeadbeef * 16)) % numSlot_sig;
    TwoLevel_sigMem[pos].add(systid);
}

bool ReadSignature::membershipCheck(int64_t elem, pid_t systid) {
    uint64_t pos = SimpleMurmurHash64A(&elem, 8, (0xdeadbeef * 16)) % numSlot_sig;

    return TwoLevel_sigMem[pos].lookup(systid);
}

void ReadSignature::clearAccesses(int64_t elem) {
    uint64_t pos = SimpleMurmurHash64A(&elem, 8, (0xdeadbeef * 16)) % numSlot_sig;
    TwoLevel_sigMem[pos].clear();
}

///////////////////////////////////////////////////////
///////////////////////////////////////////////////////

void WriteSignature::insert(int64_t elem, pid_t systid) {

    
    uint64_t pos = SimpleMurmurHash64A(&elem, 8, (0xdeadbeef * 16)) % numSlot;
    // cout<<"Write enter"<<elem<<endl;
    OneLevel_sigMem[pos].store(systid);
}

pid_t WriteSignature::membershipCheck(int64_t elem) {
    uint64_t pos = SimpleMurmurHash64A(&elem, 8, (0xdeadbeef * 16)) % numSlot;

    return OneLevel_sigMem[pos].load();
}

} //namespace __pe

// Byte wise signature


#ifndef _DpOMP_SIGNATURE_H_
#define _DpOMP_SIGNATURE_H_

#include <stdint.h>
#include <atomic>
#include <sys/types.h>
#include <assert.h>
#include <iostream>
#include <string>
#include <utility> 
#include <unordered_map>
#include <set>
#include "PEUtils.h"
#include "bloom.h"
#include "murmur.h"

using namespace std;

namespace __DpOMP{

class ReadSignature {
public:
    ReadSignature(int32_t sizeL1, int32_t sizeL2, double bfFpRate) :
        numSlot_sig(sizeL1), numSlot_bf(sizeL2), TwoLevel_sigMem(sizeL1, BloomFilter(bfFpRate, sizeL2))
    {
        //TwoLevel_sigMem = new BloomFilter(bfFpRate, numSlot_bf)[sizeL1];
    }

    ~ReadSignature() {
        TwoLevel_sigMem.clear();
    }

    void insert(int64_t elem, pid_t systid = -1);
    bool membershipCheck(int64_t elem, pid_t systid);
    void clearAccesses(int64_t elem);

private:
    int32_t numSlot_sig, numSlot_bf;
    std::vector<BloomFilter> TwoLevel_sigMem;
};


class WriteSignature {
public:
    WriteSignature(int32_t size) :
        numSlot(size)
    {
        OneLevel_sigMem = new std::atomic<pid_t>[numSlot];
    }

    ~WriteSignature() {
        delete[] OneLevel_sigMem;
    }

    void insert(int64_t elem, pid_t systid = -1);
    pid_t membershipCheck(int64_t elem);

private:
    int32_t numSlot;
    std::atomic<pid_t> *OneLevel_sigMem;
};

} // namespace __pe
#endif

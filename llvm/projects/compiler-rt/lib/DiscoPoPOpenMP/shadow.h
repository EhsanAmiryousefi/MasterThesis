#ifndef _PE_SHADOW_MEMORY_H_
#define _PE_SHADOW_MEMORY_H_

#include "signature.h"
#include <stdint.h>
#include <iostream>

using namespace std;

namespace __DpOMP{

class ShadowMemory {
public:
    ShadowMemory(int32_t size) {
        sigRead = new Signature(size);
        sigWrite = new Signature(size);
    }

    ~ShadowMemory() {
        delete sigRead;
        delete sigWrite;
    }

    inline bool testInRead(int64_t memAddr, pid_t systid) {
        return sigRead->membershipCheck2(memAddr, systid);
    }

    // inline std::pair<bool, pid_t> testInRead(int64_t memAddr, uint64_t timeStamp = 0) {
    //     return sigRead->membershipCheck(memAddr, timeStamp);
    // }

    inline pid_t testInWrite(int64_t memAddr) {
        return sigWrite->membershipCheck(memAddr);
    }

    inline pid_t insertToRead(int64_t memAddr, pid_t systid = -1) {
        return sigRead->insert(memAddr, systid);
    }

    inline pid_t insertToWrite(int64_t memAddr, pid_t systid) {
        return sigWrite->insert(memAddr, systid);
    }
    inline void clearAccessRead(int64_t memAddr) {
        sigRead->clearAccesses(memAddr);
    }

private:
    Signature* sigRead;
    Signature* sigWrite;
};

} // namespace __pe
#endif

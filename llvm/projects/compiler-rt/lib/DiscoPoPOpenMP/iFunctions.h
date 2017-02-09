#ifndef _PE_IFUNCTIONS_H_
#define _PE_IFUNCTIONS_H_

#include <algorithm>
#include <atomic>
#include <chrono>
#include <cstdlib>
#include <pthread.h>
#include <queue>
#include <set>
#include <stack>
#include <sys/syscall.h>
#include <sys/types.h>
#include <unordered_map>
#include <map>
#include <unordered_set>
#include <utility>
#include <string.h>
#include "signature.h"
#include "PEUtils.h"
//#include "LockFree.h"

#define CACHE_LINE_SIZE 64

namespace __DpOMP{

/******* Data structures *******/


struct DepsMatrix {
    private:
        std::map<pid_t, std::map<pid_t, std::atomic<int64_t> > > * matrixAll;
        std::map<std::string, std::map<pid_t, std::map<pid_t, std::atomic<int64_t> > > > * matrixLoops;

        std::map<std::string, std::atomic<int32_t> > * loopParentMap;
        std::vector<pid_t>* listOfTidKeys;

        std::atomic_flag memAccessLock;
        std::atomic_flag newThreadLock;

    public:
        DepsMatrix() :memAccessLock(ATOMIC_FLAG_INIT), newThreadLock(ATOMIC_FLAG_INIT)
        {
            matrixAll = new std::map<pid_t, std::map<pid_t, std::atomic<int64_t> > >;
            matrixLoops = new std::map<std::string, std::map<pid_t, std::map<pid_t, std::atomic<int64_t> > > >;
            loopParentMap = new std::map<std::string, std::atomic<int32_t> >;
            listOfTidKeys = new std::vector<pid_t>;
        }
        inline void set(pid_t row, pid_t column, std::string prefixFName, int32_t volume, int32_t loopID, int32_t parentLoopID){
            while (memAccessLock.test_and_set(std::memory_order_acquire));  // acquire lock; // spin
            (*matrixAll)[row][column] += volume;
            if(loopID >= 0){
                std::string loopKey = prefixFName + "::" + std::to_string(loopID);
                (*matrixLoops)[loopKey][row][column] += volume;
                (*loopParentMap)[loopKey] = parentLoopID;
            }
            memAccessLock.clear(std::memory_order_release);
        }

        inline void addNewTid(pid_t tid){
            while (newThreadLock.test_and_set(std::memory_order_acquire));
            listOfTidKeys->push_back(tid);
            cout << "New Thread: " << tid << endl;
            newThreadLock.clear(std::memory_order_release);
        }

        inline void print(ofstream *out, int32_t maxSize){
            *out << "# of threads: " << maxSize << endl;

            // for(auto it = (*matrixAll).begin(); it != (*matrixAll).end(); ++it) {
            //     listOfTidKeys->push_back(it->first);
            //     cout << it->first << "\n";
            // }
            sort(listOfTidKeys->begin(), listOfTidKeys->end());
            //Printing Whole matrix
            cout << "Printing whole matrix" << endl;
            for(auto it1=listOfTidKeys->begin()+1; it1 != listOfTidKeys->end(); ++it1)
            {
                cout << *it1 << " ";
                if( (*matrixAll).count(*it1) ){
                    for(auto it2=listOfTidKeys->begin()+1; it2 != listOfTidKeys->end(); ++it2){
                        if((*matrixAll)[*it1].count(*it2)){
                            *out << (*matrixAll)[*it1][*it2] << " ";
                        }
                        else
                            *out << 0 << " ";
                    }
                    *out << endl;
                }
                else{
                    for(auto itn=listOfTidKeys->begin(); itn != listOfTidKeys->end(); ++itn)
                        *out << 0 << " ";
                    *out << endl;
                }
            }
            *out << endl;
            // Printing each loop's matrix
            cout << "Printing loops matrix" << endl;
            for(auto iter = (*matrixLoops).begin(); iter != (*matrixLoops).end(); iter++){
                *out << (*loopParentMap)[iter->first] << " |--> " << iter->first << endl;
                for(auto it1=listOfTidKeys->begin()+1; it1 != listOfTidKeys->end(); ++it1)
                {
                    if( (*matrixLoops)[iter->first].count(*it1) ){
                        for(auto it2=listOfTidKeys->begin()+1; it2 != listOfTidKeys->end(); ++it2){
                            if( (*matrixLoops)[iter->first][*it1].count(*it2) ){
                                *out << (*matrixLoops)[iter->first][*it1][*it2] << " ";
                            }
                            else
                                *out << 0 << " ";
                        }
                        *out << endl;
                    }
                    else{
                        for(auto itn=listOfTidKeys->begin()+1; itn != listOfTidKeys->end(); ++itn)
                            *out << 0 << " ";
                        *out << endl;
                    }
                }
                *out << endl;
            }
        }
};

//typedef std::unordered_map<pid_t, BloomFilter*> BloomFilterThreads;
//typedef WRRMMap<pid_t, BloomFilter*> BloomFilterThreads;
/******* Helper functions *******/
void outputDeps();
void outputLoops();
void outputFuncs();
void readRuntimeInfo();
// void initParallelization();
// void* analyzeDeps(void* arg);
// void addAccessInfo(bool isRead, char* var, ADDR addr, int32_t varSize, int32_t loopID);
// void finalizeParallelization();

/******* Instrumentation functions *******/
extern "C"{
    //void __pe_load(ADDR addr, char* fileName, int32_t varSize, int32_t loopID, int32_t parentLoopID)
void __DiscoPoPOpenMPRead(ADDR addr, char* fileName, int32_t varSize, int32_t loopID, int32_t parentLoopID);
void __DiscoPoPOpenMPWrite(int32_t lid, ADDR addr, char* varName);
void __DiscoPoPOpenMPFinalize();
void __DiscoPoPOpenMPInitialize();
}
} // namespace __pe

#endif

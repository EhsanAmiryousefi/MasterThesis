#ifndef _DpOMP_IFUNCTIONS_H_
#define _DpOMP_IFUNCTIONS_H_

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
#include "omp.h"
//#include "LockFree.h"

#define CACHE_LINE_SIZE 64

namespace __DpOMP{



struct DepsMatrix {
    private:

/******* Data structures *******/
        std::map<pid_t, std::map<pid_t, std::atomic<int64_t> > > * matrixAll;
        std::map<std::string, std::map<pid_t, std::map<pid_t, std::atomic<int64_t> > > > * matrixRegions;

        std::map<std::string, std::map<pid_t, std::map<pid_t, string > > > * localityMatrix;


        std::map<std::string, std::map<int32_t,double[2]>> *regionTemporalInfo;

        std::map<std::string, std::atomic<int32_t> > * regionIdsMap;
        std::vector<pid_t>* listOfTidKeys;

        std::atomic_flag memAccessLock;
        std::atomic_flag newThreadLock;

        std::atomic_flag temporalInfoLock;

        std::set<string> memoryAddresses;


        std::map<std::string, std::map<pid_t, std::map<pid_t, string > > > * memoryAccesTimeMatrix;
        long logicalMemoryAccessTimeCounter;

        std::map<std::string,std::string>  memAddr;
        long memoryAddressCounter;
        std::atomic_flag timeLock; 

    public:
        // Initialize the data structures
        DepsMatrix() : memAccessLock ATOMIC_FLAG_INIT, newThreadLock ATOMIC_FLAG_INIT, temporalInfoLock ATOMIC_FLAG_INIT, timeLock ATOMIC_FLAG_INIT
        {
            matrixAll = new std::map<pid_t, std::map<pid_t, std::atomic<int64_t> > >;
            matrixRegions = new std::map<std::string, std::map<pid_t, std::map<pid_t, std::atomic<int64_t> > > >;
            localityMatrix= new std::map<std::string, std::map<pid_t, std::map<pid_t, string > > >;
            regionIdsMap = new std::map<std::string, std::atomic<int32_t> >;
            listOfTidKeys = new std::vector<pid_t>;

            regionTemporalInfo=new  std::map<std::string, std::map<int32_t,double[2]>>;

           // memAddr=new std::map<std::string, std::string>;
            memoryAddressCounter=0;

            //Logical Memory access time counter, for each memory access, it is increased by 1
            logicalMemoryAccessTimeCounter=0;
            memoryAccesTimeMatrix= new std::map<std::string, std::map<pid_t, std::map<pid_t, string > > >;
        }
        // Implement data collection methods
        inline void set(pid_t row, pid_t column, std::string prefixFName, int32_t volume, int32_t regionId, int32_t parentRegionID, ADDR addr){

            while (memAccessLock.test_and_set(std::memory_order_acquire));  // acquire lock; // spin
            (*matrixAll)[row][column] += volume;
            if(regionId >= 0){
                std::string regionKey = prefixFName; 
                // cout << "---------" << prefixFName << "\n";
                (*matrixRegions)[regionKey][row][column] += volume;
                (*regionIdsMap)[regionKey] = regionId;


                std::string address= std::to_string(addr);
               
                //the LocalityInfo data to be added to its data structure 
                if ((memAddr)[address].empty())
                {
                    // cout<<"Memory is empty!  "<<address<<endl;
                    memAddr[address]=std::to_string(memoryAddressCounter++);
                    // cout<<"Value added to memory"<<(memAddr)[address]<<endl;
                }

                string value=(*localityMatrix)[regionKey][row][column];
                if(value.empty())
                {
                    value="$";
                    value +=(memAddr)[address];
                }
                else
                    value+=","+ (memAddr)[address];

                (*localityMatrix)[regionKey][row][column]=value;


                //Extract logical times of the memory accesses
                string oldTimeValue=(*memoryAccesTimeMatrix)[regionKey][row][column];
                if(oldTimeValue.empty())
                {
                    oldTimeValue="$";
                    oldTimeValue +=std::to_string(++logicalMemoryAccessTimeCounter);
                }
                else
                    oldTimeValue+=","+ std::to_string(++logicalMemoryAccessTimeCounter);

                
                while (timeLock.test_and_set(std::memory_order_acquire));  
                // cout<<"Memory access time!  "<<oldTimeValue<<endl;
                (*memoryAccesTimeMatrix)[regionKey][row][column]=oldTimeValue;          
                timeLock.clear(std::memory_order_release);

            }

            memAccessLock.clear(std::memory_order_release);
        }

        inline void addNewTid(pid_t tid){
            while (newThreadLock.test_and_set(std::memory_order_acquire));
            listOfTidKeys->push_back(tid);
            // cout << "New Thread: " << tid << endl;
            newThreadLock.clear(std::memory_order_release);
        }

         inline void setEnterRegionTemporalInfo(string regName,int threadId){
            // std::chrono::time_point<std::chrono::system_clock> start;
            // start = std::chrono::system_clock::now();
            // cout << "Start Time for "<<regName<<": " <<to_string(start)<< '\n';
            while (temporalInfoLock.test_and_set(std::memory_order_acquire));
            double begin = omp_get_wtime();
            (*regionTemporalInfo)[regName][threadId][0]=begin;
            // cout<<"START:"<<to_string(begin)<<endl;
            temporalInfoLock.clear(std::memory_order_release);

         }

          inline void setExitRegionTemporalInfo(string regName,int threadId){
            while (temporalInfoLock.test_and_set(std::memory_order_acquire));
            double end = omp_get_wtime();
            (*regionTemporalInfo)[regName][threadId][1]=end;
            temporalInfoLock.clear(std::memory_order_release);
         }

         inline void printTemporalInfo(ofstream *out){
            cout<<"Writing temoral info to the file TemporalInfo.txt ..."<<endl;
            *out << "==================================================================================="<< endl;
            *out << "                       The overal extracted temporal info "<< endl;
            *out << "==================================================================================="<< endl;
           
             for(auto &outerMap : *regionTemporalInfo)
             {
                *out << "*********************************************************************************************************"  << endl;
                *out << "Region Location:"<<outerMap.first<< endl;
                *out << "*********************************************************************************************************"  << endl;
                for(auto & innerMap :outerMap.second)
                {
                    *out << "Thread ID: "<<innerMap.first<<" ====> ";
                    *out<<"[Enter Time]: "<<innerMap.second[0];
                    *out<<" ----[Exit Time]: "<<innerMap.second[1];
                    *out<<" ----[Elapsed Time]: "<<innerMap.second[1]-innerMap.second[0]<<endl;
                    *out<<endl;
                }
             }

        }

        inline void printLocalityInfo(ofstream *out)
        {
            *out << "$The locality matrix between threads "  << endl;

            sort(listOfTidKeys->begin(), listOfTidKeys->end());
            // Printing each loop's matrix
            cout<<"Writing the locality matrix between threads to the file LocalityInfo.txt ..." << endl;
            for(auto iter = (*localityMatrix).begin(); iter != (*localityMatrix).end(); iter++){
                *out << "#Region Location" << " |--> " << iter->first << endl;
                for(auto it1=listOfTidKeys->begin(); it1 != listOfTidKeys->end(); ++it1)
                {
                    if( (*localityMatrix)[iter->first].count(*it1) ){
                        for(auto it2=listOfTidKeys->begin(); it2 != listOfTidKeys->end(); ++it2){
                            if( (*localityMatrix)[iter->first][*it1].count(*it2) ){
                                *out << (*localityMatrix)[iter->first][*it1][*it2] << " ";
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
            }
        }

        inline void printMemoryAccessTimeInfo(ofstream *out)
        {
            *out << "$The Memory Access Time matrix between threads "  << endl;

            sort(listOfTidKeys->begin(), listOfTidKeys->end());
            // Printing each loop's matrix
            cout<<"Writing memory access time matrix between threads matrices to the file MemoryAccessTimeInfo.txt ..." << endl;
            for(auto iter = (*memoryAccesTimeMatrix).begin(); iter != (*memoryAccesTimeMatrix).end(); iter++){
                *out << "#Region Location" << " |--> " << iter->first << endl;
                for(auto it1=listOfTidKeys->begin(); it1 != listOfTidKeys->end(); ++it1)
                {
                    if( (*memoryAccesTimeMatrix)[iter->first].count(*it1) ){
                        for(auto it2=listOfTidKeys->begin(); it2 != listOfTidKeys->end(); ++it2){
                            if( (*memoryAccesTimeMatrix)[iter->first][*it1].count(*it2) ){
                                *out << (*memoryAccesTimeMatrix)[iter->first][*it1][*it2] << " ";
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
            }
        }

        inline void print(ofstream *out, int32_t maxSize){
            *out << "$ Number of threads: " << maxSize << endl;
            *out << "#The overall communication matrix between threads "  << endl;

         
            sort(listOfTidKeys->begin(), listOfTidKeys->end());
            //Printing Whole matrix
            cout << "Writing the overall matrix to file Output.txt..." << endl;
            for(auto it1=listOfTidKeys->begin(); it1 != listOfTidKeys->end(); ++it1)
            {
                cout << *it1 << " ";
                if( (*matrixAll).count(*it1) ){
                    for(auto it2=listOfTidKeys->begin(); it2 != listOfTidKeys->end(); ++it2){
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
            cout<<endl<< "Writing Region's matrices to the file Output.txt..." << endl;
            for(auto iter = (*matrixRegions).begin(); iter != (*matrixRegions).end(); iter++){
                *out << "#Region Location" << " |--> " << iter->first << endl;
                for(auto it1=listOfTidKeys->begin(); it1 != listOfTidKeys->end(); ++it1)
                {
                    if( (*matrixRegions)[iter->first].count(*it1) ){
                        for(auto it2=listOfTidKeys->begin(); it2 != listOfTidKeys->end(); ++it2){
                            if( (*matrixRegions)[iter->first][*it1].count(*it2) ){
                                *out << (*matrixRegions)[iter->first][*it1][*it2] << " ";
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
            }
        }
};


/******* Helper functions *******/
void outputDeps();
void outputLoops();
void outputFuncs();
void readRuntimeInfo();


/******* Instrumentation functions *******/
extern "C"{
    //void __pe_load(ADDR addr, char* fileName, int32_t varSize, int32_t loopID, int32_t parentLoopID)
void __DiscoPoPOpenMPRead(ADDR addr, int32_t varSize, int32_t regionId, int32_t parentRegionID, char* varName);
void __DiscoPoPOpenMPWrite(ADDR addr, char* varName);
void __DiscoPoPOpenMPFinalize();
void __DiscoPoPOpenMPInitialize();
}
} 

#endif

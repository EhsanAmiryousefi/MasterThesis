#include <stdio.h>
#include <thread>
#include "iFunctions.h"
#include "omp.h"


using namespace std;
using namespace peutil;

bool DpOMP_DEBUG = true;                          // debug flag

namespace __DpOMP {

    int32_t currentRegID=0;
    thread_local string currentRegName="NULL";
    stack<string> *parentRegionStack;

    std::atomic_flag stackLock; 

    bool peInited = false;                          // library initialization flag
    int32_t SIG_NUM_ELEM = 6000000;
    int32_t BF_NUM_ELEM = 32;
    double BF_FP_RATE = 0.0001;

    DepsMatrix* depsMatrix = nullptr;
    ofstream *out;
    ofstream *writeTempInfo;

    ReadSignature* RSig = nullptr;
    WriteSignature* WSig = nullptr;

    /******* BEGIN: parallelization section *******/

    int numberOfHwThreads(0);               // this variable is used to map system thread-ids to our thread-ids
    pid_t mainTid;                                  // main program thread ID
    thread_local pid_t currentThreadId = -1;         // system thread id for each thread

    /******* END: parallelization section *******/

/******* Helper functions *******/
void outputDeps() {
    assert((depsMatrix!= nullptr) && "Dep map is not available!");
    if (DpOMP_DEBUG) {
        cout << "BEGIN: Printing Output.txt file... \n";
    }
    // print out all dps
    depsMatrix->print(out, numberOfHwThreads);
    depsMatrix->printTemporalInfo(writeTempInfo);
}
void readRuntimeInfo() {
    ifstream conf(get_exe_dir() + "/DpOMP.conf");
    string line;
    if (conf.is_open()) {
        auto func = [](char c){ return (c == ' ');};
        vector<string>* substrings = nullptr;
        while (getline(conf, line)) {
            substrings = split(line, '=');
            if (substrings->size() == 2) {
                string variable = (*substrings)[0];
                string value    = (*substrings)[1];
                variable.erase(std::remove_if( variable.begin(), variable.end(), func), variable.end());
                value.erase(std::remove_if( value.begin(), value.end(), func), value.end());

                double doubleValue = (double)atof(value.c_str());
                if (doubleValue > 0) {
                    if (variable.compare("DpOMP_DEBUG") == 0) {
                        DpOMP_DEBUG = true;
                    }
                    else if (variable.compare("SIG_NUM_ELEM") == 0) {
                        SIG_NUM_ELEM = (int32_t)doubleValue;
                    }
                    else if (variable.compare("BF_NUM_ELEM") == 0) {
                        BF_NUM_ELEM = (int32_t)doubleValue;
                    }
                    else if (variable.compare("BF_FP_RATE") == 0) {
                        BF_FP_RATE = doubleValue;
                    }
                }
            }
            substrings->clear();
            delete substrings;
        }
    }

    if (DpOMP_DEBUG) {
        cout << "BF_FP_RATE = " << BF_FP_RATE << "\n";
        cout << "Signature slots = " << SIG_NUM_ELEM << "\n";
    }
}

/******* END Helper functions *******/


void initThreadPool(int numberOfThreads)
{
    for (int i = 0; i < numberOfThreads; i++)
    {
        depsMatrix->addNewTid(i);
        // parentRegionStack[i].push("EHSAN THREAD");
    }
    
}

/******* Instrumentation functions *******/

//The wrapper is to avoid mangling
extern "C"{

void __DiscoPoPOpenMPInitialize(){
    cout <<"DiscoPoPOpenMPInitialize is about to start...!"<<"\n";
    // pid_t systid = syscall(SYS_gettid);
    if (!peInited) {
        // cout <<"DiscoPoPOpenMPInitialize is executed...!"<<"\n";
        // This part should be executed only once.
        // numberOfHwThreads = std::thread::hardware_concurrency();
        numberOfHwThreads=omp_get_max_threads();
        cout<<"============================================================================================================"<<endl;    
        cout<<"No.of detected hardware threads:"<<numberOfHwThreads<<endl;
        cout<<"============================================================================================================"<<endl;
        mainTid = omp_get_thread_num();

        cout << "mainTid: " << mainTid << endl;

        readRuntimeInfo();
        depsMatrix = new DepsMatrix();
        RSig = new ReadSignature(SIG_NUM_ELEM, BF_NUM_ELEM, BF_FP_RATE);
        WSig = new WriteSignature(SIG_NUM_ELEM);
        out = new ofstream();
        out->open("Output.txt", ios::out);

        writeTempInfo= new ofstream();
        writeTempInfo->open("TemporalInfo.txt", ios::out);

        parentRegionStack = new stack<string>[numberOfHwThreads];  
        initThreadPool(numberOfHwThreads);
        parentRegionStack[0].push("MAIN THREAD");
        if(omp_get_thread_num() == 0){
            currentRegName = "EHSAN THREAD"; 
        }
        peInited = true;
        // cout<<"§§§§§§§§§§§§§§§§parentRegionStack initialized value: "<<parentRegionStack[omp_get_thread_num()].top()<<endl;

        if (DpOMP_DEBUG) {
            cout << "PE initialized" << endl;
        }
      
    }
}



void __CollectThreadInfo()
{
    cout<<"__CollectThreadInfo called"<<endl;
        currentThreadId = omp_get_thread_num();
        numberOfHwThreads = omp_get_num_threads();
        cout << "The Number of threads are: " << numberOfHwThreads << endl;
        for (int i = 0; i < numberOfHwThreads; ++i)
        {
            depsMatrix->addNewTid(i);
        }
}
//
void __DiscoPoPOpenMPRead(ADDR addr, 
    int32_t varSize, int32_t loopID, int32_t parentLoopID, char* varName) {
     // cout <<"__DiscoPoPOpenMPRead begin! \n";
    // *out<<"[READ]"<<varName<<"---->[Line Id] "<<decodeLID(lid)<<"[ADDR]"<<addr
    // <<" [ThreadID]"<<omp_get_thread_num()<<"\n";

    currentThreadId=omp_get_thread_num();


    pid_t lastWriteTid = WSig->membershipCheck(addr);
    if (lastWriteTid) {
        // RAW
        bool lastRead = RSig->membershipCheck(addr, currentThreadId);
        if((lastWriteTid != currentThreadId) && lastRead==false ){
            while (stackLock.test_and_set(std::memory_order_acquire));  
            // cout<<"We are here DUDE=========!!!!!!!!!!!!!!!!!"<<endl;  
            stackLock.clear(std::memory_order_release);   
            depsMatrix->set(lastWriteTid, currentThreadId, currentRegName, varSize, 0, parentLoopID);
        }
    }
    RSig->insert(addr, currentThreadId);

    
}
//, char* fName, char* varName
void __DiscoPoPOpenMPWrite(ADDR addr, char* varName) {
      // cout<<"__DiscoPoPOpenMPWrite invoked \n";
    //   *out<<"[WRITE]"<<varName<<"---->[Line Id] "<<decodeLID(lid)<<" [ADDR]"<<addr
    // <<" [ThreadID]"<<omp_get_thread_num()<<"\n";
    // cout <<"Write from Thread:"<<omp_get_thread_num()<<endl;
     // while (stackLock.test_and_set(std::memory_order_acquire));  
  
     // // cout<<"==========Write " << " varName " << varName << " " <<omp_get_thread_num()<<"   "<<currentRegName<<endl;
     // stackLock.clear(std::memory_order_release);

    WSig->insert(addr, omp_get_thread_num());
    RSig->clearAccesses(addr);
    

}
void __DiscoPoPOpenMPBeforeCall(char const* regionName)
{
    // while (stackLock.test_and_set(std::memory_order_acquire));  
  
    // // cout<<"BEFORE CALL_CURR_REG: "<<omp_get_thread_num()<<endl;
    // stackLock.clear(std::memory_order_release);
    parentRegionStack[omp_get_thread_num()].push(regionName); 
    currentRegName = parentRegionStack[omp_get_thread_num()].top();


    // string key=currentRegName+":::ThreadID: "+ to_string(omp_get_thread_num());
    depsMatrix->setEnterRegionTemporalInfo(currentRegName,omp_get_thread_num());

}

void __DiscoPoPOpenMPAfterCall()
{
    currentRegName = parentRegionStack[omp_get_thread_num()].top();
    // string key=currentRegName+":::ThreadID: "+ to_string(omp_get_thread_num());
    // string key=currentRegName;
    depsMatrix->setExitRegionTemporalInfo(currentRegName,omp_get_thread_num());

    if (!parentRegionStack[omp_get_thread_num()].empty())
    {
        parentRegionStack[omp_get_thread_num()].pop();

          if(parentRegionStack[omp_get_thread_num()].empty())
            {
                 currentRegName="NULL";
            }
            else
            {
                currentRegName = parentRegionStack[omp_get_thread_num()].top();
            }
    }
}


void __DiscoPoPOpenMPFinalize() {

     // cout<<"__DiscoPoPOpenMPFinalize invoked \n";
    if (DpOMP_DEBUG) {
        cout << "Program terminated! clearing up" << endl;
    }



    for (int i = 0; i < numberOfHwThreads; i++)
    {
        while(!parentRegionStack[i].empty())
        {
            // cout<<"ERROR NOT FREE STACK!========>"<<i<<endl;
            // cout<<"SIZE IS:"<<parentRegionStack[i].size()<<endl;
            parentRegionStack[i].pop();
        }
    }

    outputDeps();

    delete depsMatrix;
    

    out->flush();
    out->close();

    writeTempInfo->flush();
    writeTempInfo->close();


    delete writeTempInfo;
    delete out;

    if (DpOMP_DEBUG) {
        cout << "Program terminated." << endl;
    }
}

}

} 

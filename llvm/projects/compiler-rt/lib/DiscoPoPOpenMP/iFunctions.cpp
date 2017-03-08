#include <stdio.h>
#include <thread>
#include "iFunctions.h"
#include "omp.h"


using namespace std;
using namespace peutil;

bool DpOMP_DEBUG = true;                          // debug flag

namespace __DpOMP {

    int32_t currentRegID=0;
    thread_local string currentRegName = "Main Thread";
    stack<string> *parentRegionStack;

    std::atomic_flag stackLock; 

    bool peInited = false;                          // library initialization flag
    int32_t SIG_NUM_ELEM = 6000000;
    int32_t BF_NUM_ELEM = 32;
    double BF_FP_RATE = 0.0001;

    DepsMatrix* depsMatrix = nullptr;
    ofstream *out;

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
        parentRegionStack[i].push("Main Thread");
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

        parentRegionStack = new stack<string>[numberOfHwThreads];  
        initThreadPool(numberOfHwThreads);
       

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
    int32_t varSize, int32_t loopID, int32_t parentLoopID) {
     // cout <<"__DiscoPoPOpenMPRead begin! \n";
    // *out<<"[READ]"<<varName<<"---->[Line Id] "<<decodeLID(lid)<<"[ADDR]"<<addr
    // <<" [ThreadID]"<<omp_get_thread_num()<<"\n";
    currentThreadId=omp_get_thread_num();
    // cout <<"Read from Thread:"<<currentThreadId<<endl;

    pid_t lastWriteTid = WSig->membershipCheck(addr);
    if (lastWriteTid) {
        // RAW
        bool lastRead = RSig->membershipCheck(addr, currentThreadId);
        if((lastWriteTid != currentThreadId) && lastRead==false ){
            
            depsMatrix->set(lastWriteTid, currentThreadId, currentRegName, varSize, 0, parentLoopID);
        }
    }
    RSig->insert(addr, currentThreadId);

    
}
//, char* fName, char* varName
void __DiscoPoPOpenMPWrite(ADDR addr) {
      // cout<<"__DiscoPoPOpenMPWrite invoked \n";
    //   *out<<"[WRITE]"<<varName<<"---->[Line Id] "<<decodeLID(lid)<<" [ADDR]"<<addr
    // <<" [ThreadID]"<<omp_get_thread_num()<<"\n";
    // cout <<"Write from Thread:"<<omp_get_thread_num()<<endl;
    //cout<<"__DiscoPoPOpenMPWrite invoked \n";
    WSig->insert(addr, omp_get_thread_num());
    RSig->clearAccesses(addr);
    

}
void __DiscoPoPOpenMPBeforeCall(char const* regionName)
{
    // cout<<"RegName--->"<<regionName<<endl;
    //cout<<"BEFORE CALL_CURR_REG: "<<parentRegionStack.top()<<endl;
    // currentRegName = regionName;


    // while (stackLock.test_and_set(std::memory_order_acquire));  
    // cout<<"============================================================================================================"<<endl;   


    parentRegionStack[omp_get_thread_num()].push(regionName);
    currentRegName = parentRegionStack[omp_get_thread_num()].top();


    // cout<<"----------->>>>>>>>THREAD:  "<<omp_get_thread_num()<<endl;
    // cout<<"SIZE OF STACK BEFORE CALL--------: "<<parentRegionStack[omp_get_thread_num()].size()<<endl;

    // string s=parentRegionStack[omp_get_thread_num()].top();
    // cout<<"REGION NAME:====> "<<s<<endl;
    // cout<<"RegName--->"<<regionName<<endl;
    // cout<<"============================================================================================================"<<endl;   
    // stackLock.clear(std::memory_order_release);



    //parentRegionStack.push(regionName);
    //cout<<"BEFORE CALL: "<<parentRegionStack.top()<<"THREAD:"<<omp_get_thread_num()<<endl;
    // stackLock.clear(std::memory_order_release);
}

void __DiscoPoPOpenMPAfterCall()
{
    // currentRegName = parentRegionStack.top();
    // while (stackLock.test_and_set(std::memory_order_acquire));  
    if (!parentRegionStack[omp_get_thread_num()].empty())
    {
        // while (stackLock.test_and_set(std::memory_order_acquire));  
        // cout<<"#########################################################"<<endl;   
        // // cout<<"AFTER CALL: "<<parentRegionStack.top()<<"THREAD:"<<omp_get_thread_num()<<endl;
        // cout<<"----------->>>>>>>>THREAD:  "<<omp_get_thread_num()<<endl;
        // cout<<"SIZE OF STACK AFTER CALL--------: "<<parentRegionStack[omp_get_thread_num()].size()<<endl;

        // string s=parentRegionStack[omp_get_thread_num()].top();
        // cout<<"REGION NAME:====>"<<s<<endl;

        // cout<<"#########################################################"<<endl;   

        // stackLock.clear(std::memory_order_release);

        parentRegionStack[omp_get_thread_num()].pop();

        if(parentRegionStack[omp_get_thread_num()].empty())
                cout<<"=========================STACK IS EMPTY!"<<endl;
            else
                currentRegName = parentRegionStack[omp_get_thread_num()].top();
    }
    // stackLock.clear(std::memory_order_release);
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
            cout<<"ERROR NOT FREE STACK!========>"<<i<<endl;
            cout<<"SIZE IS:"<<parentRegionStack[i].size()<<endl;
            parentRegionStack[i].pop();
        }
    }

    outputDeps();

    delete depsMatrix;
    

    out->flush();
    out->close();

    delete out;

    if (DpOMP_DEBUG) {
        cout << "Program terminated." << endl;
    }
}

}

} 

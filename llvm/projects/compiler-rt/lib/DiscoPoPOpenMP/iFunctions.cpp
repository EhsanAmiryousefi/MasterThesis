#include <stdio.h>
#include "iFunctions.h"
#include "omp.h"
using namespace std;
using namespace peutil;

bool DpOMP_DEBUG = false;                          // debug flag

#ifdef __linux__                    // headers only available on Linux
#include <unistd.h>
#include <linux/limits.h>
#endif



namespace __DpOMP {

    
    map<int, int> *PIDs = nullptr;


    bool peInited = false;                          // library initialization flag
    int32_t SIG_NUM_ELEM = 6000000;
    int32_t BF_NUM_ELEM = 32;
    double BF_FP_RATE = 0.0001;

    DepsMatrix* depsMatrix = nullptr;
    ofstream *out;

    ReadSignature* RSig = nullptr;
    WriteSignature* WSig = nullptr;

    /******* BEGIN: parallelization section *******/

    atomic<uint8_t> targetThreads(0);               // this variable is used to map system thread-ids to our thread-ids
    pid_t mainTid;                                  // main program thread ID
    thread_local pid_t targetThreadId = -1;         // system thread id for each thread

    /******* END: parallelization section *******/




/******* Helper functions *******/
void outputDeps() {
    assert((depsMatrix!= nullptr) && "Dep map is not available!");
    if (DpOMP_DEBUG) {
        cout << "BEGIN: Printing Output.txt file... \n";
    }
    // print out all dps
    depsMatrix->print(out, targetThreads-1);
}

void readRuntimeInfo() {
    ifstream conf(get_exe_dir() + "/pe.conf");
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




/******* Instrumentation functions *******/

//The wrapper is to avoid mangling
extern "C"{

void __DiscoPoPOpenMPInitialize(){
    cout <<"DiscoPoPOpenMPInitialize begin!"<<"\n";
    pid_t systid = syscall(SYS_gettid);
    if (!peInited) {
        // This part should be executed only once.
        mainTid = systid;
        cout << "mainTid: " << mainTid << endl;
        readRuntimeInfo();
        depsMatrix = new DepsMatrix();
        RSig = new ReadSignature(SIG_NUM_ELEM, BF_NUM_ELEM, BF_FP_RATE);
        WSig = new WriteSignature(SIG_NUM_ELEM);
        out = new ofstream();
        out->open("Output.txt", ios::out);
        peInited = true;
        if (DpOMP_DEBUG) {
            cout << "PE initialized" << endl;
        }
    }
    if (targetThreadId < 0){
        targetThreadId = systid;
        targetThreads++;
        depsMatrix->addNewTid(systid);
    }
}
//
void __DiscoPoPOpenMPRead(ADDR addr, char* fileName, int32_t varSize, int32_t loopID, int32_t parentLoopID) {
    // cout <<"__DiscoPoPOpenMPRead begin! \n";
    // *out<<"[READ]"<<varName<<"---->[Line Id] "<<decodeLID(lid)<<"[ADDR]"<<addr
    // <<" [ThreadID]"<<omp_get_thread_num()<<"\n";
    pid_t lastWriteTid = WSig->membershipCheck(addr);
    if (lastWriteTid) {
        // RAW
        bool lastRead = RSig->membershipCheck(addr, targetThreadId);
        if((lastWriteTid != targetThreadId) && lastRead==false ){
            depsMatrix->set(lastWriteTid, targetThreadId, string(fileName), varSize, loopID, parentLoopID);
        }
    }
    RSig->insert(addr, targetThreadId);
    
}
//, char* fName, char* varName
void __DiscoPoPOpenMPWrite(int32_t lid, ADDR addr, char* varName) {
    // cout<<"__DiscoPoPOpenMPWrite invoked \n";
    //   *out<<"[WRITE]"<<varName<<"---->[Line Id] "<<decodeLID(lid)<<" [ADDR]"<<addr
    // <<" [ThreadID]"<<omp_get_thread_num()<<"\n";
    WSig->insert(addr, targetThreadId);
    RSig->clearAccesses(addr);
}

void __DiscoPoPOpenMPCallBefore(int index) {

}

void __DiscoPoPOpenMPCallAfter(int index, int lastCall) {

   
}

void __DiscoPoPOpenMPFinalize() {

     cout<<"__DiscoPoPOpenMPFinalize invoked \n";
    if (DpOMP_DEBUG) {
        cout << "Program terminated! clearing up" << endl;
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

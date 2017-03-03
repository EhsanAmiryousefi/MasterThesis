#ifndef _DpOMP_UTIL_H_
#define _DpOMP_UTIL_H_

#include <stdint.h>
#include <string>
#include <sstream>
#include <stdexcept>
#include <iostream>   // std::cerr 
#include <fstream>
#include <vector>
#include <utility>
#include <unistd.h>
#include <assert.h>

typedef int64_t ADDR;

using namespace std;

namespace peutil {

inline vector<string>* split(string input, char delim) {
    vector<string>* substrings = new vector<string>();
    istringstream inputStringStream(input);
    string sub;
    
    while(getline(inputStringStream, sub, delim)) {
        substrings->push_back(sub);    
    }
    
    return substrings;
}

inline bool fexists(const string& filename) {
    ifstream ifile(filename.c_str());
    if(ifile.fail()){
        return false;
    }
    return true;
}

inline string get_exe_dir() {
    char buff[1024];
    ssize_t len = ::readlink("/proc/self/exe", buff, sizeof(buff)-1);
    if (len != -1) {
        buff[len] = '\0';
        string fullPath = std::string(buff);
        return fullPath.substr(0, fullPath.find_last_of('/'));
    }
    else {
        return "";     
    }
}

} // namespace
#endif

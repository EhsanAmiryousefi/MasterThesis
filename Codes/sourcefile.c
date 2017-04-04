//#include <iostream>
#include <stdio.h>
#include <omp.h>

//using namespace std; 

int main()
{
  
    int i;
    omp_set_num_threads(32);
     // omp_set_nested(1); // 1 - enables nested parallelism; 0 - disables nested parallelism.
    int blablabla;//,c;
//    #pragma omp parallel // parallel region begins
//    { 
       
       printf("outer parallel region Thread ID == %d\n", omp_get_thread_num());
        /*
            Code for work to be done by outer parallel region threads over here.
        */
    blablabla=10000;
//        #pragma omp parallel firstprivate(a) //num_threads(2) // nested parallel region
//        {    
            /*
                Code for work to be done by inner parallel region threads over here.
            */        
//            printf("inner parallel region thread id %d\n", omp_get_thread_num());

            #pragma omp parallel for shared(blablabla)
            for(int i=0;i<4;i++)
            {
              int c = blablabla+9;
              #pragma omp critical 
              blablabla++;
                // Some independent iterative computation to be done. 
            }
//        }
//    }
    return 0;
} 

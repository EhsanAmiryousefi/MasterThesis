
#include <stdio.h>
#include <omp.h>



int main()
{
    int number;
    int i;
    omp_set_num_threads(4);
    omp_set_nested(1); // 1 - enables nested parallelism; 0 - disables nested parallelism.

    int a=10;
    #pragma omp parallel // parallel region begins
    {        
         a=12;
        // printf("outer parallel region Thread ID == %d\n", omp_get_thread_num());
        /*
            Code for work to be done by outer parallel region threads over here.
        */
        #pragma omp parallel //num_threads(2) // nested parallel region
        {    
          #pragma omp critical 
          a++;
            /*
                Code for work to be done by inner parallel region threads over here.
            */        
            // printf("inner parallel region thread id %d\n", omp_get_thread_num());
            
            #pragma omp for firstprivate(a) 
            for(i=0;i<20;i++)
            {
              
              int b=a;
                // Some independent iterative computation to be done. 
            }
        }
    }
    return 0;
} 

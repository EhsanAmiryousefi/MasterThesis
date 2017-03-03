#include <stdio.h>
#include <omp.h>
#include <time.h>
double randlc( double *x, double a )
{
 
  const double r23 = 1.1920928955078125e-07;
  const double r46 = r23 * r23;
  const double t23 = 8.388608e+06;
  const double t46 = t23 * t23;

  double t1, t2, t3, t4, a1, a2, x1, x2, z;
  double r;

  t1 = r23 * a;
  a1 = (int) t1;
  a2 = a - t23 * a1;

  t1 = r23 * (*x);
  x1 = (int) t1;
  x2 = *x - t23 * x1;
  t1 = a1 * x2 + a2 * x1;
  t2 = (int) (r23 * t1);
  z = t1 - t23 * t2;
  t3 = t23 * z + a2 * x2;
  t4 = (int) (r46 * t3);
  *x = t3 - t46 * t4;
  r = r46 * (*x);

  return r;
}


void vranlc( int n, double *x, double a, double y[] )
{

  const double r23 = 1.1920928955078125e-07;
  const double r46 = r23 * r23;
  const double t23 = 8.388608e+06;
  const double t46 = t23 * t23;

  double t1, t2, t3, t4, a1, a2, x1, x2, z;

  int i;

  t1 = r23 * a;
  a1 = (int) t1;
  a2 = a - t23 * a1;

  for ( i = 0; i < n; i++ ) {
    
    t1 = r23 * (*x);
    x1 = (int) t1;
    x2 = *x - t23 * x1;
    t1 = a1 * x2 + a2 * x1;
    t2 = (int) (r23 * t1);
    z = t1 - t23 * t2;
    t3 = t23 * z + a2 * x2;
    t4 = (int) (r46 * t3) ;
    *x = t3 - t46 * t4;
    y[i] = r46 * (*x);
  }

  return;
}

int main (void)
{
double begin = omp_get_wtime();
 int i1, i2, i3, d1, e1, e2, e3;
double xx, x0, x1, a1, a2, ai;
const double x = 314159265.0;
double rdummy;
ai = 256;
  d1 = 257;
  e1 = 257;
  e2 = 257;
  e3 = 257;

  a1 = 257;
  a2 = 257;


  e1 = 257 - 2 + 2;
  d1 = e2 = 10;
  e3 = 1000;

  double z[d1];

  const double a = 1000;

#pragma omp parallel default(shared)
{
  #pragma omp single
  {
    x0 = x;

    //rdummy = randlc(&x0, ai);
    //#pragma omp task firstprivate(x0) private(x1,i3) 
    for (i3 = 1; i3 < e3; i3++) {
        x1 = x0;
        x0 = x1 + x0;
        //rdummy = randlc(&x0, a2);
      #pragma omp task firstprivate(x1,i3) private(xx,i2) default(shared)
      for (i2 = 1; i2 < e2; i2++) {
        xx = x1;
        x1 = xx + x1;
        //vranlc(d1, &xx, a, z);
        //rdummy = randlc(&x1,a1);
      }
    }
  }
}
double end = omp_get_wtime();// clock();
    double time_spent = (double)(end - begin);// / CLOCKS_PER_SEC;
    printf("PRIVATE- time: %f\n", time_spent);
    return 0;
}

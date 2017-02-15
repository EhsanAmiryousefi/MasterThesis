#include <stdio.h>
#include <omp.h>

const int N =1000000;

int main() {
	// int Ehsan=100;
	// int a[n];
	// int b=1000;
	// int x = 0;
	// int hasan=12;
	// Ehsan=x;
	// Ehsan=hasan;


	// #pragma omp parallel for shared(a,x,b)
	// for (int i = 0; i < n; ++i)
	// {
	// 	a[i]=b+i;
	// 	#pragma omp critical 
	// 	x++;
	// }

	// int jstart=0;
	// #pragma omp parallel
	// {
	// 	jstart = tid*dnp; jstop = jstart + dnp;
	// 	for(int j=jstart; j<jstop; j++)
	// 		dxi += A[i][j]*x[j];
	// 		#pragma omp critical
	// 		dx[i] -= dxi;
	// }

	int i;
	int a[N];
	int sum = 0;

	#pragma omp parallel for reduction(+:sum)
	for (i=0; i < N; i++) {
		sum += a[i];
		a[i]=sum;
	}

// printf("test source file");
return 0;
}


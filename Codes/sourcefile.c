#include <stdio.h>
//#include <omp.h>

const int n =20;

int main() {
	int Ehsan=100;
	int a[n];
	int b=1000;
	int x = 0;
	int hasan=12;
	Ehsan=x;
	Ehsan=hasan;

	#pragma omp parallel for shared(a)
	for (int i = 0; i < n; ++i)
	{
		a[i]=b+i;
		#pragma omp critical 
		x++;
	}
	#pragma omp barrier
printf("test source file");
return 0;
}


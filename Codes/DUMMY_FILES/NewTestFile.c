#include <stdio.h>
#include <omp.h>

const int n =20;

int main() {
	int a[n];
	int b=1000;
	#pragma omp parallel for shared(a)
	for (int i = 0; i < n; ++i)
	{
		a[i]=b+i;
	}
printf("gjggghjjhj");
return 0;
}


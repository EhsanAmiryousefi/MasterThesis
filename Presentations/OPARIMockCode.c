int main()
{
	#pragma omp task
	{
		do_something();
	}
	return 0;
}

void do_something()
{
	sleep(1);
}

int main()
{
	POMP_Task_enter(…);
	#pragma omp task
	{
		POMP_Task_begin(…);
		do_something();
		POMP_Task_end(…);
	}
	POMP_Task_exit(…);
	return 0;
}

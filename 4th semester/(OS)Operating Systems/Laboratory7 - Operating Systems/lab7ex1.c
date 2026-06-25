#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <pthread.h>
#define N 21
#define NumberOfThreads 5

typedef struct
{
	int to;
	int from;
}threadStr;

void* threadFunc(void* arg)
{
	threadStr* s = (threadStr*)arg;
	int cnt = 0;
	for (int i = s->from; i <= s->to; i++)
	{
		int temp = i;
		while (temp > 0)
		{
			if (temp % 10 == 1)
				cnt++;
			temp = temp / 10;
		}
	}
	return (void*)(long)cnt;
}

int main()
{
	threadStr s[NumberOfThreads];
	pthread_t pid[NumberOfThreads];
	for (int i = 0; i < NumberOfThreads; i++)
	{
		if (i == 0)
			s[i].from = 0;
		else
			s[i].from = s[i - 1].to + 1;
		s[i].to = s[i].from + N / NumberOfThreads - 1;
		if (i < N % NumberOfThreads)
			s[i].to++;
	}

	void* result;
	int rezultatFinal = 0;
	for (int i = 0; i < NumberOfThreads; i++)
	{
		pthread_create(&pid[i], NULL, threadFunc; &s[i]);
		pthread_join(pid, &result);
		rezultatFinal = rezultatFinal + (long)result;
	}
	printf("Atatea cifre de 1 se gasesc in numere de la 1 la %d : %d", N, rezultatFinal);
	return 0;
}
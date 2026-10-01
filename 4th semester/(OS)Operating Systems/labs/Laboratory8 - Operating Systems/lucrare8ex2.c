#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <semaphore>

#define numberOfThreads 16
int nrThreads = 0;
sem_t sem;
sem_t sem2;

void* threadFunc(void* unused)
{
	sem_wait(&sem);

	sem_wait(&sem2);
	nrThreads++;
	usleep(100);
	printf("The number of threads in the limited area: %d\n", nrThreads);
	fflush(stdout);
	sem_post(&sem2);

	sem_wait(&sem2);
	nrThreads--;
	sem_post(&sem2);

	sem_post(&sem);
	return NULL;
}

int main(int argc, char *argv[])
{
	if (argc < 2)
		return 1;
	int n = atoi(argv[1]);
	sem_init(&sem, 0, n);
	sem_init(&sem2, 0, 1);
	pthread_t pid[numberOfThreads];

	for (int i = 0; i < numberOfThreads; i++)
		pthread_create(&pid[i], NULL, threadFunc, NULL);
	for (int i = 0; i < numberOfThreads; i++)
		pthread_join(pid[i], NULL);

	sem_destroy(&sem);
	return 0;
}
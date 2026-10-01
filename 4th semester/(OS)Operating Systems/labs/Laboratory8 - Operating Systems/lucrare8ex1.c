#include <semaphore.h>
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>

sem_t sem;

long count = 0;
int numberOfThreads = 4;
int M = 1000;

void* threadFunc(void* unused)
{
	int i;
	long aux;
	for (i = 0; i < M; i++)
	{
		sem_wait(&sem);
		aux = count;
		aux++;
		usleep(random() % 10);
		count = aux;
		sem_post(&sem);
	}
	return NULL;
}

//raspuns a) daca totul merge cum trebuie
//count final ar trebui sa fie N*M

int main()
{
	sem_init(&sem, 0, 1);
	pthread_t tid[numberOfThreads];

	for (int i = 0; i < numberOfThreads; i++)
		pthread_create(&tid[i], NULL, threadFunc, NULL);
	for (int i = 0; i < numberOfThreads; i++)
		pthread_join(tid[i], NULL);

	sem_destroy(&sem);
	printf("%d", count);
	return 0;
}
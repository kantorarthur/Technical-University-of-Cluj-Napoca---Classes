#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <semaphore.h>
#include <time.h>

#define N 3

sem_t sems[N];

void* threadFunc(void* arg) 
{
    int id = *(int*)arg;

    while (1) 
    {
        sem_wait(&sems[id]);

        printf("%d ", id + 1);
        fflush(stdout);

        usleep(rand() % 1000000);

        sem_post(&sems[(id + 1) % N]);
    }

    return NULL;
}

int main() {

    pthread_t threads[N];
    int ids[N];

    srand(time(NULL));

    for (int i = 0; i < N; i++) 
    {
        if (i == 0)
            sem_init(&sems[i], 0, 1);
        else
            sem_init(&sems[i], 0, 0);
    }

    for (int i = 0; i < N; i++) 
    {
        ids[i] = i;
        pthread_create(&threads[i],NULL,threadFunc,&ids[i]);
    }

    for (int i = 0; i < N; i++) 
    {
        pthread_join(threads[i], NULL);
    }

    return 0;
}
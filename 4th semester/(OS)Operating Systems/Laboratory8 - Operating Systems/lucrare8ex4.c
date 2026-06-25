#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

sem_t sem_na, sem_cl;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t print_mutex = PTHREAD_MUTEX_INITIALIZER;

int waiting_na = 0;
int waiting_cl = 0;
int last_na_id = -1;
int last_cl_id = -1;

void* atom_na(void* arg) 
{
    int id = *(int*)arg;
    free(arg);

    pthread_mutex_lock(&mutex);
    if (waiting_cl > 0) 
    {
        waiting_cl--;
        sem_post(&sem_cl);

        pthread_mutex_lock(&print_mutex);
        printf("atom Na id %d a format molecula cu atom Cl id %d\n", id, last_cl_id);
        pthread_mutex_unlock(&print_mutex);

        pthread_mutex_unlock(&mutex);
    }
    else 
    {
        waiting_na++;
        last_na_id = id;
        pthread_mutex_unlock(&mutex);

        sem_wait(&sem_na);

        pthread_mutex_lock(&print_mutex);
        printf("atom Na id %d a format molecula cu atom Cl id %d\n", id, last_cl_id);
        pthread_mutex_unlock(&print_mutex);
    }
    return NULL;
}

void* atom_cl(void* arg) 
{
    int id = *(int*)arg;
    free(arg);

    pthread_mutex_lock(&mutex);
    if (waiting_na > 0) 
    {
        waiting_na--;
        sem_post(&sem_na);

        pthread_mutex_lock(&print_mutex);
        printf("atom Cl id %d a format molecula cu atom Na id %d\n", id, last_na_id);
        pthread_mutex_unlock(&print_mutex);

        pthread_mutex_unlock(&mutex);
    }
    else 
    {
        waiting_cl++;
        last_cl_id = id;
        pthread_mutex_unlock(&mutex);

        sem_wait(&sem_cl);

        pthread_mutex_lock(&print_mutex);
        printf("Atom Cl id %d a format molecula cu atom Na id %d\n", id, last_na_id);
        pthread_mutex_unlock(&print_mutex);
    }
    return NULL;
}

int main() {
    sem_init(&sem_na, 0, 0);
    sem_init(&sem_cl, 0, 0);
    srand(time(NULL));

    pthread_t threads[20];
    for (int i = 0; i < 20; i++) 
    {
        int* id = malloc(sizeof(int));
        *id = i;
        if (rand() % 2 == 0) 
        {
            pthread_create(&threads[i], NULL, atom_na, id);
        }
        else 
        {
            pthread_create(&threads[i], NULL, atom_cl, id);
        }
        usleep(100000);
    }

    for (int i = 0; i < 20; i++) 
    {
        pthread_join(threads[i], NULL);
    }

    sem_destroy(&sem_na);
    sem_destroy(&sem_cl);
    return 0;
}
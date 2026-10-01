#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

void* worker(void* arg) 
{
    while (1) 
    {
        sleep(1000);
    }
    return NULL;
}

int main() {
    pthread_t* threads = NULL;
    int count = 0;

    while (1) 
    {
        threads = realloc(threads, (count + 1) * sizeof(pthread_t));

        if (pthread_create(&threads[count], NULL, worker, NULL) != 0) 
        {
            printf("nu mai pot crea thread\n");
            break;
        }

        count++;
    }

    printf("numar maxim de thread-uri: %d\n", count);


    free(threads);
    return 0;
}
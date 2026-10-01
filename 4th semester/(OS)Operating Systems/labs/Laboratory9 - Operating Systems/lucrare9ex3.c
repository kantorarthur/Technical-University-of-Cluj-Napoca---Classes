#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <fcntl.h>
#include <unistd.h>


int fd = -1;
pthread_mutex_lock_t lock = PTHREAD_MUTEX_INITIALIZER;

int numberOfThreads = 5;

void init_open(void) 
{
    fd = open("fisier.txt", O_RDONLY);
    if (fd < 0) 
    {
        perror("eroare la deschiderea fisierului");
    }
    else 
    {
        printf("fisierul a fost deschis fizic acum! Descriptor: %d\n", fd);
    }
}


int open_once() 
{
    pthread_mutex_lock(&lock);

    if (fd == -1) 
    {
        fd = open("fisier.txt", O_RDONLY);
        printf("deschidere. Descriptor: %d\n", fd);
    }

    pthread_mutex_unlock(&lock);
    return fd;
}

void* threadFunc(void* param) 
{
    long id = (long)param;


    int fisier_descriptor = open_once();

    if (fisier_descriptor >= 0) 
    {
        char octet;
        if (read(fisier_descriptor, &octet, 1) > 0) 
        {
            printf("Thread %d: Am citit octetul '%c'\n", id, octet);
        }
    }
    return NULL;
}

int main() {
    pthread_t tid[numberOfThreads];

    for (long i = 0; i < numberOfThreads; i++)
    {
        pthread_create(&tid[i], NULL, threadFunc, (void*)i);
    }

    for (int i = 0; i < numberOfThreads; i++)
    {
        pthread_join(tid[i], NULL);
    }

    if (fd >= 0) 
    {
        close(fd); 
    }
    return 0;
}
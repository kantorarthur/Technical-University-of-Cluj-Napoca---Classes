#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <semaphore.h>
#include "common.h"

int is_prime(int n) 

    if (n <= 1) return 0;
    for (int i = 2; i * i <= n; i++) 
    {
        if (n % i == 0) return 0;
    }
    return 1;
}

int main(int argc, char* argv[]) {
    if (argc != 3)
    {
        return 1;
    }

    int start = atoi(argv[1]);
    int end = atoi(argv[2]);

    int shm_fd = shm_open(SHM_NAME, O_RDWR, 0666);
    if (shm_fd == -1) 
    {
        return 1;
    }

    struct SharedArray* shared_data = (struct SharedArray*)mmap(NULL, sizeof(struct SharedArray), PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0);
    if (shared_data == MAP_FAILED)
    {
        return 1;
    }

    sem_t* sem = sem_open(SEM_NAME, 0);
    if (sem == SEM_FAILED) 
    {
        return 1;
    }

    for (int i = start; i <= end; i++) 
    {
        if (is_prime(i))
        {
            sem_wait(sem);
            if (shared_data->count < MAX_ELEMENTS) 
            {
                shared_data->elements[shared_data->count] = i;
                shared_data->count++;
            }
            sem_post(sem);
        }
    }

    munmap(shared_data, sizeof(struct SharedArray));
    close(shm_fd);
    sem_close(sem);

    return 0;
}
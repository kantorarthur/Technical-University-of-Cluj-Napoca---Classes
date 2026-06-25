#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <semaphore.h>
#include "common.h"

int main(int argc, char* argv[]) 
{

    if (argc != 5) 
    {
        fprintf(stderr, "wrong usage");
        return 1;
    }

    int start = atoi(argv[1]);
    int end = atoi(argv[2]);
    int num_workers = atoi(argv[3]);
    char* worker_path = argv[4];

    shm_unlink(SHM_NAME);
    sem_unlink(SEM_NAME);

    int shm_fd = shm_open(SHM_NAME, O_CREAT | O_RDWR, 0666);
    if (shm_fd == -1)
    {
        perror("shm_open");
        return 1;
    }

    if (ftruncate(shm_fd, sizeof(struct SharedArray)) == -1) 
    {
        perror("ftruncate");
        return 1;
    }

    struct SharedArray* shared_data = (struct SharedArray*)mmap(NULL, sizeof(struct SharedArray), PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0);
    if (shared_data == MAP_FAILED)
    {
        perror("mmap");
        return 1;
    }

    shared_data->count = 0;

    sem_t* sem = sem_open(SEM_NAME, O_CREAT, 0666, 1);
    if (sem == SEM_FAILED) 
    {
        perror("sem_open");
        return 1;
    }

    int total_range = end - start + 1;
    int range_per_worker = total_range / num_workers;

    for (int i = 0; i < num_workers; i++) 
    {
        int w_start = start + i * range_per_worker;
        int w_end = (i == num_workers - 1) ? end : (w_start + range_per_worker - 1);

        pid_t pid = fork();
        if (pid < 0) {
            perror("fork");
            return 1;
        }

        if (pid == 0) 
        {
            char arg_start[32], arg_end[32];
            snprintf(arg_start, sizeof(arg_start), "%d", w_start);
            snprintf(arg_end, sizeof(arg_end), "%d", w_end);
            execl(worker_path, worker_path, arg_start, arg_end, NULL);
            perror("execl");
            exit(1);
        }
    }

    for (int i = 0; i < num_workers; i++) 
    {
        wait(NULL);
    }

    printf("Found %d prime numbers:\n", shared_data->count);
    for (int i = 0; i < shared_data->count; i++) 
    {
        printf("%d ", shared_data->elements[i]);
    }
    printf("\n");

    munmap(shared_data, sizeof(struct SharedArray));
    close(shm_fd);
    shm_unlink(SHM_NAME);
    sem_close(sem);
    sem_unlink(SEM_NAME);

    return 0;
}
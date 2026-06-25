#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <semaphore.h>

#define SHM_NAME "/shm_example"
#define SEM_PARENT "/sem_parent"
#define SEM_CHILD "/sem_child"
#define MAX_COUNT 10

struct SharedData {
    int value;
};

int main() {
    shm_unlink(SHM_NAME);
    sem_unlink(SEM_PARENT);
    sem_unlink(SEM_CHILD);

    int shm_fd = shm_open(SHM_NAME, O_CREAT | O_RDWR, 0666);
    if (shm_fd == -1) 
    {
        perror("shm_open");
        return 1;
    }

    if (ftruncate(shm_fd, sizeof(struct SharedData)) == -1) 
    {
        perror("ftruncate");
        return 1;
    }

    struct SharedData* data = (struct SharedData*)mmap(NULL, sizeof(struct SharedData), PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0);
    if (data == MAP_FAILED) 
    {
        perror("mmap");
        return 1;
    }

    data->value = 0;

    sem_t* sem_p = sem_open(SEM_PARENT, O_CREAT, 0666, 1);
    sem_t* sem_c = sem_open(SEM_CHILD, O_CREAT, 0666, 0);

    if (sem_p == SEM_FAILED || sem_c == SEM_FAILED) 
    {
        perror("sem_open");
        return 1;
    }

    pid_t pid = fork();

    if (pid < 0) 
    {
        perror("fork");
        return 1;
    }

    if (pid > 0) 
    {
        while (1) 
        {
            sem_wait(sem_p);

            if (data->value >= MAX_COUNT)
            {
                sem_post(sem_c);
                break;
            }

            data->value++;
            printf("parent incremented value to: %d\n", data->value);

            sem_post(sem_c);
        }

        wait(NULL);

        munmap(data, sizeof(struct SharedData));
        close(shm_fd);
        shm_unlink(SHM_NAME);
        sem_close(sem_p);
        sem_close(sem_c);
        sem_unlink(SEM_PARENT);
        sem_unlink(SEM_CHILD);
    }
    else 
    {
        while (1) 
        {
            sem_wait(sem_c);

            if (data->value >= MAX_COUNT) 
            {
                sem_post(sem_p);
                break;
            }

            data->value++;
            printf("Child incremented value to: %d\n", data->value);

            sem_post(sem_p);
        }

        munmap(data, sizeof(struct SharedData));
        close(shm_fd);
        sem_close(sem_p);
        sem_close(sem_c);
        exit(0);
    }

    return 0;
}
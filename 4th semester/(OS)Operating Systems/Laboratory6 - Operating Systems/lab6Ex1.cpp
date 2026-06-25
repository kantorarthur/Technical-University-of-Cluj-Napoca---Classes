#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t p1, p2, p3, p4;

    printf("P0: PID=%d, PPID=%d\n", getpid(), getppid());

    p1 = fork();
    if (p1 == 0) 
    {
        printf("p1 : pId=%d, ppID=%d \n", getpid(), getppid());

        p3 = fork();
        if (p3 == 0) 
        {
            printf("p3: piD=%d, ppID=%d \n", getpid(), getppid());
            sleep(60);
            exit(0);
        }

        sleep(60);
        wait(NULL);
        exit(0);
    }

    p2 = fork();
    if (p2 == 0) 
    {
        printf("p2: pID=%d, ppID=%d\n", getpid(), getppid());

        p4 = fork();
        if (p4 == 0) 
        {
            printf("p4: pID=%d, ppID=%d\n", getpid(), getppid());
            sleep(60);
            exit(0);
        }

        sleep(60);
        wait(NULL);
        exit(0);
    }

    sleep(60);
    wait(NULL);
    wait(NULL);

    return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>



int main() {
    int pipefd[2];
    pid_t pid;
    char buffer[256];

    if (pipe(pipefd) == -1) 
    {
        perror("pipe");
        return 1;
    }

    pid = fork();

    if (pid < 0) 
    {
        perror("fork");
        return 1;
    }

    if (pid > 0) 
    {
        const char* parent_msg = "Hello from Parent!";
        printf("parent Sending: %s\n", parent_msg);

        if (write(pipefd[1], parent_msg, strlen(parent_msg) + 1) < 0) 
        {
            perror("parent write");
            return 1;
        }

        sleep(1);

        if (read(pipefd[0], buffer, 256) < 0) 
        {
            perror("parent read");
            return 1;
        }

        printf("parent Received response: %s\n", buffer);

        close(pipefd[0]);
        close(pipefd[1]);
        wait(NULL);
    }
    else 
    {
        if (read(pipefd[0], buffer, 256) < 0) 
        {
            perror("child read");
            return 1;
        }

        printf("[Child] Received: %s\n", buffer);

        char child_msg[256];
        snprintf(child_msg, 256, "Acknowledged: %s", buffer);

        printf("child Sending response: %s\n", child_msg);
        if (write(pipefd[1], child_msg, strlen(child_msg) + 1) < 0) 
        {
            perror("child write");
            return 1;
        }

        close(pipefd[0]);
        close(pipefd[1]);
        exit(0);
    }

    return 0;
}
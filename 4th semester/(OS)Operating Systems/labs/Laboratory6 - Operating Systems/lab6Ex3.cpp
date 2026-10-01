#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    int i, n = 7;
    int total = 0;

    for (i = 0; i < n; i++) 
    {
        pid_t pid = fork();

        if (pid == 0) 
        {
            continue;
        }

        else 
        {
            int status;
            wait(&status);

            int child_count = WEXITSTATUS(status);
            total += 1 + child_count;

            break;
        }
    }

    if (i == n) 
    {
        exit(0);
    }

    exit(total);
}
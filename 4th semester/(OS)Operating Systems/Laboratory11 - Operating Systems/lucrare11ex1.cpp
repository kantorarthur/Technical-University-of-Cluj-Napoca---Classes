#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(void)
{
    int fd[2];

    if (pipe(fd) != 0) 
    {
        perror("Could not create pipe");
        return 1;
    }

    if (fork() != 0) 
    {
        close(fd[0]);

        const char* message = "message";
        int length = strlen(message) + 1;

        write(fd[1], &length, sizeof(length));
        write(fd[1], message, length);

        printf("Parent: wrote string of length %d to pipe\n", length);
        close(fd[1]);
        wait(NULL);
    }
    else 
    {
        close(fd[1]);

        int length = 0;
        read(fd[0], &length, sizeof(length));

        char* buffer = (char*)malloc(length);
        if (buffer == NULL)
        {
            perror("Memory allocation failed");
            return 1;
        }

        read(fd[0], buffer, length);
        printf("Child: read "%s" from pipe\n", buffer);

        free(buffer);
        close(fd[0]);
    }

    return 0;
}
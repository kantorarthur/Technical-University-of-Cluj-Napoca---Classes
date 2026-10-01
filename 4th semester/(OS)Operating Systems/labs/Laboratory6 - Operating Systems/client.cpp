#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    int a, b;
    char op;

    while (1) 
    {
        printf("> ");
        scanf("%d %d %c", &a, &b, &op);

        pid_t pid = fork();

        if (pid == 0) 
        {
            char s1[10], s2[10], s3[2];

            sprintf(s1, "%d", a);
            sprintf(s2, "%d", b);
            sprintf(s3, "%c", op);
            execl("./server", "server", s1, s2, s3, NULL);
            perror("exec failed");
            exit(1);
        }
        else 
        {
            int status;
            wait(&status);
            int result = WEXITSTATUS(status);
            printf("rezultat:%d\n", result);
        }
    }

    return 0;
}
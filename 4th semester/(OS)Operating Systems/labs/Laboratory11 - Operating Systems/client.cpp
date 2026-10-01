#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include "common.h"

int main() {
    int fd_req = open(FIFO_REQ, O_WRONLY);
    int fd_res = open(FIFO_RES, O_RDONLY);

    if (fd_req == -1 || fd_res == -1) {
        return 1;
    }

    struct Request req;
    struct Response res;

    while (1) 
    {
        printf("Operator (+, -, x to exit): ");
        scanf(" %c", &req.op);

        if (req.op == 'x') {

            break;
        }

        if (req.op != '+' && req.op != '-') 
        {
            printf("Invalid operator.\n");
            continue;
        }

        printf("First number: ");
        scanf("%d", &req.op1);
        printf("Second number: ");
        scanf("%d", &req.op2);

        if (write(fd_req, &req, sizeof(struct Request)) <= 0)
        {
            break;
        }

        if (read(fd_res, &res, sizeof(struct Response)) > 0) 
        {
            if (res.error) 
            {
                printf("Server processing error.\n");
            }
            else 
            {
                printf("Result: %d\n", res.result);
            }
        }
        else 
        {
            break;
        }
    }

    close(fd_req);
    close(fd_res);

    return 0;
}
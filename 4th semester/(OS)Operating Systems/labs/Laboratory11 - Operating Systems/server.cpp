#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "common.h"

int main() {
    unlink(FIFO_REQ);
    unlink(FIFO_RES);

    if (mkfifo(FIFO_REQ, 0666) == -1 || mkfifo(FIFO_RES, 0666) == -1) 
    {
        return 1;
    }

    int fd_req = open(FIFO_REQ, O_RDONLY);
    int fd_res = open(FIFO_RES, O_WRONLY);

    if (fd_req == -1 || fd_res == -1) 
    {
        return 1;
    }

    struct Request req;
    struct Response res;

    while (read(fd_req, &req, sizeof(struct Request)) > 0) 
    {
        res.error = 0;
        if (req.op == '+') 
        {
            res.result = req.op1 + req.op2;
        }
        else if (req.op == '-') 
        {
            res.result = req.op1 - req.op2;
        }
        else
        s{
            res.error = 1;
        }

        if (write(fd_res, &res, sizeof(struct Response)) <= 0)
        {
            break;
        }
    }

    close(fd_req);
    close(fd_res);
    unlink(FIFO_REQ);
    unlink(FIFO_RES);

    return 0;
}
#ifndef COMMON_H
#define COMMON_H

#define FIFO_REQ "fifo_req"
#define FIFO_RES "fifo_res"

struct Request 
{
    int op1;
    int op2;
    char op;
};

struct Response 
{
    int result;
    int error;
};

#endif
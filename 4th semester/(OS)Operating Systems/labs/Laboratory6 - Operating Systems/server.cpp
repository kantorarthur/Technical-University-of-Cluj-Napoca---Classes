#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) 
{
    if (argc != 4) 
    {
        printf("%s", argv[0]);
        exit(1);
    }

    int a = atoi(argv[1]);
    int b = atoi(argv[2]);
    char op = argv[3][0];

    int result;

    if (op == '+') 
    {
        result = a + b;
    }
    else if (op == '-') 
    {
        result = a - b;
    }
    else 
    {
        printf("operator invalid");
        exit(1);
    }

    exit(result);
}
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>

int main(int argc, char* argv[]) {
    if (argc != 3) 
    {
        return 1;
    }

    int f_in = open(argv[1], O_RDONLY);
    if (f_in < 0) 
    {
        return 2;
    }

    int f_out = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (f_out < 0) 
    {
        close(f_in);
        return 3;
    }

    off_t size = lseek(f_in, 0, SEEK_END);
    if (size < 0) 
    {
        close(f_in);
        close(f_out);
        return 4;
    }

    char ch;
    for (off_t i = size - 1; i >= 0; i--) 
    {
        lseek(f_in, i, SEEK_SET);
        if (read(f_in, &ch, 1) == 1) 
        {
            if (write(f_out, &ch, 1) != 1) 
            {
                break;
            }
        }
    }

    close(f_in);
    close(f_out);

    return 0;
}
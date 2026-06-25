#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>

int main(int argc, char* argv[]) {
    if (argc != 4) 
    {
        return 1;
    }

    char* filename = argv[1];
    off_t pos = atol(argv[2]);
    char* to_insert = argv[3];
    size_t insert_len = strlen(to_insert);

    int fd = open(filename, O_RDWR);
    if (fd < 0) 
    {
        return 2;
    }

    off_t file_size = lseek(fd, 0, SEEK_END);
    if (pos > file_size) 
    {
        pos = file_size;
    }

    size_t tail_len = file_size - pos;
    char* tail = NULL;
    if (tail_len > 0) 
    {
        tail = malloc(tail_len);
        lseek(fd, pos, SEEK_SET);
        read(fd, tail, tail_len);
    }

    lseek(fd, pos, SEEK_SET);
    write(fd, to_insert, insert_len);

    if (tail_len > 0) 
    {
        write(fd, tail, tail_len);
        free(tail);
    }

    close(fd);
    return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/types.h>

int main(int argc, char** argv)
{
    int fd;
    off_t size, i;
    char* data = NULL;

    if (argc != 2) 
    {
        fprintf(stderr, "Usage: %s <file_name>\n", argv[0]);
        return 1;
    }

    fd = open(argv[1], O_RDWR);
    if (fd == -1) 
    {
        perror("Could not open input file");
        return 1;
    }

    size = lseek(fd, 0, SEEK_END);
    if (size <= 0) 
    {
        close(fd);
        return 0;
    }

    data = (char*)mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (data == (void*)-1)
    {
        perror("Could not map file");
        close(fd);
        return 1;
    }

    for (i = 0; i < size / 2; i++) 
    {
        char temp = data[i];
        data[i] = data[size - 1 - i];
        data[size - 1 - i] = temp;
    }

    if (msync(data, size, MS_SYNC) == -1) 
    {
        perror("Could not sync file to disk");
    }

    munmap(data, size);
    close(fd);

    return 0;
}
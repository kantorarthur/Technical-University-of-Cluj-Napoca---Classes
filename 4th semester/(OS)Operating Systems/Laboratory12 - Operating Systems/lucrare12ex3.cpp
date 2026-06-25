#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <ctype.h>

int is_vowel(char c) {
    char lower = tolower((unsigned char)c);
    return (lower == 'a' || lower == 'e' || lower == 'i' || lower == 'o' || lower == 'u');
}

int main(int argc, char* argv[]) 
{
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    int fd = open(argv[1], O_RDWR);
    if (fd == -1) 
    {
        perror("Error opening file");
        return 1;
    }

    struct stat sb;
    if (fstat(fd, &sb) == -1) 
    {
        perror("Error getting file size");
        close(fd);
        return 1;
    }

    if (sb.st_size == 0) 
    {
        close(fd);
        return 0;
    }

    char* map = mmap(NULL, sb.st_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (map == MAP_FAILED) 
    {
        perror("Error mapping file");
        close(fd);
        return 1;
    }

    off_t write_idx = 0;
    for (off_t read_idx = 0; read_idx < sb.st_size; read_idx++) 
    {
        if (!is_vowel(map[read_idx])) {
            map[write_idx] = map[read_idx];
            write_idx++;
        }
    }

    while (write_idx < sb.st_size) 
    {
        map[write_idx] = ' ';
        write_idx++;
    }

    if (msync(map, sb.st_size, MS_SYNC) == -1) 
    {
        perror("Error syncing file to disk");
    }

    if (munmap(map, sb.st_size) == -1) 
    {
        perror("Error unmapping memory");
    }

    close(fd);
    return 0;
}
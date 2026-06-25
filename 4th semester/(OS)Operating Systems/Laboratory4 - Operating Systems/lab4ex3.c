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

    off_t* offsets = NULL;
    int line_count = 0;
    int capacity = 10;
    offsets = malloc(capacity * sizeof(off_t));

    offsets[line_count++] = 0;
    char ch;
    off_t current_pos = 0;

    while (read(f_in, &ch, 1) > 0) 
    {
        current_pos++;
        if (ch == '\n') 
        {
            if (line_count >= capacity) 
            {
                capacity *= 2;
                offsets = realloc(offsets, capacity * sizeof(off_t));
            }
            offsets[line_count++] = current_pos;
        }
    }

    off_t file_size = lseek(f_in, 0, SEEK_END);
    if (line_count > 0 && offsets[line_count - 1] == file_size) 
    {
        line_count--;
    }

    int f_out = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (f_out < 0) 
    {
        free(offsets);
        close(f_in);
        return 3;
    }

    for (int i = line_count - 1; i >= 0; i--) 
    {
        off_t start = offsets[i];
        off_t end = (i == line_count - 1) ? file_size : offsets[i + 1];

        lseek(f_in, start, SEEK_SET);
        for (off_t j = 0; j < (end - start); j++) 
        {
            read(f_in, &ch, 1);
            write(f_out, &ch, 1);
        }

        if (i == line_count - 1 && (end == start || ch != '\n')) 
        {
            char nl = '\n';
            write(f_out, &nl, 1);
        }
    }

    free(offsets);
    close(f_in);
    close(f_out);
    return 0;
}
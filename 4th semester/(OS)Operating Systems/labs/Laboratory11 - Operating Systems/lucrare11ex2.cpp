#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>

#define FIFO_NAME "test_fifo"

int get_pipe_capacity(int write_fd) 
{
    int flags = fcntl(write_fd, F_GETFL, 0);
    fcntl(write_fd, F_SETFL, flags | O_NONBLOCK);

    int total_bytes = 0;
    char buffer = 'A';

    while (1) 
    {
        ssize_t bytes_written = write(write_fd, &buffer, 1);
        if (bytes_written < 0) 
        {
            if (errno == EAGAIN || errno == EWOULDBLOCK) 
            {
                break;
            }
            else 
            {
                perror("Error writing to pipe");
                return -1;
            }
        }
        total_bytes += bytes_written;
    }

    return total_bytes;
}

int main() 
{


    int anon_pipefd[2];
    if (pipe(anon_pipefd) == -1) 
    {
        perror("Failed to create anonymous pipe");
        return 1;
    }

    int anon_capacity = get_pipe_capacity(anon_pipefd[1]);
    if (anon_capacity >= 0) 
    {
        printf("Maximum capacity for Anonymous Pipe: %d bytes \n",anon_capacity,);
    }

    close(anon_pipefd[0]);
    close(anon_pipefd[1]);



    if (mkfifo(FIFO_NAME, 0666) == -1) 
    {
        perror("Failed to create named pipe");
        return 1;
    }

    int fifo_fd = open(FIFO_NAME, O_RDWR);
    if (fifo_fd == -1) 
    {
        perror("Failed to open named pipe");
        unlink(FIFO_NAME);
        return 1;
    }

    int fifo_capacity = get_pipe_capacity(fifo_fd);
    if (fifo_capacity >= 0) 
    {
        printf("Maximum capacity for Named Pipe : %d bytes )\n",fifo_capacity);
    }

    close(fifo_fd);
    unlink(FIFO_NAME);

    return 0;
}
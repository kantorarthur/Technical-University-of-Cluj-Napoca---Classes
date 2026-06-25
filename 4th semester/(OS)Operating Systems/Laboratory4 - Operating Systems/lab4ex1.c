#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int get_line(int fd, int lineNr, char* line, int maxLength) 
{
    if (fd < 0 || lineNr <= 0 || maxLength <= 0) return -1;

    if (lseek(fd, 0, SEEK_SET) == (off_t-1) return -2;

    int currentLine = 1;
    char ch;
    ssize_t bytesRead;
    int pos = 0;

    while (currentLine < lineNr) 
    {
        bytesRead = read(fd, &ch, 1);
        if (bytesRead <= 0) return -3;
        if (ch == '\n') 
        {
            currentLine++;
        }
    }

    while ((bytesRead = read(fd, &ch, 1)) > 0) 
    {
        if (ch == '\n') 
        {
            break;
        }
        if (pos < maxLength - 1) 
        {
            line[pos++] = ch;
        }
        else {
            return -4;
        }
    }

    if (bytesRead == 0 && pos == 0 && currentLine == lineNr) 
    {
        if (lineNr > 1 || lseek(fd, 0, SEEK_END) == 0) 
        {
            return -5;
        }
    }

    line[pos] = '\0';
    return 0;
}

int main(int argc, char* argv[]) {
    if (argc != 3) 
    {
        fprintf(stderr, "numar gresit de argumente\n", argv[0]);
        return 1;
    }

    int fd = open(argv[1], O_RDONLY);
    if (fd < 0) 
    {
        perror("eroare la deschiderea fisierului");
        return 1;
    }

    int lineNr = atoi(argv[2]);
    char buffer[1024];
    int result = get_line(fd, lineNr, buffer, sizeof(buffer));

    if (result == 0) 
    {
        printf("linia %d: %s\n", lineNr, buffer);
    }
    else 
    {
        fprintf(stderr, "eroare: Cod %d (linie inexistenta sau prea lunga)\n", result);
    }

    close(fd);
    return 0;
}
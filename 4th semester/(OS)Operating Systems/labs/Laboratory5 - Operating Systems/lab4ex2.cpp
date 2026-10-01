#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

int containsString(const char* path, const char* str) {
    FILE* f = fopen(path, "r");
    if (!f) return 0;

    char buffer[1024];
    while (fgets(buffer, sizeof(buffer), f)) {
        if (strstr(buffer, str)) {
            fclose(f);
            return 1;
        }
    }

    fclose(f);
    return 0;
}

void search(const char* dirPath, const char* filename,
    const char* str, int* counter) {

    DIR* dir = opendir(dirPath);
    if (!dir) return;

    struct dirent* entry;
    char path[1024];
    struct stat st;

    while ((entry = readdir(dir)) != NULL) {
        if (!strcmp(entry->d_name, ".") || !strcmp(entry->d_name, ".."))
            continue;

        snprintf(path, sizeof(path), "%s/%s", dirPath, entry->d_name);

        if (lstat(path, &st) == -1)
            continue;

        if (S_ISDIR(st.st_mode)) {
            search(path, filename, str, counter);
        }
        else if (S_ISREG(st.st_mode)) {

            if (strcmp(entry->d_name, filename) == 0 &&
                containsString(path, str)) {

                char linkName[256];
                sprintf(linkName, "%s.%d", filename, (*counter)++);

                symlink(path, linkName);
            }
        }
    }

    closedir(dir);
}
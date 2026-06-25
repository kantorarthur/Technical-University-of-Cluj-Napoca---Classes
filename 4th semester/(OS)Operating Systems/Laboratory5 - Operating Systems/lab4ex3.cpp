#include <stdio.h>
#include <dirent.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

void deleteDir(const char* dirPath) {
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
            deleteDir(path);
            rmdir(path);
        }
        else {
            unlink(path);
        }
    }

    closedir(dir);
    rmdir(dirPath);
}
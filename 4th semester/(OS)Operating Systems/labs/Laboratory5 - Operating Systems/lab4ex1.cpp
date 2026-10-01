#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <sys/stat.h>
#include <string.h>

off_t dirSize(const char* dirPath) {
    DIR* dir = opendir(dirPath);
    if (!dir) return 0;

    struct dirent* entry;
    struct stat st;
    char path[1024];
    off_t total = 0;

    while ((entry = readdir(dir)) != NULL) {
        if (strcmp(entry->d_name, ".") == 0 ||
            strcmp(entry->d_name, "..") == 0)
            continue;

        snprintf(path, sizeof(path), "%s/%s", dirPath, entry->d_name);

        if (lstat(path, &st) == -1)
            continue;

        if (S_ISREG(st.st_mode)) {
            total += st.st_size;
        }
        else if (S_ISDIR(st.st_mode)) {
            total += dirSize(path);
        }
    }

    closedir(dir);
    return total;
}
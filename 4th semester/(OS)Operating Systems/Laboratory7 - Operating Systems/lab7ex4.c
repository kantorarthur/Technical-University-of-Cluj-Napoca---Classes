#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <time.h>

#define N 9


void* threadFunc(void* arg) 
{
    int id = *(int*)arg;
    free(arg);

    while (1) 
    {
        int t = rand() % 5 + 1;
        sleep(t);

        printf("thread %d ruleaza\n", id);

        pthread_testcancel();
    }

    return NULL;
}

int main() {
    srand(time(NULL));
    pthread_t threads[N];
    int active[N];
    for (int i = 0; i < N; i++) 
    {
        active[i] = 1;

        int* id = malloc(sizeof(int));
        *id = i + 1;

        pthread_create(&threads[i], NULL, threadFunc, id);
    }

    int remaining = N;

    while (remaining > 0) 
    {
        int x;
        scanf("%d", &x);

        if (x >= 1 && x <= 9) 
        {
            if (active[x - 1]) 
            {
                pthread_cancel(threads[x - 1]);
                pthread_join(threads[x - 1], NULL);

                active[x - 1] = 0;
                remaining--;

                printf("thread %d a fost oprit\n", x);
            }
            else 
            {
                printf("thread %d este deja oprit\n", x);
            }
        }
     }

    printf("toate thread-urile au fost inchise\n");
    return 0;
}
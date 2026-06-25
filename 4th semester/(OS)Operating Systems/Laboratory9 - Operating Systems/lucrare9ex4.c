#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define MAX_CARS_ON_BRIDGE 5 


int masiniPePod = 0;
int directieCurenta = -1; 


pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t condDirectie[2] = {PTHREAD_COND_INITIALIZER, PTHREAD_COND_INITIALIZER};

void enter_bridge(int dir) 
{
    pthread_mutex_lock(&mtx);


    while ((directieCurenta != -1 && directieCurenta != dir) || masiniPePod == MAX_CARS_ON_BRIDGE)
    {
        pthread_cond_wait(&condDirectie[dir], &mtx);
    }

    if (directieCurenta == -1)
    {
        directieCurenta = dir;
    }

    masiniPePod++;
    printf("masina cu directia %d a intrat pe pod. masini pe pod: %d\n", dir, masiniPePod);

    pthread_mutex_unlock(&mtx);
}

void cross_bridge(int dir) 
{
    printf("masina merge in directia %d si acum traverseaza\n", dir);
    usleep(500); 
}

void exit_bridge(int dir) 
{
    pthread_mutex_lock(&mtx);

    masiniPePod--;
    printf("masina cu directia %d a parasit podul. masini ramase: %d\n", dir, masiniPePod);

    if (masiniPePod == 0)
    {
        directieCurenta = -1;

        int directieOpusa = 1 - dir;
        pthread_cond_broadcast(&condDirectie[directieOpusa]);

        pthread_cond_broadcast(&condDirectie[dir]);
    }
    else 
    {
        pthread_cond_broadcast(&condDirectie[dir]);
    }

    pthread_mutex_unlock(&mtx);
}

void* car_thread(void* direction) 
{
    int dir = (int)direction;

    enter_bridge(dir);
    cross_bridge(dir);
    exit_bridge(dir);

    return NULL;
}

int main() 
{
    srandom(time(NULL)); 

    int totalMasini = 12; 
    pthread_t masini[totalMasini];


    for (int i = 0; i < totalMasini; i++) 
    {
        int directieAleatorie = random() % 2;

        pthread_create(&masini[i], NULL, car_thread, (void*)directieAleatorie);

        usleep(100);
    }


    for (int i = 0; i < totalMasini; i++) 
    {
        pthread_join(masini[i], NULL);
    }

    pthread_mutex_destroy(&mtx);
    pthread_cond_destroy(&condDirectie[0]);
    pthread_cond_destroy(&condDirectie[1]);

    return 0;
}
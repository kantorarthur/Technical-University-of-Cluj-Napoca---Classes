#ifndef COMMON_H
#define COMMON_H

#define SHM_NAME "/shm_prime_array"
#define SEM_NAME "/sem_prime_mutex"
#define MAX_ELEMENTS 10000

struct SharedArray 
{
    int count;
    int elements[MAX_ELEMENTS];
};

#endif
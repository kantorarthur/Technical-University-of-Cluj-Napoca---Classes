#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    int *v;
    int capacitate;
    int size;
    int head,tail;
}queue;

queue *init(int capacit)
{
    queue *p=(queue *)malloc(sizeof(queue));
    p->v=(int *)malloc(capacit*sizeof(int));
    p->capacitate=capacit;
    p->size=0;
    p->head=0;
    p->tail=0;
    return p;
}

void enqueue(queue *l,int key)
{
    if(l->capacitate<=l->size)
        return;
    else
    {
        if(l->tail==l->capacitate)
            l->tail=0;
        l->v[l->tail]=key;
        l->tail++;
        l->size++;
    }
}

int dequeue(queue *l)
{
    if(l->size==0)
        return 0;
    int c=l->v[l->head];
    l->head++;
    if(l->head==l->capacitate)
        l->head=0;
    l->size--;
    return c;
}

void afisare(queue *l)
{
    int d=l->head;
    while(d!=l->tail)
    {
        printf("%d ",l->v[d]);
        d=(d+1)%l->capacitate;
    }
}

int main()
{
    queue *l=init(5);
    enqueue(l,5);
    enqueue(l,10);
    dequeue(l);
    dequeue(l);
    dequeue(l);
    afisare(l);
    free(l->v);
    return 0;
}

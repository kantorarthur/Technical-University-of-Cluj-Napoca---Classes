#include <stdio.h>
#include <stdlib.h>
typedef struct stv{
    int key;
    struct stv *next;
}NodeS;

typedef struct{
    NodeS *first;
}stiva;

stiva *init()
{
    stiva *p=(stiva *)malloc(sizeof(stiva));
    p->first=NULL;
    return p;
}

NodeS *creareNod(int key)
{
    NodeS *p=(NodeS *)malloc(sizeof(stiva));
    p->key=key;
    p->next=NULL;
    return p;
}

void push(int key,stiva *s)
{
    NodeS *p=creareNod(key);
    if(s==NULL)
        s->first=p;
    else
    {
        p->next=s->first;
        s->first=p;
    }
}

int pop(stiva *s)
{
    if(s->first==NULL)
        return 0;
    int c=s->first->key;
    stiva *d=s->first;
    s->first=s->first->next;
    free(d);
    return c;
}


void afisare(stiva *s)
{
    NodeS *p=s->first;
    while(p!=NULL)
    {
        printf("%d ",p->key);
        p=p->next;
    }
}
int main()
{
    stiva *s=init();
    push(5,s);
    push(30,s);
    pop(s);
    pop(s);
    afisare(s);
    return 0;
}

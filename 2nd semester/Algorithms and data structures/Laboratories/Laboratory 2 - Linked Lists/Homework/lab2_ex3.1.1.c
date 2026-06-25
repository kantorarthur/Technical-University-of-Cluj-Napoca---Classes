#include <stdio.h>
#include <stdlib.h>
typedef struct node{
    int key;
    struct node *next;
}NodeT;

typedef struct{
    NodeT *first;
    NodeT *last;
}lista;

lista *init()
{
    lista *p=(lista *)malloc(sizeof(lista));
    p->first=NULL;
    p->last=NULL;
    return p;
}

NodeT *creareNod(int key)
{
    NodeT *p=(NodeT *)malloc(sizeof(NodeT));
    p->key=key;
    p->next=NULL;
    return p;
}

void insSfarsit(lista *l,int key)
{
    NodeT *p=creareNod(key);
    if(l->first==NULL)
        l->first=l->last=p;
    else
    {
        l->last->next=p;
        l->last=p;
    }
}
void insInc(lista *l,int key)
{
    NodeT *p=creareNod(key);
    if(l->first==NULL)
        l->first=l->last=p;
    else
    {
        l->first->next=p;
        p->next=l->first;
        l->first=p;
    }
}
void invers(lista *l)
{
    NodeT *prev=NULL;
    NodeT *p=l->first;
    NodeT *next=NULL;
    while(p!=NULL)
    {
        next=p->next;
        p->next=prev;
        prev=p;
        p=next;
    }
    l->last=l->first;
    l->first=prev;
}
void afisare(lista *l)
{
    NodeT *p=l->first;
    while(p!=NULL)
    {
        printf("%d ",p->key);
        p=p->next;
    }
}

int main()
{
    lista *l=init();
    insInc(l,10);
    insSfarsit(l,25);
    afisare(l);
    printf("\nLista inversata este:");
    invers(l);
    afisare(l);
    free(l);
    return 0;

}

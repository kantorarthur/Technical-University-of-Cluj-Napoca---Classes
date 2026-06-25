#include <stdio.h>
#include <stdlib.h>

typedef struct node{
    int key;
    struct node *next;
    struct node *prev;
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
    p->prev=NULL;
    return p;
}

void insSfarsit(lista *l,int key)
{
    NodeT *p=creareNod(key);
    if(l->first==NULL)
        l->first=l->last=p;
    else if(l->first->next==NULL && l->first!=NULL)
    {
        p->prev=l->first->next;
        l->first->next=p;
        l->last=p;
    }
    else
    {
        p->prev=l->last->next;
        l->last->next=p;
        l->last=p;
    }

}

void inserareInceput(lista *l,int key)
{
    NodeT *p=creareNod(key);
    if(l->first==NULL)
        l->first=l->last=p;
    else
    {
        p->next=l->first;
        l->first->prev=p->next;
        l->first=p;
    }
}
void afisareInceput(lista *l)
{
    NodeT *p=l->first;
    while(p!=NULL)
    {
        printf("%d ",p->key);
        p=p->next;
    }
}
void afisareSfarsit(lista *l)
{
    NodeT *p=l->last;
    while(p!=NULL)
    {
        printf("%d ",p->key);
        p=p->prev;
    }
}

NodeT *cautare(lista *l,int key)
{
    if(l->first==NULL)
        return NULL;
    NodeT *p=l->first;
    while(p!=NULL)
    {
        if(p->key==key)
            return p;
        p=p->next;
    }
    return NULL;
}

int main()
{
    lista *l=init();
    insSfarsit(l,10);
    insSfarsit(l,15);
    insSfarsit(l,30);
    inserareInceput(l,25);
    afisareInceput(l);
    return 0;
}

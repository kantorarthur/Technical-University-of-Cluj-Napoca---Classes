#include <stdio.h>
#include <stdlib.h>
typedef struct nod
{
    int key;
    struct nod *next;
    struct nod *prev;
}NodeDB;

typedef struct{
    NodeDB *first;
    NodeDB *last;
}lista;

lista *init()
{
    lista *p=(lista *)malloc(sizeof(lista));
    p->first=NULL;
    p->last=NULL;
    return p;
}

NodeDB *creareNod(int key)
{
    NodeDB *p=(NodeDB *)malloc(sizeof(NodeDB));
    p->key=key;
    p->next=NULL;
    p->prev=NULL;
    return p;
}

void inserareSfarsit(int key,lista *l)
{
    NodeDB *p=creareNod(key);
    if(l->first==NULL)
        l->first=l->last=p;
    else
    {
        p->prev=l->last;
        l->last->next=p;
        l->last=p;
    }
}
void inserareInceput(lista *l,int key)
{
    NodeDB *p=creareNod(key);
    if(l->first==NULL)
        l->first=l->last=p;
    else
    {
        p->next=l->first;
        l->first->prev=p;
        l->first=p;
    }
}
NodeDB *cautare(lista *l,int key)
{
    NodeDB *p=l->first;
    while(p!=NULL)
    {
        if(p->key==key)
            return p;
        p=p->next;
    }
    return NULL;
}

void inserareDupaCheie(lista *l,int key,int keycaut)
{
    NodeDB *p=creareNod(key);
    NodeDB *d=cautare(l,keycaut);
    if(d==NULL)
        return;
    else if(d==l->last)
    {
        inserareSfarsit(key,l);
    }
    else
    {
        p->prev=d;
        p->next=d->next;
        NodeDB *x=d->next;
        x->prev=p;
        d->next=p;
    }
}

void afisareInceput(lista *l)
{
    NodeDB *p=l->first;
    while(p!=NULL)
    {
        printf("%d ",p->key);
        p=p->next;
    }
}
void afisareSfarsit(lista *l)
{
    NodeDB *p=l->last;
    while(p!=NULL)
    {
        printf("%d ",p->key);\
        p=p->prev;
    }
}

void stergePrimu(lista *l)
{
    NodeDB *p=l->first;
    if(l->first==NULL)
        return;
    else if(l->first->next!=NULL)
    {

    l->first=l->first->next;
    l->first->prev=NULL;
    }
    else
    {
        l->first=l->last=NULL;
    }
    free(p);
}
void stergeUltimul(lista *l)
{
    if(l->first==NULL)
        return;
    NodeDB *p=l->last;
    if(l->last->prev!=NULL)
    {
    l->last=l->last->prev;
    l->last->next=NULL;
    }
    else
    {
        l->last=l->first=NULL;
    }
    free(p);
}
void stergeCheie(lista *l,int key)
{
    NodeDB *p=cautare(l,key);
    if(p==NULL)
        return;
    else if(p->prev==NULL)
    {
        stergePrimu(p);
    }
    else if(p==l->last)
    {
        stergeUltimul(p);
    }
    else
    {
        NodeDB *da=p->prev;
        NodeDB *nu=p->next;
        da->next=nu;
        nu->prev=da;
        free(p);
    }

}
int main()
{
    lista *l=init();
    inserareInceput(l,25);
    inserareSfarsit(15,l);
    inserareSfarsit(3,l);
    inserareDupaCheie(l,2,3);
    inserareDupaCheie(l,45,25);
    inserareInceput(l,30);
    inserareDupaCheie(l,15,30);
    stergeUltimul(l);
    stergeCheie(l,45);
    afisareInceput(l);
    return 0;

}

#include <stdio.h>
#include <stdlib.h>

typedef struct node{
    int key;
    struct node *next;
}NodeT;

typedef struct
{
    NodeT *first;
    NodeT *last;
}lista; //structul asta il apelez cand am nevoie de first/last

//LISTELE (LISTA SI NODET) SUNT ACELEASI!! APELEZ LISTA DOAR CAND AM NEVOIE DE FIRST/LAST, IN REST DACA APELEZ NODET SAU LISTA E ACEEASI LISTA

lista *listaVida()
{
    lista *p=(lista*)malloc(sizeof(lista));
    p->last=NULL;
    p->first=NULL;
    return p;
}

NodeT *nodNou(int key)
{
    NodeT *p=(NodeT*)malloc(sizeof(NodeT));
    p->key=key;
    p->next=NULL;
    return p;
}

void inserareInceput(lista *li,int key)
{
    NodeT *p=nodNou(key);
    if(li->first==NULL)
        li->first=li->last=p;
    else
    {
        p->next=li->first;
        li->first=p;
    }
}

void inserareSfarsit(lista *li,int key)
{
    NodeT *p=nodNou(key);
    if(li->first==NULL)
        li->first=li->last=p;
    else
    {
        li->last->next=p;
        li->last=p;
    }
}
void afisare(lista *li)
{
    printf("Lista este:");
    NodeT *consti=li->first;
    while(consti!=NULL)
    {
        printf("%d ",consti->key);
        consti=consti->next;
    }
}

NodeT *cautare(lista *li,int key)
{
    NodeT *p=li->first;
    while(p!=NULL)
    {
        if(p->key==key)
        {
            return p;
        }
        p=p->next;
    }
    return NULL;//inseamna ca nu s-a gasit cheie
}

void inserareDupaCheie(lista *li,int key,int valoareCautata)
{
    NodeT *p=nodNou(key);
    NodeT *d=cautare(li,valoareCautata);
    if(d==NULL)
    {
        printf("\nValoarea cautata nu exista in sir");
    }
    else
    {
        if(d->next==NULL)
        {
            inserareSfarsit(li,key);
        }
        else
        {
            p->next=d->next;
            d->next=p;
        }
    }
}



int main()
{
    lista *li=listaVida();
    inserareInceput(li,10);
    inserareSfarsit(li,20);
    inserareSfarsit(li,25);
    inserareDupaCheie(li,30,20);
    afisare(li);
    free(li);
    return 0;
}

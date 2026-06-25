#include <stdio.h>
#include <stdlib.h>
#define m 7


typedef struct node
{
   int key;
   struct node *next;
}NodeT;

int hashing(int key)
{
    return key%m;
}

void insert(NodeT *lista[m],int key)
{
    int index=hashing(key);
    NodeT *p=(NodeT *)malloc(sizeof(NodeT));
    p->key=key;
    p->next=lista[index];
    lista[index]=p;
}

NodeT *cautare(NodeT *lista[m],int key)
{
    NodeT *p=lista[hashing(key)];
    while(p!=NULL)
    {
        if(p->key==key)
            return p;
        p=p->next;
    }
    return NULL;
}

void afiseaza(NodeT *lista[m])
{
    for(int i=0;i<m;i++)
    {
        if(lista[i]!=NULL)
        {
            printf("La adresa %d avem urmatoarele valori:",i);
            NodeT *p=lista[i];
            while(p!=NULL)
            {
                printf("%d ",p->key);
                p=p->next;
            }
            printf("\n");
        }
    }
}

void delKey(NodeT *lista[m],int key)
{
    int index=hashing(key);
    NodeT *d=cautare(lista,key);
    NodeT *p=lista[index];
    if(d==lista[index]) // asta inseamna ca e primul element
    {
        lista[index]=lista[index]->next;
        free(d);
    }
    else if(d!=NULL && d->next==NULL)
    {
        while(p!=NULL)
        {
            if(p->next==d)
            {
                p->next=NULL;
                free(d);
                break;
            }
            p=p->next;
        }
    }
    else
    {
        while(p!=NULL)
        {
            if(p->next==d)
            {
                p->next=d->next;
                free(d);
                break;
            }
            p=p->next;
        }
    }
}

int main()
{
    NodeT *lista[m];
    for(int i=0;i<m;i++)
        lista[i]=NULL;
    insert(lista,5);
    insert(lista,25);
    insert(lista,35);
    insert(lista,15);
    insert(lista,62);
    insert(lista,32);
    insert(lista,33);
    delKey(lista,32);
    afiseaza(lista);
    return 0;

}

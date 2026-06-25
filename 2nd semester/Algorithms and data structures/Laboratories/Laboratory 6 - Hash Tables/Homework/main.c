#include <stdio.h>
#include <stdlib.h>
#define m 7

typedef struct node
{
    int val;
    struct node *next;

}NodeT;


int hashing(int key)
{
    return key%m;
}

void insertFirst(NodeT *hTable[m],int val)
{
    int poz=hashing(val);
    NodeT *p=(NodeT *)malloc(sizeof(NodeT));
    p->val=val;
    p->next=hTable[poz];
    hTable[poz]=p;
}

NodeT* cautare(NodeT* hTable[m],int key)
{
    int poz=hashing(key);
    NodeT *p=hTable[poz];
    while(p!=NULL)
    {
        if(p->val==key)
            return p;
        p=p->next;
    }
    return 0;
}

void afisare(NodeT *hTable[m])
{
    for(int i=0;i<m;i++)
    {
        if(hTable[i]!=NULL)
        {
            printf("La pozitia %d avem urmatoarele elemente:",i);
            NodeT *p=hTable[i];
            while(p!=NULL)
            {
                printf("%d ",p->val);
                p=p->next;
            }
            printf("\n");
        }
    }
}

void delete(NodeT *hTable[m],int key)
{
    NodeT *p=hTable[hashing(key)];
    while(p!=NULL)
    {
        if(p->val==key)
        {

        }
    }
}

int main()
{
    NodeT *hTable[m];
    for(int i=0;i<m;i++)
    {
        hTable[i]=NULL;
    }
    insertFirst(hTable,3);
    insertFirst(hTable,5);
    afisare(hTable);
    return 0;
}

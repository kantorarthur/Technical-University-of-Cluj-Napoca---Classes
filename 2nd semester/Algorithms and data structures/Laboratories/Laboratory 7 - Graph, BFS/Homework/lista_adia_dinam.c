#include <stdio.h>
#include <stdlib.h>
typedef struct nod
{
    int key;
    struct nod *next;
} nodet;

typedef struct
{
    int n;
    nodet* *t;
} graf;

enum {nevizitat,vizitat};

typedef struct
{
    nodet *last,*first;
} coada;

coada *initcoada()
{
    coada *p=(coada*)malloc(sizeof(coada));
    p->first=p->last=NULL;
    return p;
}

nodet *crearenod(int key)
{
    nodet *p=(nodet *)malloc(sizeof(nodet));
    p->key=key;
    p->next=NULL;
    return p;
}

void enqueue(int key,coada *q) // insert last
{
    nodet *p=crearenod(key);
    if(q->first==NULL)
        q->first=q->last=p;
    else
    {
        q->last->next=p;
        q->last=p;
    }

}

int dequeue(coada *q)
{
    if(q->first==NULL)
        return -1;
    else if(q->first==q->last)
    {
        nodet *p=q->first;
        int cheie=p->key;
        q->first=q->last=NULL;
        free(p);
        return cheie;
    }
    else
    {
        nodet *p=q->first;
        while(p!=NULL)
        {
            if(p->next==q->last)
            {
                nodet *temp=q->last;
                p->next=NULL;
                q->last=p;
                int cheie=temp->key;
                free(q->last);
                return cheie;
            }
        }
    }
}

int goala(coada *q)
{
    return (q->first==NULL);
}

void bfs(graf *g,int nodstart)
{
    int *vizitate=(int *)malloc(g->n*sizeof(int));
    coada *q=initcoada();
    for(int i=0;i<g->n;i++)
        vizitate[i]=nevizitat;
    vizitate[nodstart]=vizitat;
    enqueue(nodstart,q);
    while(goala(q)!=1)
    {
        int v=dequeue(q);
        printf("\nnod vizitat: %d",v);
        nodet *p=g->t[v];
        while(p!=NULL)
        {
            if(vizitate[p->key]==nevizitat)
            {
                vizitate[p->key]=vizitat;
                enqueue(p->key,q);
            }
            p=p->next;
        }
    }
    free(vizitate);
    free(q);
}

void citesteGraf(graf *g, FILE *citesc)
{
    int n;
    fscanf(citesc,"%d",&n);
    g->n=n;
    g->t=malloc(g->n*sizeof(nodet*));
    for(int i=0; i<g->n; i++)
        g->t[i]=NULL;
    int v,w;
    while(fscanf(citesc,"%d %d",&v,&w)==2)
    {
        nodet *p=crearenod(w);
        p->next=g->t[v];
        g->t[v]=p;

        //pt graf neorientat mai jos
        nodet *p2=crearenod(v);
        p2->next=g->t[w];
        g->t[w]=p2;
    }
}

void afisaregraf(graf *g)
{
    for(int i=0; i<g->n; i++)
    {
        printf("pt varful %d avem muchii cu:",i);
        nodet *p=g->t[i];
        while(p!=NULL)
        {
            printf("%d ",p->key);
            p=p->next;
        }
        printf("\n");
    }

}


int main()
{
    graf g;
    FILE *citesc=fopen("graf.txt","r");
    citesteGraf(&g,citesc);
    afisaregraf(&g);
    return 0;
}

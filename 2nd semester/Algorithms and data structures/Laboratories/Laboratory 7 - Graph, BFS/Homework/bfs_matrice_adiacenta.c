#include <stdio.h>
#include <stdlib.h>
typedef struct
{
    int **m;
    int n;
}graf;

enum{nevizitat,vizitat};

typedef struct nod
{
    int key;
    struct nod *next;

}nodet;

typedef struct
{
    nodet *first;

}coada;

coada * initCoada()
{
    coada *q=(coada *)malloc(sizeof(coada));
    q->first=NULL;
    return q;
}

nodet *creareNod(int key)
{
    nodet *p=(nodet *)malloc(sizeof(nodet));
    p->key=key;
    p->next=NULL;
    return p;
}

nodet *searchLast(coada *q)
{
    nodet *p=q->first;
    while(p!=NULL)
    {
        if(p->next==NULL)
            return p;
        p=p->next;
    }
    return NULL;
}

void enqueue(int key,coada *q) //insert last
{
    nodet *p=creareNod(key);
    if(q->first==NULL)
    {
        q->first=p;
    }
    else
    {
        nodet *last=searchLast(q);
        last->next=p;
    }
}

int dequeue(coada *q)
{
    if(q->first==NULL)
        return;
    else if(q->first->next==NULL)
    {
        nodet *d=q->first;
        q->first=NULL;
        int cheie=d->key;
        free(d);
        return cheie;
    }
    else
    {
        nodet *p=q->first;
        q->first=q->first->next;
        int cheie=p->key;
        free(p);
        return cheie;
    }
}

void citesteGraf(graf *g,int n,FILE *citesc)
{
    g->n=n;
    g->m=(int **)malloc(g->n*sizeof(int *));
    for(int i=0;i<g->n;i++)
        g->m[i]=(int *)malloc(g->n*sizeof(int));
    for(int i=0;i<g->n;i++)
        for(int j=0;j<g->n;j++)
            g->m[i][j]=0;
    int v,w;
    while(fscanf(citesc,"%d %d",&v,&w)==2)
        g->m[v][w]=1;
}

void afisez(graf *g)
{
    for(int i=0;i<g->n;i++)
    {
        for(int j=0;j<g->n;j++)
        {
            printf("%d ",g->m[i][j]);
        }
        printf("\n");
    }
}

void eliberez(graf *g)
{
    for(int i=0;i<g->n;i++)
        free(g->m[i]);
    free(g->m);
}

void bfs(coada *q,graf g,int nodStart)
{
    int *vizitate;
    vizitate=(int *)calloc(g.n,sizeof(int));
    for(int i=0;i<g.n;i++)
        vizitate[i]=nevizitat;
    vizitate[nodStart]=vizitat;
    enqueue(nodStart,q);
    while(q->first!=NULL)
    {
        int v=dequeue(q);
        printf("Nod vizitat: %d\n",v);
        for(int i=0;i<g.n;i++)
        {
            if(g.m[v][i]==1 && vizitate[i]==nevizitat)
            {
                printf("avem muchie cu %d \n",i);
                vizitate[i]=vizitat;
                enqueue(i,q);
            }
        }
    }
    free(vizitate);
}

int main()
{
    coada *q=initCoada();
    graf g;
    FILE *citesc=fopen("graf.txt","r");
    citesteGraf(&g,6,citesc);
    fclose(citesc);
    afisez(&g);
    bfs(q,g,0);
    eliberez(&g);


    return 0;
}

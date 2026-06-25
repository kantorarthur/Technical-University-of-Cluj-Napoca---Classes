#include <stdio.h>
#include <stdlib.h>
typedef struct nod
{
    int key;
    struct nod *next;
} NodeT;

typedef struct
{
    int n;
    NodeT **t;
    int *pi;
    int *d;
    int *f;
    int *color;
}Graf;

enum{white,grey,black};

void insr_first(NodeT **stiva,int key)
{
    NodeT *p=(NodeT *)malloc(sizeof(NodeT));
    p->key=key;
    p->next=(*stiva);
    *stiva=p;
}

int del_first(NodeT **stiva)
{
    int n=0;
    if(*stiva!=NULL)
    {
        NodeT *primElem=*stiva;
        *stiva=(*stiva)->next;
        n=primElem->key;
        free(primElem);
    }
    return n;
}

void init(NodeT **stiva)
{
    *stiva=NULL;
}

void dfs_visit_iterativ(Graf *g,int start)
{
    NodeT *stiva;
    init(&stiva);
    insr_first(&stiva, start);

    while (stiva != NULL)
    {
        int u = del_first(&stiva);

        if (g->color[u] == white)
        {
            g->color[u] = grey;
            printf("Visitat: %d\n", u);

            NodeT *v = g->t[u];
            while (v != NULL)
            {
                if (g->color[v->key] == white)
                {
                    g->pi[v->key] = u;
                    insr_first(&stiva, v->key);
                }
                v = v->next;
            }
            g->color[u] = black;
        }
    }
}


void dfs_iterativ(Graf *g)
{
    for(int i=0;i<g->n;i++)
        if(g->color == white)
            dfs_visit_iterativ(g,i);
}

void citesteGraf(FILE *f, Graf *pG) {

    fscanf(f, "%d", &pG->n);  // citeste nr. de varfuri

    pG->t = (NodeT **) calloc(pG->n, sizeof(NodeT *));
    if (pG->t == NULL) printErr();  // alocare esuata

    pG->pi = (int *) calloc(pG->n, sizeof(int));
    pG->d = (int *) calloc(pG->n, sizeof(int));
    pG->f = (int *) calloc(pG->n, sizeof(int));
    pG->color = (int *) calloc(pG->n, sizeof(int));

    int i;
    for (i = 0; i < pG->n; i++) {
        pG->t[i] = NULL;
        pG->pi[i] = -1;
    }

    int v, w;
    while (fscanf(f, "%d%d", &v, &w) == 2) {
        //graful va fi neorientat, se adauga atat arcul (v,w) cat si (w,v)
        push(&pG->t[w], v);
        push(&pG->t[v], w);
    }
}



int main()
{
    FILE *citesc=fopen("graf.txt","r");
    Graf g;
    citesteGraf(citesc,g);
    fclose(citesc);


}

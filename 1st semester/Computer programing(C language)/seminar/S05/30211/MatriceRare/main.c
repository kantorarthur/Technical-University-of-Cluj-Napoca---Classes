//L10Pb11
#include <stdio.h>
#include <stdlib.h>

struct element {
    int r,c,val;
};

struct matrice {
    int m,n,nelem;
    struct element *e;
};

struct matrice* citeste()
{
    struct matrice* mat = (struct matrice*)malloc(sizeof(struct matrice));
    printf("Nr linii=");
    scanf("%d", &mat->m);
    printf("Nr coloane=");
    scanf("%d", &mat->n);
    printf("Nr elemente nenule=");
    scanf("%d", &mat->nelem);
    mat->e = (struct element*)malloc(mat->nelem * sizeof(struct element));
    printf("Elemente de forma (rand,coloana,valoare):\n");
    for (int i=0; i<mat->nelem; i++)
        scanf(" (%d,%d,%d)",&mat->e[i].r, &mat->e[i].c, &mat->e[i].val);

    return mat;
}

struct element* corespondent(struct element* p, struct matrice *mat)
{
    for (int i=0; i<mat->nelem; i++)
        if (p->r == mat->e[i].r && p->c == mat->e[i].c)
            return mat->e + i;
    return NULL;
}

void afiseaza(struct matrice *mat)
{
    if (mat==NULL)
    {
        printf("NU EXISTA!");
        return;
    }

    for (int i=0; i<mat->nelem; i++)
        printf("(%d,%d,%d)\n",mat->e[i].r, mat->e[i].c, mat->e[i].val);
}

void dezaloca(struct matrice *mat)
{
    if (mat==NULL)
        return;
    free(mat->e);
    free(mat);
}

struct matrice* suma(struct matrice *a, struct matrice* b)
{
    if (a->m != b->m || a->n != b->n)
        return NULL; // nu se pot aduna!

    struct matrice* c = (struct matrice*)malloc(sizeof(struct matrice));
    c->m = a->m;
    c->n = a->n;
    c->nelem=0;
    c->e = (struct element*)malloc((a->nelem + b->nelem) * sizeof(struct element));

    for (int i=0; i<a->nelem; i++)
    {
        struct element* x = corespondent(a->e + i, b);
        if (x==NULL)
        {
            c->e[c->nelem] = a->e[i];
            c->nelem++;
        } else
        {
            int s= a->e[i].val + x->val;
            if (s!=0)
            {
                c->e[c->nelem].r = a->e[i].r;
                c->e[c->nelem].c = a->e[i].c;
                c->e[c->nelem].val = s;
                c->nelem++;
            }
        }
    }

    for (int i=0; i<b->nelem; i++)
    {
        struct element* x = corespondent(b->e + i, a);
        if (x==NULL)
        {
            c->e[c->nelem] = b->e[i];
            c->nelem++;
        }
    }
    return c;
}

int main()
{
    struct matrice *a = citeste();
    struct matrice *b = citeste();
    struct matrice *c = suma(a, b);
    printf("Suma este:\n");
    afiseaza(c);
    dezaloca(a);
    dezaloca(b);
    dezaloca(c);
    return 0;
}

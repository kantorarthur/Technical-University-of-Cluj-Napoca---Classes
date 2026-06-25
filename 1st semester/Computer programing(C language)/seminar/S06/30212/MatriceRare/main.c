//L10Pb11
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int r ,c ,val;
}element;

typedef struct {
    int m,n,nr_elem;
    element *e;
}matrice;

element*  corespondent(element* x,matrice *mat)
{
    for(int i=0;i<mat->nr_elem;i++)
        if(x->r==mat->e[i].r && x->c==mat->e[i].c)
            return mat->e+i;
    return NULL;
}
matrice* citeste()
{
    matrice* mat=malloc(sizeof(matrice));
    printf("nr linii= ");
    scanf("%d",&mat->m);//(*mat).m
    printf("nr coloane= ");
    scanf("%d",&mat->n);
    printf("nr el nenule= ");
    scanf("%d",&mat->nr_elem);
    mat->e=malloc(mat->nr_elem*sizeof(element));
    printf("Elementele nenule de forma (rand,coloana,valoare)\n");
    for(int i=0;i<mat->nr_elem;i++)
        scanf(" (%d,%d,%d)", &mat->e[i].r, &mat->e[i].c, &mat->e[i].val);
    return mat;
}
matrice* suma(matrice* a,matrice* b)
{
    if(a->m!=b->m || a->n!=b->n)
        return NULL;//return 0
    matrice* c=malloc(sizeof(matrice));
    c->m=a->m;
    c->n=a->n;
    c->nr_elem=0;
    c->e=malloc((a->nr_elem+b->nr_elem)*sizeof(element));
    for(int i=0;i<a->nr_elem;i++)
    {
        element *x=corespondent(a->e+i,b);
        if(x==NULL)
        {
            c->e[c->nr_elem]=a->e[i];
            c->nr_elem++;
        }
        else
        {
            int s=a->e[i].val+x->val;
            if(s!=0)
            {
                c->e[c->nr_elem].r=a->e[i].r;
                c->e[c->nr_elem].c=a->e[i].c;
                c->e[c->nr_elem].val=s;
                c->nr_elem++;
            }
        }
    }
    for(int i=0;i<b->nr_elem;i++)
    {
        element *x=corespondent(b->e+i,a);
        if(x==NULL)
        {
            c->e[c->nr_elem]=b->e[i];
            c->nr_elem++;
        }
    }
    return c;
}
void afiseaza(matrice * mat)
{
    if (mat==NULL)
        printf("Matrice inexistenta!");
    else
        for(int i=0;i<mat->nr_elem;i++)
            printf("(%d,%d,%d)\n", mat->e[i].r, mat->e[i].c, mat->e[i].val);
}
void dezaloca(matrice *mat)
{
    if (mat!=NULL)
    {
        free(mat->e);
        free(mat);
    }
}
int main()
{
    matrice *a=citeste();
    matrice *b=citeste();
    matrice *c=suma(a,b);
    printf("Elementele nenule ale sumei sunt: \n");
    afiseaza(c);
    dezaloca(a);
    dezaloca(b);
    dezaloca(c);
    return 0;
}

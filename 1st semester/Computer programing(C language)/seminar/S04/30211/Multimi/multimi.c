#include <stdio.h>
#include "multimi.h"

static int exista(int x, int t[], int n)
{
    for (int i=0; i<n; i++)
        if (t[i]==x)
            return 1;
    return 0;
}

void citeste(int* x, int* n)
{
    char c;
    int v;
    *n=0;
    do {
        scanf("%d%c",&v,&c);
        if (!exista(v,x,*n))
        {
            x[*n]=v;
            (*n)++;
        }
    }while (c==',');
}

void reuniune(int*A,int nA, int *B,int nB,int* X,int* nX)
{
    *nX=nA;
    for (int i=0; i<nA; i++)
        X[i]=A[i];
    for (int i=0; i<nB; i++)
        if (!exista(B[i],A,nA))
        {
            X[*nX]=B[i];
            (*nX)++;
        }
}

void intersectie(int*A,int nA, int *B,int nB,int* X,int* nX)
{
    *nX=0;
    for (int i=0; i<nB; i++)
        if (exista(B[i],A,nA))
        {
            X[*nX]=B[i];
            (*nX)++;
        }
}

void afiseaza(int t[], int n)
{
    for (int i=0; i<n; i++)
        printf("%d ",t[i]);
}

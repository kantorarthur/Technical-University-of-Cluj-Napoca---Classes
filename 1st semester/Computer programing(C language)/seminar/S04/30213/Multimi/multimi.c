#include <stdio.h>
#include "multimi.h"

static int exista(int val, int X[], int n)
{
    for (int i=0; i<n; i++)
        if (X[i]==val)
            return 1;

    return 0;
}

void citeste(int X[], int* n)
{
    printf("Introduceti intregi separati prin virgule si terminati cu punct: \n");
    char c;
    int v;
    *n=0;
    do {
        scanf("%d%c",&v,&c);
        if (!exista(v,X,*n))
        {
            X[*n]=v;
            (*n)++;
        }
    }while (c==',');
}

void intersectie(int*A,int nA,int B[],int nB,int* X,int* nX)
{
    *nX=0;
    for (int i=0; i<nA; i++)
        if (exista(A[i],B,nB))
        {
            X[*nX]=A[i];
            (*nX)++;
        }
}
void reuniune(int*A,int nA,int B[],int nB,int* X,int* nX)
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

void afiseaza(int* X,int n)
{
    for (int i=0; i<n; i++)
        printf("%d ",X[i]);
}

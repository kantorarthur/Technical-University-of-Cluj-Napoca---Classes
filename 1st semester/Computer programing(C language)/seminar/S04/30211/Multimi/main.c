//L6Pb3
#include <stdio.h>
#include "multimi.h"

int main()
{
    int A[N],B[N],R[2*N],I[N];
    int nA, nB, nR, nI;
    citeste(A,&nA);
    citeste(B,&nB);
    reuniune(A,nA,B,nB,R,&nR);
    intersectie(A,nA,B,nB,I,&nI);
    printf("Reuniunea este:\n");
    afiseaza(R,nR);
    printf("\nIntersectia este:\n");
    afiseaza(I,nI);
    return 0;
}

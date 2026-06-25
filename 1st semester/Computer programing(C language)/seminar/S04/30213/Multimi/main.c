//L6Pb3
#include <stdio.h>
#include "multimi.h"

int main()
{
    int A[N],B[N],I[N],R[2*N];
    int nA, nB, nI, nR;
    citeste(A,&nA);
    citeste(B,&nB);
    printf("Intersecta este: ");
    intersectie(A,nA,B,nB,I,&nI);
    afiseaza(I,nI);
    printf("\nReuniunea este: ");
    reuniune(A,nA,B,nB,R,&nR);
    afiseaza(R,nR);
    return 0;
}

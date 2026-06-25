//L7Pb9
#include <stdio.h>
#include <stdlib.h>

int** aloca(int r, int c)
{
    int **a=(int**)malloc(r*sizeof(int*));
    for (int i=0;i<r;i++)
        a[i]=(int*)calloc(c, sizeof(int));
    return a;
}

void citeste(int* n, int ***X)
{
    printf("n=");
    scanf("%d", n);
    *X = aloca(*n,*n);
    for(int i=0; i<*n; i++)
        for (int j=0; j<*n; j++)
            {
                printf("Element[%d][%d]=",i,j);
                scanf("%d", (*X)[i]+j); // &(*X)[i][j]
            }
}

int** inmulteste(int **A, int **B, int n)
{
    int **C = aloca(n,n);
    for (int i=0; i<n; i++)
        for (int j=0; j<n; j++)
            for (int k=0; k<n; k++)
                C[i][j] += A[i][k]*B[k][j];
    return C;
}

void copiaza(int** SRC, int **DST, int n)
{
    for (int i=0; i<n; i++)
        for (int j=0; j<n; j++)
                *(*(DST+i)+j) = *(*(SRC+i)+j);
}

void dezaloca(int **, int n);

int** putere(int** A, int n, int k)
{
    int **R=aloca(n,n);
    for (int i=0; i<n; i++)
        R[i][i]=1;

    for (int i=0; i<k; i++)
    {
        int **AUX = inmulteste(R,A,n);
        copiaza(AUX,R,n);
        dezaloca(AUX,n);
    }
    return R;
}

void afiseaza(int **X, int n)
{
    for (int i=0; i<n; i++)
    {
        for (int j=0; j<n; j++)
            printf("%d ", *(*(X+i)+j));
        printf("\n");
    }
}

void dezaloca(int **X, int n)
{
    for (int i=0; i<n; i++)
        free(X[i]); //  *(X+i)
    free(X);
}

int main()
{
    int n;
    int **A;
    citeste(&n,&A);
    printf("k=");
    int k;
    scanf("%d",&k);
    int** R = putere(A,n,k);
    afiseaza(R,n);
    dezaloca(A,n);
    dezaloca(R,n);
    return 0;
}

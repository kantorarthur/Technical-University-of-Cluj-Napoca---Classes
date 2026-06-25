#include <stdio.h>
#include <stdlib.h>
void genereaza(int a[],int n, int ***mat, int *nr)
{
    *mat=(int**)malloc(n*sizeof(int*));
    for(int i=0; i<n; i++)
        (*mat)[i]=(int*)malloc(n*sizeof(int));
    for(int i=0; i<n;i++)
        (*mat)[0][i]=a[i];
    for(int i=1; i<n;i++)
        (*mat)[i][n-1]=a[i-1];
    for(int i=1; i<n; i++)
        for(int j=0; j<n-1; j++)
          (*mat)[i][j]=(*mat)[i-1][j+1];
    *nr=n*n;
}
void afiseaza(int**mat, int n)
{
    for(int i=0; i<n; i++)
    {
        for(int j=0; j<n; j++)
            printf("%d ",mat[i][j]);
        printf("\n");
    }
}
int main()
{
    int a[] = {10,20,30,40};
    int n = sizeof(a)/sizeof(*a);
    int **mat;
    int nr;
    genereaza(a,n,&mat,&nr);
    afiseaza(mat,n);
    printf("Nr. total de elemente: %d\n",nr);
    return 0;
}

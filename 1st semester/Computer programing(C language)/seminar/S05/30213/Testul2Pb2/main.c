#include <stdio.h>
#include <stdlib.h>
void genereaza(int *a, int n, int ***mat ,int *nr){
    *mat=(int**)malloc(n*sizeof(int*));
    for (int i=0 ; i < n ;i++)
    {
        (*mat)[i] = (int*)malloc(n*sizeof(int));
        for(int j =0 ; j <n ; j++){
            (*mat)[i][j]= a[(i+j)%n];
        }
    }
    *nr= n*n;
}
void afiseaza(int **mat , int nr){
    for ( int i = 0 ; i < nr ; i++){
        for ( int j = 0 ; j<nr ; j++){
            printf("%d ", mat[i][j]);
        }
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

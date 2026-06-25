#include <stdio.h>
#include <stdlib.h>
void afiseaza(int *v,int n)
{
    for(int i=0;i<n;i++)
        printf("%d ",v[i]);
    printf("\n");
}

void backtracking_perm(int n, int *perm, int *used, int position)
{
    printf("Explorare: ");
    afiseaza(perm,n);
    if(position==n)
    {
        printf("Solutie: ");
        afiseaza(perm,n);
        return;
    }

    for(int i=1;i<=n;i++)
    {
        if(used[i-1]==0)
        {
            perm[position]=i;
            used[i-1]=1;
            backtracking(n,perm,used,position+1);
            used[i-1]=0;
        }
    }
}

void


int main()
{
    int n;
    scanf("%d",&n);
    int *perm=(int *)calloc(n,sizeof(int));
    int *used=(int *)calloc(n,sizeof(int));
    for(int i=0;i<n;i++)
        used[i]=0;
    backtracking_perm(n,perm,used,0);
    for(int i=0;i<n;i++)
        used[i]=0;
    return 0;
}

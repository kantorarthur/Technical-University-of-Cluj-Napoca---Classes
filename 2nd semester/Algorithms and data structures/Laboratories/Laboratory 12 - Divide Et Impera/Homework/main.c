#include <stdio.h>
#include <stdlib.h>

int cautarebinara(int *v,int p,int q,int k)
{
    if(p>q)
        return -1;
    else
    {
        int m=(p+q)/2;
        if(v[m]==k)
            return k;
        else if(v[m]>k)
            return cautarebinara(v,p,m-1,k);
        else
            return cautarebinara(v,m+1,q,k);
    }
}

int interclasare(int *v,int p,int q)
{
    if((p+1)==q)
        return;


        int m=(p+q)/2;
        interclasare(v,p,m);
        interclasare(v,m+1,q);

        int i=p,j=m+1,k=0;
        int temp[q-p+1];


        while(i<m && j <=q)
        {
            if(v[i] <= v[j])
                temp[k++]=v[i++];
            else
                temp[k++]=v[j++];
        }

        while(j<=q)
            temp[k++]=v[j++];

        for(int i=p,k=0;i<=q;i++,k++)
            v[i]=temp[k];
}



int main()
{
    int n;
    scanf("%d",&n);
    int *v=(int *)malloc(n*sizeof(int));
    for(int i=0;i<n;i++)
        scanf("%d",&v[i]);
    printf("%d",cautarebinara(v,0,n-1,3));
    interclasare(v,0,n-1);
    printf("\n");
    for(int i=0;i<n;i++)
        printf("%d ",v[i]);
    free(v);
    return 0;
}

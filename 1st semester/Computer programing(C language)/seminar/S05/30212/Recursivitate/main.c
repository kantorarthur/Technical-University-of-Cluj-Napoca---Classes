#include <stdio.h>
#include <stdlib.h>

float media(int *a,int n)
{
    if(n==1)
        return a[0];
    return (a[0]+media(a+1,n-1)*(n-1))/n;
}
float media_v2(int *a,int n)
{
    if(n==1)
        return a[0];
    return (media(a,n-1)*(n-1)+a[n-1])/n;
}
void afisare_cifre(int n)
{
    if(n/10==0)
        printf("%d ",n);
    else
    {
        afisare_cifre(n/10);
        int c=n%10;
        printf("%d ",c);
    }
}

int biti_unu(int n)
{
    if (n==0)
        return 0;
    if (n<0)
        return 32-biti_unu(~n);
    return n%2 + biti_unu(n>>1);
}
void oglinda(char *str)
{
    if(strlen(str)==0)puts("eroare");
    else if(strlen(str)==1)puts(str);
    else{
        puts(str);
        oglinda(str+1);
        puts(str);
    }
}

int main()
{
    int t[]= {25,14,20,35,10};
    int nt = sizeof(t)/sizeof(*t);
    printf("%f\n", media(t,nt));
    printf("%f\n", media_v2(t,nt));

    afisare_cifre(3719);

    printf("\n%d %d\n", biti_unu(19), biti_unu(-1));

    oglinda("OANA");
    oglinda("");

    return 0;
}


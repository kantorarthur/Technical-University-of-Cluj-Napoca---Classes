#include <stdio.h>
#include <stdlib.h>

float media(int *t, int n)
{
    if (n==1)
        return t[0];
    return (t[0]+media(t+1,n-1)*(n-1))/n;
}

float media_v2(int *t, int n)
{
    if (n==1)
        return t[0];
    return (t[n-1]+media(t,n-1)*(n-1))/n;
}

void afisare_cifre(int n){
    if(n<=9)
        printf("%d ",n);
    else
    {
        afisare_cifre(n/10);
        printf("%d ",n%10);
    }
}

int biti_unu(int n)
{
    if (n==0)
        return 0;
    if (n<0)
        return 32-biti_unu(~n);
    return n%2 + biti_unu(n/2);
}

void oglinda(char *s)
{
    if (strlen(s)==0)
        puts("EROARE");
    else
        if (strlen(s)==1)
            puts(s);
        else
        {
            puts(s);
            oglinda(s+1);
            puts(s);
        }
}

int main()
{
    int t[]={25,14,20,35,10};
    int nt = sizeof(t)/sizeof(*t);
    printf("%f\n", media(t,nt));
    printf("%f\n", media_v2(t,nt));

    afisare_cifre(3719);

    printf("\n%d %d\n", biti_unu(19), biti_unu(-1));

    oglinda("OANA");
    oglinda("");

    return 0;
}

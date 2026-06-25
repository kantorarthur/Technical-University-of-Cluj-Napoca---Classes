//L5Pb4
#include <stdio.h>
#include <stdlib.h>

#define N 100

int lungime(char s[])
{
    int i=0;
    while (s[i]!='\0')
        i++;
    return i;
}

void suma(char x[], char y[], char r[])
{
    int lx = lungime(x);
    int ly = lungime(y);
    int lmax = (lx>ly)?lx:ly;
    int lr=lmax+1;
    int t=0;

    for (int i=0; i<lmax; i++)
    {
        int cifx = (lx-1-i>=0) ? (x[lx-1-i]-'0') : 0;
        int cify = (ly-1-i>=0) ? (y[ly-1-i]-'0') : 0;
        int suma = t+cifx+cify;
        t=suma/10;
        r[lr-1-i]= (suma%10) + '0';
    }
    r[lr]='\0';
    if (t)
        r[0]='1';
    else
    {
        for (int i=0; i<lr; i++)
            r[i]=r[i+1];
    }
}

int main()
{
    char x[N], y[N], r[N+1];
    gets(x);
    gets(y);
    suma(x,y,r);
    puts(r);
    return 0;
}

//L4Pb7
#include <stdio.h>
#include <stdlib.h>

int bisect(int);
int zidinan(int zi, int luna, int an)
{
    int s=0;
    int zileluna[]={31, 28+bisect(an), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    for(int i=0; i<luna-1; i++)
    {
        s+=zileluna[i];
    }
    s+=zi;
    return s;
}
int bisect(int x)
{
    return (((x%4==0)&&!(x%100==0))||(x%400==0));
}

int main()
{
    int zi, luna, an;
    printf("Introduceti data (zz.ll.aaaa):\n");
    scanf("%d.%d.%d", &zi, &luna, &an);
    int z=zidinan(zi, luna, an);
    printf("Este a %d zi din an. Au mai ramas %d zile", z, 365+bisect(an)-z);
    return 0;
}

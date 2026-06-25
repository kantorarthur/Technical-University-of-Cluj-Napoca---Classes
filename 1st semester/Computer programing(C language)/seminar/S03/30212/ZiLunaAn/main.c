//L5Pb7
#include <stdio.h>
#include <stdlib.h>
int bisect(int an)
{
    if((an%4==0 && an%100!=0)|| an%400==0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
int zidinan(int zi,int luna,int an)
{
    int zile[]= {31,28+bisect(an),31,30,31,30,31,31,30,31,30,31};
    int s;
    s=zi;
    for(int i=0; i<luna-1; i++)
    {
        s+=zile[i];
    }
    return s;
}
int main()
{
    printf("Data zz.ll.aaaa: ");
    int zi,luna,an;
    scanf("%d.%d.%d",&zi,&luna,&an);
    int x;
    x=zidinan(zi,luna,an);
    printf("Este a %d-a zi din an. Au mai ramas %d zile",x,365+bisect(an)-x);
    return 0;
}

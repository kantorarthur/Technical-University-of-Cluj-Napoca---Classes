//L5Pb7
#include <stdio.h>
#include <stdlib.h>
int bisect(int n)
{
    if(n%400==0)return 1;
    if(n%100==0)return 0;
    if(n%4==0)return 1;
    return 0;
}
int nr_zile(int z,int l,int a)
{
    int sum=z;
    int v[]= {31,28+bisect(a),31,30,31,30,31,31,30,31,30,31};
    for(int i=0; i<l-1; i++)sum+=v[i];
    return sum;
}
int main()
{
    printf("Data(zz.ll.aaaa):\n");
    int zi,luna,an,n;
    scanf("%d.%d.%d",&zi,&luna,&an);
    n=nr_zile(zi,luna,an);
    printf("Este a %d-a zi din an. Au mai ramas %d zile",n,365+bisect(an)-n);
    return 0;
}

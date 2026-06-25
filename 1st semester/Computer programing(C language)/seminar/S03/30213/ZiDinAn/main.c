//L5Pb7
#include <stdio.h>
#include <stdlib.h>

int bisect(int a)
{
    if((a%4==0 && a%100 !=0) || a%400 == 0) return 1;
    else return 0;
}

int ziDinAn(int z, int l, int a)
{
    int zile[] = {0, 31, 28+bisect(a), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    int sum=z;
    for(int i = 1; i<l; i++)
        sum+=zile[i];
    return sum;
}

int main()
{
    int ziua, luna, anul;
    printf("Introduceti o data de forma: zz.ll.aaaa\n");
    scanf("%d.%d.%d", &ziua, &luna, &anul);
    int x = ziDinAn(ziua, luna, anul);
    printf("Este a %d zi din an. Au mai ramas %d zile", x, 365+bisect(anul)-x);

    return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int F[10]={0};
    char y;
    do
    {
        double x;
        scanf("%lf%c",&x,&y);
        F[(int)abs(x)%10]++;
    }while(y!='*');
    int ma=-1,cifma;
    for(int i=0;i<10;i++)
        if(F[i]>=ma) ma=F[i],cifma=i;
    printf("Cifra %d apare in %d numere",cifma,ma);
    return 0;
}

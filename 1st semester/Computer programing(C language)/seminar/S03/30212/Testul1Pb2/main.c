#include <stdio.h>
#include <stdlib.h>

int main()
{
    int v[10]= {0},max=-1,d,y;
    float x;
    char ch;
    do
    {
        scanf("%f",&x);
        scanf("%c",&ch);
        y=abs((int)x);
        v[y%10]++;
    }
    while(ch!='*');
    for(int i=0; i<=9; i++)
        if(v[i]>=max)
        {
            max=v[i];
            d=i;
    }
    printf("cifra %d apare in %d numere",d,max);
    return 0;
}

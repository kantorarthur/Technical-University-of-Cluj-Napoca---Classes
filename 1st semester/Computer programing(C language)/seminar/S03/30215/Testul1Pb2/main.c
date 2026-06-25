#include <stdio.h>
#include <stdlib.h>

int main()
{
    int v[10]={0};
    float x;
    char c=';';
    while(c!='*')
    {
        scanf("%f",&x);
        scanf("%c",&c);
        int y=(int)x;
        v[abs(y)%10]++;
    }
    int mx=-1,i,k;
    for(i=0;i<=9;i++)
    {
        if(v[i]>=mx)
        {
            mx=v[i];
            k=i;
        }
    }
    printf("Cifra %d apare in %d numere",k,mx);
    return 0;
}

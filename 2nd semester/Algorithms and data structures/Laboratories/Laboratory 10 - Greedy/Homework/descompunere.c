#include <stdio.h>
#include <stdlib.h>

void desc(int n,int *b,int nr)
{
    int cnt=0;
    for(int i=n-1;i>=0;i--)
    {
        while(nr>=b[i] && nr>0)
        {
            printf("Am folosit bancnota %d\n",b[i]);
            nr=nr-b[i];
            cnt++;
        }
        if(nr==0)
        {
            printf("Am folosit %d bancnote",cnt);
            return 0;
        }
    }
}


int main()
{
    int n=7;
    int b[]={1,5,10,50,100,200,500};
    int nr;
    scanf("%d",&nr);
    desc(n,b,nr);
    return 0;
}

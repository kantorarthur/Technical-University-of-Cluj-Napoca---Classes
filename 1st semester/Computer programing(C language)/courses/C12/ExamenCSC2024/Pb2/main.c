#include <stdio.h>
#include <stdlib.h>

int *timp_ramas(int h, int m, int s)
{
    int sec=h*3600+m*60+s;
    int rsec=3600*24-sec;
    int *timpr=(int*)malloc(3*sizeof(int));
    timpr[0]=rsec/3600;
    rsec-=timpr[0]*3600;
    timpr[1]=rsec/60;
    timpr[2]=rsec%60;
    return timpr;
}

int main()
{
    int n;
    int h;
    int m;
    int s;
    scanf("%d",&n);
    for(int i=0;i<n;i++)
    {
        scanf("%d:%d:%d", &h,&m,&s);
        if(!((h>=0)&&(h<24)&&(m>=0)&&(m<60)&&(s>=0)&&(s<60)))
        {
            printf("Date de intrare invalide.");
            return 0;
        }
        int *timp=timp_ramas(h,m,s);
        printf("%02d:%02d:%02d\n",timp[0],timp[1],timp[2]);
        free(timp);
    }

    return 0;
}

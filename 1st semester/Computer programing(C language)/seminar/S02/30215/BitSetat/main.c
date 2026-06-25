// Sa se determine daca cel de-al p-lea bit din reprezentarea unui numar intreg n este sau nu setat!
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n,p;
    printf("n=");
    scanf("%d",&n);
    printf("p=");
    scanf("%d",&p);
    int setat= (n&(1<<p))!=0;
    printf("Bitul %d din reprezentarea lui %d %seste setat!", p, n, setat?"":"nu ");

    return 0;
}

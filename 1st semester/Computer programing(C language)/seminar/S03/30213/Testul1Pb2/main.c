#include <stdio.h>
#include <stdlib.h>

int main()
{
    int aparitii[10]={0};
    char c;
    float f;
    do {
        scanf("%f%c",&f,&c);
        int x = (int)f;
        aparitii[abs(x%10)]++;
    }while(c!='*');

    int valmax=aparitii[0];
    int pozmax=0;
    for (int i=1; i<=9; i++)
        if (aparitii[i]>=valmax)
        {
            valmax=aparitii[i];
            pozmax=i;
        }
    printf("Cifra %d apare in %d numere",pozmax,valmax);
    return 0;
}

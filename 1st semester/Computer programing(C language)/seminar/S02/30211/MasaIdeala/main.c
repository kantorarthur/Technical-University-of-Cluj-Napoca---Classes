// L3Pb13
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int inaltime, varsta;
    char sex;
    float masa;
    printf("Inaltime=");
    scanf("%d", &inaltime);
    printf("Varsta=");
    scanf("%d", &varsta);
    printf("Sex=");
    scanf("%*c%c", &sex);
    //scanf(" %c", &sex);
    if(sex!='M' && sex!='F')
    {
        printf("Sex necunoscut!");
    }
    else
    {
        masa=50 + 0.75*(inaltime-150) + ((float)(varsta-20))/4;
        if(sex=='F')
            masa-=10;
        printf("Masa ideala este %.2f kg", masa);
    }

    return 0;
}

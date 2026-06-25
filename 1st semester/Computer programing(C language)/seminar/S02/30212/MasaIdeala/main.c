//L3Pb13
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int varsta, inaltime;
    char sex;

    printf("inaltime= ");
    scanf("%d",&inaltime);
    printf("varsta= ");
    scanf("%d",&varsta);
    printf("sex= ");
    scanf(" %c",&sex);
    if(sex=='M' || sex=='F')
    {
        float masa;
        masa=50 + 0.75*(inaltime-150) + (varsta-20)/4.0;
        if(sex=='F')
            masa-=10;
        printf("Masa ideala este %.2f kg",masa);
    }
    else
        printf("Sex necunoscut!");
    return 0;
}

#include "fractii.h"
#include <stdio.h>
void citeste(int *numarator, int *numitor)
{
    printf("Introduceti o fractie numarator/numitor : ");
    scanf("%d / %d",numarator, numitor );
}
void afiseaza(int numarator, int numitor)
{
    printf("%d/%d", numarator,numitor);
}
void suma(int numarator1, int numitor1,int numarator2, int numitor2, int* numarator_s, int*numitor_s)
{
    *numitor_s = (numitor1*numitor2);
    *numarator_s = (numarator1  * numitor2 + numarator2*numitor1);

}
void produs(int numarator1, int numitor1, int numarator2, int numitor2, int* numarator_p, int * numitor_p)
{
    *numarator_p = numarator1 * numarator2;
    *numitor_p = numitor1 * numitor2;
}


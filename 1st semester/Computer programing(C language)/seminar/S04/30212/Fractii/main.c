//L6Pb5
#include <stdio.h>
#include "fractii.h"

int main()
{
    int numarator1, numitor1, numarator2, numitor2;
    citeste(&numarator1, &numitor1);
    citeste(&numarator2, &numitor2);
    int numarator_s, numitor_s;
    int numarator_p, numitor_p;
    suma(numarator1,numitor1,numarator2,numitor2,&numarator_s,&numitor_s);
    printf("Suma este: ");
    afiseaza(numarator_s, numitor_s);

    produs(numarator1,numitor1,numarator2,numitor2,&numarator_p,&numitor_p);
    printf("\nProdusul este: ");
    afiseaza(numarator_p, numitor_p);
    return 0;
}

//L3Pb11
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a, b, c, d, n1, n2;
    double f1, f2;
    printf ("Introduceti doua fractii a/b c/d\n");
    n1=scanf ("%d/%d", &a, &b);
    n2=scanf ("%d/%d", &c, &d);
    if (n1==2 && n2==2)
    {
    f1=((double)a)/b;
    f2=(double)c/d;
    if (f1>f2)
        printf ("Fractia mai mare este %d/%d", a, b);
    else if (f1<f2)
        printf ("Fractia mai mare este %d/%d", c, d);
    else if (f1==f2)
        printf ("Fractiile sunt egale");
    else printf ("Nedeterminare!");
    }
    else printf ("Eroare!");

 // observatii
/*
    double x = 15.0/0;
    double y = -20.0/0;
    printf("\n%f", x*y);
    printf("\n%f", x+y);
    printf("\n%f", x/y);
    double z = 10/0;
    printf("Gata cu z=%f!",z);
*/
    return 0;
}

//L3Pb11
#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("Introduceti doua fractii de forma a/b c/d\n");
    int a,b,c,d;
    int narg;
    narg=scanf("%d/%d %d/%d", &a, &b, &c, &d);
    if(narg==4)
    {
        double f1, f2;
        f1=(double) a/b;
        f2=(double) c/d;
        if(f1>f2)
            printf("Fractia mai mare este %d/%d", a,b);
        else if(f1<f2)
            printf("Fractia mai mare este %d/%d", c,d);
        else if(f1==f2)
            printf("Fractiile sunt egale!");
        else
            printf("Nedeterminare!");
    }
    else printf("Eroare!");

    // observatii
 /*   double x = 15.0/0;
    double y = -20.0/0;
    printf("\n%f", x*y);
    printf("\n%f", x+y);
    printf("\n%f", x/y);
    double z = 10/0;
    printf("Gata cu z=%f!",z);
*/
    return 0;
}

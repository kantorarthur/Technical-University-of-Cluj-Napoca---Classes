#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int zi;
    int luna;
    int an;
}data_calendaristica;


int data(data_calendaristica *d)
{
    fflush(stdin);
    int narg=scanf("%d.%d.%d", &d->zi, &d->luna, &d->an);
    if (narg!=3)
        return 0;
    if (d->zi<1 || d->zi>31)
        return 0;
    if (d->luna<1 || d->luna>12)
        return 0;
    if (d->an<1900 || d->an>2100)
        return 0;

    return 1;

}


int main()
{
    data_calendaristica x,y;
    int v1 = data(&x);
    int v2 = data(&y);
    if ( v1 && v2)
    {
        if (x.an<y.an || (x.an==y.an && x.luna<y.luna) || (x.an==y.an && x.luna==y.luna &&x.zi<y.zi))
            printf("%02d.%02d.%d este calendaristic prima", x.zi,x.luna,x.an);
        else
            printf("%02d.%02d.%d este calendaristic prima", y.zi,y.luna,y.an);
    }else
        printf("Date invalide!");

    return 0;
}

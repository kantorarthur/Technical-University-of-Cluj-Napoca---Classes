#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct
{
    char nume[3];
    int nr;
} judet;

void citeste_proceseaza(char* numefis, judet *t, int* nt)
{
    FILE *pf = fopen(numefis,"r");
    if (!pf)
    {
        printf("Eroare!");
        exit(1);
    }

    *nt=0;
    char numarimatriculare[8];
    while (fscanf(pf,"%s",numarimatriculare)==1)
    {
        char numejudet[3];
        int index=0;
        int i=0;
        while(numarimatriculare[i]>='A' && numarimatriculare[i]<='Z')
            numejudet[index++]=numarimatriculare[i++];
        numejudet[index]='\0';

        int gasit=0;
        for (int i=0; i<*nt; i++)
            if (strcmp(t[i].nume, numejudet)==0)
            {
                t[i].nr++;
                gasit=1;
                break;
            }

        if (!gasit)
        {
            strcpy(t[*nt].nume, numejudet);
            t[*nt].nr=1;
            (*nt)++;
        }
    }
    fclose(pf);
}

int main(int argc, char* argv[])
{
    if (argc==1)
    {
        printf("Eroare!");
        exit(1);
    }

    judet t[50];
    int nt;
    citeste_proceseaza("numere.txt", t, &nt);
    int maxnr=t[0].nr;
    for (int i=1; i<nt; i++)
        if (t[i].nr>maxnr)
            maxnr=t[i].nr;

    FILE *pfout = fopen(argv[1],"w");
    if (!pfout)
    {
        printf("Eroare!");
        exit(1);
    }

    fprintf(pfout,"Judetul/Judetele cu cele mai multe autoturisme: ");
    for (int i=0; i<nt; i++)
        if (t[i].nr==maxnr)
            fprintf(pfout,"%s ",t[i].nume);

    fclose(pfout);
    return 0;
}

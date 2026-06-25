#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

typedef struct {
    char nume[21];
    int cantitate;
}fruct;

fruct decodifica(char* cuv)
{
    fruct x;
    x.cantitate=0;
    strcpy(x.nume,"");
    for (int i=0; i<strlen(cuv); i++)
    {
        if (isdigit(cuv[i]))
        {
            x.cantitate =  x.cantitate*10 + cuv[i] - '0';
        }
        else
        {
            char scuv[2];
            scuv[0]=cuv[i];
            scuv[1]='\0';
            strcat(x.nume, scuv);
        }
    }
    return x;
}

void citeste_actualizeaza_inventar(char *numefis, fruct ** t, int* nr)
{
    FILE *pf = fopen(numefis,"r");
    if (!pf)
    {
        printf("Eroare citire date!");
        exit(1);
    }

    char cuv[26];
    *nr=0;
    while (fscanf(pf,"%s",cuv)==1)
    {
        fruct f = decodifica(cuv);
        int apare=0;
        for (int i=0; i<*nr; i++)
            if (strcmp((*t)[i].nume, f.nume)==0)
            {
                apare=1;
                (*t)[i].cantitate += f.cantitate;
                break;
            }
        if (!apare)
        {
            *t = realloc(*t, sizeof(fruct)* ((*nr)+1));
            (*t)[*nr] = f;
            (*nr)++;
        }
    }

    fclose(pf);
}

void scrie_inventar_text(char *numefis,fruct *inventar, int n)
{
    FILE *pf = fopen(numefis,"w");
    if (!pf)
    {
        printf("Eroare scriere date in mod text!");
        return;
    }
    for (int i=0; i<n; i++)
        fprintf(pf,"%s %d\n", inventar[i].nume, inventar[i].cantitate);

    fclose(pf);
}

void scrie_inventar_binar(char *numefis,fruct *inventar, int n)
{
    FILE *pf = fopen(numefis,"wb");
    if (!pf)
    {
        printf("Eroare scriere date in mod binar!");
        return;
    }

    fwrite(inventar,sizeof(fruct),n,pf);

    fclose(pf);
}

int main()
{
    fruct *inventar=NULL;
    int n;

    citeste_actualizeaza_inventar("fructe.txt", &inventar, &n);
    scrie_inventar_text("inventar.txt",inventar,n);
    scrie_inventar_binar("inventar.bin",inventar,n);

    free(inventar);

    return 0;
}

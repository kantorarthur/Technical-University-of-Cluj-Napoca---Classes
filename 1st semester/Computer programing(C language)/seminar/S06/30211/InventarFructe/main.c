#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct {
    char nume[21];
    int cantitate;
}fruct;

fruct decodifica(char *s)
{
    fruct rez;
    rez.cantitate=0;
    int index=0;
    for (int i=0; i<strlen(s); i++)
    {
        if (s[i]>='0' && s[i]<='9')
            rez.cantitate = rez.cantitate*10 + s[i]-'0';
        else
            rez.nume[index++] = s[i];
    }
    rez.nume[index]='\0';   // 0

    return rez;
}

void inventar(char* numefis, fruct* a, int* nr)
{
    FILE *pf = fopen(numefis, "r");
    if (pf==NULL)
    {
        printf("Nu s-au putut citi datele!");
        exit(1);
    }

    char cuvant[25];
    *nr=0;
    while (fscanf(pf,"%s",cuvant)==1)
    {
        fruct f = decodifica(cuvant);
        int gasit=0;
        for (int i=0; i<*nr; i++)
            if (strcmp(a[i].nume,f.nume)==0)
            {
                gasit=1;
                a[i].cantitate += f.cantitate;
                break;
            }
        if (!gasit)
        {
            a[*nr]=f;
            (*nr)++;
        }
    }

    fclose(pf);
}

void scrie_text(fruct* t, int n, char* numefis)
{
    FILE *pf = fopen(numefis, "w");
    if (pf==NULL)
    {
        printf("Nu se poate scrie in fisierul text!");
        return;
    }

    for (int i=0; i<n; i++)
        fprintf(pf,"%s %d\n", t[i].nume, t[i].cantitate);

    fclose(pf);
}

void scrie_binar(fruct* t, int n, char* numefis)
{
    FILE *pf = fopen(numefis, "wb");
    if (pf==NULL)
    {
        printf("Nu se poate scrie in fisierul binar!");
        return;
    }

    fwrite(t,sizeof(fruct),n,pf);

    fclose(pf);
}

int main()
{
    fruct t[100];
    int n;
    inventar("fructe.txt", t, &n);
    scrie_text(t,n,"inventar.txt");
    scrie_binar(t,n,"inventar.bin");
    return 0;
}

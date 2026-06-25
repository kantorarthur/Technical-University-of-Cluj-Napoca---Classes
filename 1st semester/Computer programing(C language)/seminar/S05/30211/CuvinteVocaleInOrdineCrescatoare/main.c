// cuvintele frazei care au vocalele in ordine crescatoare
// presupunem ca exista numai litere mici in fraza!
#include <stdio.h>
#include <string.h>

int vocale_crescatoare(char* cuvant)
{
    char vocAnt=0;
    for (int i=0; i<strlen(cuvant); i++)
    {
        if (strchr("aeiou",cuvant[i])!=NULL)
        {
            if (cuvant[i]<vocAnt)
                return 0;
            vocAnt=cuvant[i];
        }
    }
    return 1;
}

int main()
{
    //vaporul este pe marea albastra
    char s[100];
    gets(s);
    char *p=strtok(s," ");
    while (p!=NULL)
    {
        if (vocale_crescatoare(p))
            puts(p);

        p=strtok(NULL," ");
    }
    return 0;
}

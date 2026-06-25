#include <stdio.h>
#include <stdlib.h>
int comparare(const void *a, const void *b)
{
    int *aa = (int*)a;
    int *bb = (int*)b;
    return *aa - *bb;
}

void verifica_permutari(char* nfin, int* targ, int narg, char *nfout)
{
    FILE *pfIn = fopen(nfin, "r");
    if (pfIn==NULL)
    {
        printf("Nu se poate citi din fisierul text!");
        exit(1);
    }
    FILE *pfOut = fopen(nfout, "w");
    if (pfOut==NULL)
    {
        printf("Nu se poate scrie in fisierul text!");
        exit(2);
    }

    qsort(targ,narg,sizeof(int),comparare);

    int *t = (int*)malloc(5000000*sizeof(int));

    while (!feof(pfIn))
    {
        int n=0;
        char c='.';
        do {
            fscanf(pfIn,"%d%c",t+n, &c);
            n++;
        }while (c!='.');

        if (!feof(pfIn))
        {
            if (n!=narg)
                fprintf(pfOut,"NU\n");
            else
            {
                qsort(t,n,sizeof(int),comparare);
                if (memcmp(targ,t,n*sizeof(int))==0)
                    fprintf(pfOut,"DA\n");
                else
                    fprintf(pfOut,"NU\n");
            }
        }
    }

    free(t);
    fclose(pfIn);
    fclose(pfOut);

}

int main(int argc, char* argv[])
{
/*
    printf("%d\n", argc);
    for (int i=0; i<argc; i++)
        puts(argv[i]);
*/
    int narg=argc-1;
    int targ[1000];
    for (int i=0; i<narg; i++)
        sscanf(argv[i+1],"%d",targ+i);

    verifica_permutari("numere.txt",targ,narg,"permutari.txt");

    return 0;
}

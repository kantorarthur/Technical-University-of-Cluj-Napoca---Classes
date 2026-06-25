#include <stdio.h>
#include <stdlib.h>
#define NR_note 3

typedef struct{
    char nume[30];
    char prenume[30];
    int varsta;
    int note[NR_note];
}stud;

void citesc(stud *d,int n,char *nume_fis)
{
    FILE *cit=fopen(nume_fis,"r");
    for(int i=0;i<n;i++)
    {
        printf("\nElevul %d are urmatoarele date:\n",i+1);
        printf("Nume:\n");
        fscanf(cit,"%s",d[i].nume);
        printf("Prenume:\n");
        fscanf(cit,"%s",d[i].prenume);
        printf("Varsta:\n");
        fscanf(cit,"%d",&d[i].varsta);
        printf("%d note:\n",NR_note);
        for(int j=0;j<NR_note;j++)
        {
            fscanf(cit,"%d",&d[i].note[j]);
        }
    }
    fclose(cit);
}
void afisez(stud *d,int n)
{
    for(int i=0;i<n;i++)
    {
        printf("Studentul %d are urmatoarele date:\n",i+1);
        printf("%s ",d[i].nume);
        printf("%s ",d[i].prenume);
        printf("%d ",d[i].varsta);
        printf("\n cu notele:");
        for(int j=0;j<NR_note;j++)
        {
            printf("%d ",d[i].note[j]);
        }
    }
}
void medie(stud *d,int n)
{
    int *medie=(int *)calloc(n,sizeof(int));
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<NR_note;j++)
        {
            medie[i]=medie[i]+d[i].note[j];
        }
        medie[i]=medie[i]/NR_note;
    }
    for(int i=0;i<n;i++)
    {
        printf("\nStudentul %s %s are media %d",d[i].nume,d[i].prenume,medie[i]);
    }
}
void incr(stud *d,int n)
{
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<NR_note;j++)
        {
            d[i].note[j]++;
        }
    }
    for(int i=0;i<n;i++)
    {
        printf("\n Studentul %s %s are notele:",d[i].nume,d[i].prenume);
        for(int j=0;j<NR_note;j++)
        {
            printf("%d ",d[i].note[j]);
        }
    }
}





int main()
{
    int n;
    char g[]="citire.txt";
    FILE *cit=fopen(g,"r");
    fscanf(cit,"%d",&n);
    stud *d=(stud *)calloc(n,sizeof(stud));
    citesc(d,n,g);
    afisez(d,n);
    medie(d,n);
    incr(d,n);
    free(d);
    fclose(cit);
    return 0;


}

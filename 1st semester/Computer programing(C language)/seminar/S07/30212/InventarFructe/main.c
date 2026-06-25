#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
typedef struct {
    char nume[21];
    int cantitate;
}fruct;
fruct decodifica(char *s)
{
    fruct f;
    f.cantitate=0;
    for(int i=0;s[i];i++)
        if(isdigit(s[i]))
        {
            f.cantitate=f.cantitate*10+(s[i]-'0');
            strcpy(s+i,s+i+1);
            i--;
        }
    strcpy(f.nume,s);
    return f;
}
void calculeaza_inventar(char *nume,fruct *t,int *n)
{
    FILE *pf=fopen(nume,"r");
    if(pf==NULL)
    {
        printf("eroare la citirea datelor");
        exit(1);
    }
    char s[101];
    *n=0;
    while(fscanf(pf,"%s",s)==1)
    {
        fruct f=decodifica(s);
        int gasit=0;
        for(int i=0;i<*n;i++)
            if(strcmp(f.nume,t[i].nume)==0)
            {
                gasit=1;
                t[i].cantitate+=f.cantitate;
                break;
            }
        if(gasit==0)
        {
            t[*n]=f;
            (*n)++;
        }
    }
    fclose(pf);
}
void scrie_text(char *nume,fruct *t,int n)
{
    FILE *pf=fopen(nume,"w");
    if(pf==NULL)
    {
        printf("eroare la scrierea datelor text");
        exit(1);
    }
    for(int i=0;i<n;i++)
    {
        fprintf(pf,"%s %d\n",t[i].nume,t[i].cantitate);
    }
    fclose(pf);
}
void scrie_binar(char *nume,fruct *t,int n)
{
    FILE *pf=fopen(nume,"wb");
    if(pf==NULL)
    {
        printf("eroare la scrierea datelor binar");
        exit(1);
    }
    fwrite(t,sizeof(fruct),n,pf);
    fclose(pf);
}
int main()
{
    fruct t[100];
    int n;
    calculeaza_inventar("fructe.txt", t, &n);
    scrie_text("inventar.txt",t,n);
    scrie_binar("inventar.bin",t,n);

    return 0;
}

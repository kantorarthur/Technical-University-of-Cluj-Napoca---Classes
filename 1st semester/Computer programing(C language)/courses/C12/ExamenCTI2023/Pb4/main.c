#include <stdio.h>
#include <stdlib.h>

char ** aloca(int m, int n)
{
    char ** mat = (char**)malloc(m*sizeof(char*));
    for (int i=0; i<m; i++)
        mat[i] = (char*)malloc(n*sizeof(char));
    return mat;
}

int potriviri(char **sablon,int rs,int cs,char** harta,int rh,int ch)
{
    int nr=0;
    for (int i=0; i<=rh-rs; i++)
        for (int j=0; j<=ch-cs; j++)
        {
            int potriveste=1;
            for (int k=0; k<rs; k++)
                for (int p=0; p<cs; p++)
                    if (sablon[k][p]!='.' && sablon[k][p]!=harta[i+k][j+p])
                    {
                        potriveste=0;
                        k=rs;
                        p=cs;
                    }
            nr+=potriveste;
        }
    return nr;
}

int main(int argc, char* argv[])
{
    FILE *pf = fopen(argv[1],"r");
    if (pf ==NULL)
    {
        printf("Eroare la fisierul de intrare!");
        exit(1);
    }

    int rh,ch,rs,cs;
    fscanf(pf,"%d %d%*c",&rh,&ch);
    char ** harta = aloca(rh,ch);
    for (int i=0; i<rh; i++)
    {
        for (int j=0; j<ch; j++)
            harta[i][j]=fgetc(pf);
        fgetc(pf);
    }

    fscanf(pf,"%d %d%*c",&rs,&cs);
    char ** sablon = aloca(rs,cs);
    for (int i=0; i<rs; i++)
    {
        for (int j=0; j<cs; j++)
            sablon[i][j]=fgetc(pf);
        fgetc(pf);
    }
    fclose(pf);

    int nr = potriviri(sablon,rs,cs,harta,rh,ch);

    pf = fopen("out.bin","wb");
    if (pf ==NULL)
    {
        printf("Eroare la fisierul de iesire!");
        exit(2);
    }
    fwrite(&nr,sizeof(int),1,pf);
    fclose(pf);

    return 0;
}

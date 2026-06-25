#include <stdio.h>
#include <stdlib.h>

typedef struct node_type
{
    int id;
    struct node_type *left,*right;

}NodeT;

NodeT *creareArborBinarFisier(FILE *scrie)
{
    NodeT *p;
    int c;
    fscanf(scrie,"%d",&c);
    if(c==0)
        return NULL; //inseamna ca e arbore vid
    else
    {
        p=(NodeT*)malloc(sizeof(NodeT));
        if(p==NULL)
        {
            puts("Nu mai avem memorie in creareArbore");
            exit(1);
        }
        p->id=c;
        p->left=creareArborBinarFisier(scrie);
        p->right=creareArborBinarFisier(scrie);
    }
    return p;
}

void preordine(NodeT *radacina,FILE *afiseaza)
{
    if(radacina!=NULL)
    {
        fprintf(afiseaza,"%d ",radacina->id);
        preordine(radacina->left,afiseaza);
        preordine(radacina->right,afiseaza);
    }
}
void inordine(NodeT *radacina,FILE *afiseaza)
{
    if(radacina!=NULL)
    {
        inordine(radacina->left,afiseaza);
        fprintf(afiseaza,"%d ",radacina->id);
        inordine(radacina->right,afiseaza);
    }
}

void postordine(NodeT *radacina,FILE *afiseaza)
{
    if(radacina!=NULL)
    {
        postordine(radacina->left,afiseaza);
        postordine(radacina->right,afiseaza);
        fprintf(afiseaza,"%d" ,radacina->id);
    }
}
void deletePostOrdine(NodeT *radacina)
{
    if(radacina!=NULL)
    {
        deletePostOrdine(radacina->left);
        deletePostOrdine(radacina->right);
        free(radacina);
    }
}

int nr_frunze(NodeT *radacina,FILE *afiseaza)
{
    if(radacina==NULL)
        return 0;
    else
    {
        if(radacina->left==NULL && radacina->right==NULL)
        {
            fprintf(afiseaza,"\n%d este frunza",radacina->id);
            return 1;
        }
        else
         {
             return nr_frunze(radacina->left,afiseaza)+nr_frunze(radacina->right,afiseaza);
         }
    }
}

int noduriInterne(NodeT *radacina,FILE *afiseaza)
{
    if(radacina==NULL)
        return 0;
    else
    {
        if(radacina->left!=NULL || radacina->right!=NULL)
        {
            fprintf(afiseaza,"\n%d este nod intern",radacina->id);
            return 1+noduriInterne(radacina->left,afiseaza)+noduriInterne(radacina->right,afiseaza);
        }
        else
        {
            return noduriInterne(radacina->left,afiseaza)+noduriInterne(radacina->right,afiseaza);
        }
    }
}
int max(int a,int b)
{
    if(a>b)
        return a;
    else
        return b;
}

int inaltimeNod(NodeT *radacina)
{
    if(radacina==NULL)
        return -1;
    else
    {
        return 1+max(inaltimeNod(radacina->left),inaltimeNod(radacina->right));
    }
}

NodeT *search(NodeT *radacina,int key)
{
    if(radacina==NULL)
        return NULL;
    else
    {
        if(radacina->id==key)
            return radacina;
        else{
        search(radacina->left,key);
        search(radacina->right,key);}
    }
}

int main()
{
    NodeT *radacina;
    FILE *scrie=fopen("arborebinarIN.txt","r");
    FILE *afiseaza=fopen("arborebinarOUT.txt","w");
    radacina=creareArborBinarFisier(scrie);
    inordine(radacina,afiseaza);
    fprintf(afiseaza,"\nNr de frunze este:%d",nr_frunze(radacina,afiseaza));
    fprintf(afiseaza,"\nNr de noduri interne sunt:%d",noduriInterne(radacina,afiseaza));
    fprintf(afiseaza,"\ninaltimea este:%d",inaltimeNod(radacina));
    deletePostOrdine(radacina);
    radacina=NULL;
    fclose(scrie);
    fclose(afiseaza);
    return 0;

}

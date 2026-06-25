#include <stdio.h>
#include <stdlib.h>
typedef struct cell
{
    int key;
    struct cell *next;
    int dup;
} Cell;

int hashing(int m,int key)
{
    return key%m;
}

void into(Cell **v,int m,int key)
{
    int index=hashing(m,key);
    Cell *p=v[index];
    while(p!=NULL)
    {
        if(p->key==key)
        {
            p->dup++;
            break;
        }
        p=p->next;
    }
    Cell *d=(Cell *)malloc(sizeof(Cell));
    d->key=key;
    d->dup=1;
    d->next=v[index];
    v[index]=d;
}

int dupl(Cell **v,int m)
{
    int cnt=0;
    for(int i=0; i<m; i++)
    {
        Cell *p=v[i];
        while(p!=NULL)
            {
                if(p->dup>1)
                    cnt++;
                p=p->next;
            }
    }
    return cnt;
}

void afisare(Cell **v,int m)
{
    for(int i=0; i<m; i++)
    {
        Cell *p=v[i];
        if(p!=NULL)
        {
            printf("La pozitia %d se afla urmatoarele valori:",i);
            while(p!=NULL)
            {
                printf("%d ",p->key);
                p=p->next;
            }
            printf("\n");
        }
    }
}

int main()
{
    int m;
    scanf("%d",&m);
    Cell **v=(Cell **)calloc(m,sizeof(Cell*));
    into(v,m,5);
    into(v,m,5);
    into(v,m,5);
    into(v,m,25);
    into(v,m,5);
    into(v,m,35);
    into(v,m,35);
    into(v,m,25);
    afisare(v,m);
    printf("\nExista atatea duplicate:%d",dupl(v,m));
    return 0;
}

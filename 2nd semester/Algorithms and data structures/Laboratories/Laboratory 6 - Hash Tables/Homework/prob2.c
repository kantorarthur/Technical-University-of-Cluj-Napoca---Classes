#include <stdio.h>
#include <stdlib.h>

typedef struct cell
{
    int key;
    int status;
}Cell;

enum{liber,ocupat};

void init_liber(Cell *v,int m)
{
    for(int i=0;i<m;i++)
        v[i].status=liber;
}

int hashing_liniar(int key,int i,int m)
{
    return (key%m+i)%m;
}

void insert_liniar(int key,int m,Cell *v)
{
    for(int i=0;i<m;i++)
    {
        int index=hashing_liniar(key,i,m);
        if(v[index].status==liber)
        {
            v[index].key=key;
            v[index].status=ocupat;
            break;
        }
    }
}

void afisare(int m,Cell *v)
{
    for(int i=0;i<m;i++)
    {
        if(v[i].status==ocupat)
        {
            printf("Pe pozitia %d se afla valoarea %d",i,v[i].key);
            printf("\n");
        }
    }
}

int main()
{
    int m=11;
    Cell *v=(Cell *)calloc(m,sizeof(Cell));
    init_liber(v,m);
    insert_liniar(124,m,v);
    insert_liniar(58,m,v);
    insert_liniar(32,m,v);
    insert_liniar(15,m,v);
    insert_liniar(25,m,v);
    afisare(m,v);
    return 0;

    //valoarea factorului de umplere este 7/11
    //pt search de 56 i o sa fie 0 iar 56 pe poz 1, pt search de 100 i o sa fie 1 fiindca
    //o sa fie coliziune si dupa o sa fie 100 pe poz 2 iar pt search de 19 o sa fie i 0 si 19
    //pe poz 8

}

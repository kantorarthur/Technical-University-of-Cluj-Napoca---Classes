#include <stdio.h>
#include <stdlib.h>
typedef struct cell
{
    int key;
    int status;
}Cell;
enum{liber,ocupat};

int hashing_quadratic(int m,int i,int key)
{
    return (key%m+2*i+i*i)%m; // aici i-ul va avea rolul de for care va cauta index-urile apropiat libere in cazul
                              // in care index-ul in care am vrea sa introducem valoarea prima data este ocupat
}

void initLiber(int m, Cell *v)
{
    for(int i=0;i<m;i++)
        v[i].status=liber;
}

void insert_quadratic(Cell *v,int key,int m)
{

        for(int i=0;i<m;i++)
        {
            int index=hashing_quadratic(m,i,key);
            if(v[index].status==liber)
            {
                v[index].key=key;
                v[index].status=ocupat;
                break;
            }
        }
}

void afisare(Cell *v,int m)
{
    for(int i=0;i<m;i++)
    {
        if(v[i].status==ocupat)
        {
            printf("Pe pozitia %d se afla urmatoarea valoare: %d",i,v[i].key);
            printf("\n");
        }
    }
}





int main()
{
    int m=13;
    Cell *v=(Cell *)calloc(m,sizeof(Cell));
    initLiber(m,v);
    insert_quadratic(v,12,m);
    insert_quadratic(v,4,m);
    insert_quadratic(v,8,m);
    insert_quadratic(v,38,m);
    insert_quadratic(v,30,m);
    insert_quadratic(v,56,m);
    insert_quadratic(v,64,m);
    insert_quadratic(v,21,m);
    afisare(v,m);
    return 0;
    //pt Hash-Search de 64 cu functia de hashing de sus se acceseaza doar o celula fiindca nu sunt coliziuni
    //si o sa fie pe pozitia 12
    //pt hash-search de 77 o sa se acceseze doua celule, fiindca prima data o sa fie coliziune cu pozitia 12, dupa
    //creste i si ajunge pe pozitia 2
    //pt hash-search de 69 o sa se acceseze doar o celula fiindca nu o sa fie coliziuni, aflandu-se pe poz 4
    //valoarea factorului de umplere este 8/13

}

#include <stdio.h>
#include <stdlib.h>
typedef struct cell
{
    int key;
    int status;
} Cell;

enum{liber,ocupat};

void init_liber(Cell *hash,int m)
{
    for(int i=0;i<m;i++)
        hash[i].status=liber;
}

int hashing(int key,int m)
{
    return key%m;
}

int hashing2(int key,int m)
{
    return key%(2*m);
}

void in_key(int key,Cell *hash,int m)
{
    int index=hashing(key,m);
    if(hash[index].status==liber)
    {
        hash[index].key=key;
        hash[index].status=ocupat;
    }
}

int linear_probing(Cell *hash,int key,int m)
{
    int index=hashing(key,m);
    if(hash[index].status==liber)
    {
        hash[index].key=key;
        hash[index].status=ocupat;
    }
    else
    {
        for(int i=0;i<m;i++)
        {
            int index2=(index+i)%m;
            if(hash[index2].status==liber)
            {
                hash[index2].key=key;
                hash[index2].status=ocupat;
                break;
            }
        }
    }
    return 0;
}

int quadratic_probing(Cell *hash,int key,int m)
{
    int index=hashing(key,m);
    if(hash[index].status==liber)
    {
        hash[index].key=key;
        hash[index].status=ocupat;
    }
    else
    {
        for(int i=0;i<m;i++)
        {
            int index2=(index+2*i+3*i*i)%m;
            if(hash[index2].status==liber)
            {
                hash[index2].key=key;
                hash[index2].status=ocupat;
                break;
            }
        }
    }
    return 0;
}
void afisare(Cell *hash,int m)
{
    for(int i=0;i<m;i++)
    {
        if(hash[i].status==liber)
            printf("Pozitia %d nu este ocupata\n",i);
        else
        printf("Pozitia %d este ocupata, valoarea care o ocupa este %d\n",i,hash[i].key);
    }
}

int search_linear(Cell *hash,int m,int key)
{
    int index=hashing(key,m);
    for(int i=0;i<m;i++) //cazul de linear probing
    {
        int index2=(i+index)%m;
        if(hash[index2].key==key)
            return index2;
    }
    return -1;
}

int search_quadratic(Cell *hash,int m,int key)
{
    int index=hashing(key,m);
    for(int i=0;i<m;i++)
    {
        int index2=(index+2*i+3*i*i)%m;
        if(hash[index2].key==key)
            return index2;
    }
    return -1;
}

int search_double_hashing(Cell *hash,int m,int key)
{
    int index=hashing(key,m);
    for(int i=0;i<m;i++)
    {
        int index2=(index+i*hashing2(key,m))%m;
        if(hash[index2].key==key)
            return index2;
    }
    return -1;
}

void del_key(Cell *hash,int m,int key)
{
    int index=hashing(key,m);
    if(hash[index].status==ocupat)
        hash[index].status=liber;
}
int main()
{
    int m=5;
    Cell *hash=(Cell *)calloc(m,sizeof(Cell));
    init_liber(hash,m);
    in_key(4,hash,m);
    afisare(hash,m);
    quadratic_probing(hash,1,m);
    printf("\n");
    afisare(hash,m);
    del_key(hash,m,1);
    afisare(hash,m);
    return 0;

}

#include <stdio.h>
#include <stdlib.h>

int identice(int x)
{
    if (x<10)
        return -1;
    if (x<100)
        return (x%10)==(x/10);
    int ultima=x%10;
    int penultima=(x/10)%10;
    if (ultima!=penultima)
        return 0;
    return identice(x/10);
}

int main()
{
    printf("%d\n",identice(8888888));  //1
    printf("%d\n",identice(99)); //1
    printf("%d\n",identice(88878888)); //0
    printf("%d\n",identice(8)); // -1
    printf("%d\n",identice(-10)); //-1
    return 0;
}

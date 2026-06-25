#include <stdio.h>
#include <string.h>

int turn(char *s, int h)
{
    if (h==1)
    {
        if (strlen(s)==1)
            return 1;
        return 0;
    }

    int ls = strlen(s);
    if (ls<h)
        return 0;

    char c = s[ls-1];
    for (int i=0; i<h-1; i++)
    {
        if (c!=s[ls-2-i])
            return 0;
    }

    s[ls-h]='\0';
    return turn(s,h-1);
}

int main()
{
    char s[100]="EXXAAAMMMM";
    printf("%d",turn(s,4));
    return 0;
}

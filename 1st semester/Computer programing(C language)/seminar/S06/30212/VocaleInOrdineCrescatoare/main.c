#include <stdio.h>
#include <stdlib.h>
int verificare_voc_cresc(char *p)
{
    int voc_ant=0;
    for(int i=0; i<strlen(p); i++)
    {
        if(strchr("aeiou",p[i]))
        {
            if(p[i]<voc_ant)
                return 0;
            voc_ant=p[i];
        }
    }
    return 1;
}
int main()
{
    //vaporul,,.. este pe... marea, albastra!!!

    char s[100];
    gets(s);
    char *p=strtok(s," ,.!");
    while(p)
    {
        if(verificare_voc_cresc(p))
            puts(p);
        p=strtok(NULL," ,.!");
    }

    return 0;
}

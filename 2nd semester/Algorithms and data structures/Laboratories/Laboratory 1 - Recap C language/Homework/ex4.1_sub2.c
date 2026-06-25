#include <stdio.h>
#include <stdlib.h>

int main()
{
    int capacity;
    scanf("%d",&capacity);
    float *v=(float *)calloc(capacity,sizeof(float));
    int size;
    scanf("%d",&size);
    int cnt=0;
    while(cnt<capacity && cnt<size)
    {
        scanf("%f",&v[cnt]);
        for(int i=0;i<cnt;i++)
        {
            printf("%d ",v[cnt]);
        }
        printf("\n");
        cnt++;
    }

}

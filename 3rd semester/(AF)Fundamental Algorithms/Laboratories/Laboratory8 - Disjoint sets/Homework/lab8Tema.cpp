#include <iostream>
using namespace std;

#define MAXN 10000

int parent[MAXN];
int rankv[MAXN];

struct Edge
{
    int u, v, w;
};

void make_set(int x)
{
    parent[x] = x;
    rankv[x] = 0;
}

int find_set(int x)
{
    if (parent[x] != x)
    {
        parent[x] = find_set(parent[x]);
    }
    return parent[x];
}

void union_set(int x, int y)
{
    int rootX = find_set(x);
    int rootY = find_set(y);

    if (rootX != rootY)
    {
        if (rankv[rootX] < rankv[rootY])
        {
            parent[rootX] = rootY;
        }
        else if (rankv[rootX] > rankv[rootY])
        {
            parent[rootY] = rootX;
        }
        else
        {
            parent[rootY] = rootX;
            rankv[rootX]++;
        }
    }
}

void sortEdges(Edge edges[], int m)
{
    for (int i = 0; i < m - 1; i++)
    {
        for (int j = 0; j < m - i - 1; j++)
        {
            if (edges[j].w > edges[j + 1].w)
            {
                Edge tmp = edges[j];
                edges[j] = edges[j + 1];
                edges[j + 1] = tmp;
            }
        }
    }
}

int kruskal(int n, Edge edges[], int m)
{
    for (int i = 0; i < n; i++)
    {
        make_set(i);
    }

    sortEdges(edges, m);

    printf("\nMuchiile din MST sunt : \n");

    int totalCost = 0;
    int edgesUsed = 0;

    for (int i = 0; i < m && edgesUsed < n - 1; i++)
    {
        int u = edges[i].u;
        int v = edges[i].v;
        int w = edges[i].w;

        if (find_set(u) != find_set(v))
        {
            printf("%d, %d, %d", u, v, w);
            union_set(u, v);
            totalCost += w;
            edgesUsed++;
        }
    }

    return totalCost;
}

void demo()
{
    int n = 10;
    for (int i = 0; i < n; i++)
    {
        make_set(i);
    }

    for (int i = 0; i < n; i++)
    {
        printf("Element: %d, radacina %d\n", i, find_set(i));
        
    }
    union_set(0, 1);
    union_set(2, 3);
    union_set(4, 5);
    union_set(1, 2);
    union_set(7, 8);
    printf("Dupa union:\n");

    for (int i = 0; i < n; i++)
    {
        printf("Element: %d, radacina %d\n", i, find_set(i));
    }

    printf("%d ", find_set(0));
    printf("%d ", find_set(2));
    printf("%d ", find_set(9));
    printf("%d ", find_set(3));
    printf("%d ", find_set(5));
}

void demoKrusk()
{
    int n = 5;
    int m = 9;

    Edge edges[MAXN] = 
    {
        {0, 1, 2},
        {0, 2, 3},
        {0, 3, 1},
        {0, 4, 4},
        {1, 2, 4},
        {1, 3, 2},
        {1, 4, 3},
        {2, 3, 4},
        {3, 4, 2}
    };

    printf("\nToate muchiile grafului:\n");
    for (int i = 0; i < m; i++)
    {
       printf("\n%d %d %d", edges[i].u, edges[i].v, edges[i].w);
    }

    int totalCost = kruskal(n, edges, m);
    printf("\nCostul minim posibil pentru conectarea tuturor nodurilor este: %d",totalCost);
}


int main()
{
    demo();
    demoKrusk();
    return 0;
}
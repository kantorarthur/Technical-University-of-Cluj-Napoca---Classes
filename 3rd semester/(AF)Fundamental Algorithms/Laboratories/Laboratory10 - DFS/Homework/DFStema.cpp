#include <cstdio>
#include <vector>
#include <stack>
#include "Profiler.h"

Profiler d("Tema");

using namespace std;

const int N = 5;

void afisareGraf(vector<int> adj[])
{
    printf("graful : \n");
    for (int i = 1; i <= N; i++)
    {
        printf("%d: ", i);
        for (int j = 0; j < adj[i].size(); j++)
            printf("%d ", adj[i][j]);
        printf("\n");
    }
    printf("\n");
}

void DFS(int u, const vector<int> adj[], vector<bool>& viz, vector<pair<int, int>>& arboreDFS, Operation &opTotal)
{
    opTotal.count();
    viz[u] = true;
    for (int i = 0; i < adj[u].size(); i++)
    {
        opTotal.count();
        int v = adj[u][i];
        opTotal.count();
        if (!viz[v])
        {
            arboreDFS.push_back({ u, v });
            DFS(v, adj, viz, arboreDFS,opTotal);
        }
    }
}

void DFS_Topo(int u, const vector<int> adj[], vector<bool>& viz, stack<int>& st)
{
    viz[u] = true;
    for (int i = 0; i < adj[u].size(); i++)
    {
        int v = adj[u][i];
        if (!viz[v])
            DFS_Topo(v, adj, viz, st);
    }
    st.push(u);
}

int disc[N + 1], low[N + 1], timp;
bool inStack[N + 1];
stack<int> stTarjan;

void TarjanDFS(int u, vector<int> adj[])
{
    disc[u] = low[u] = ++timp;
    stTarjan.push(u);
    inStack[u] = true;

    for (int i = 0; i < adj[u].size(); i++)
    {
        int v = adj[u][i];
        if (disc[v] == 0)
        {
            TarjanDFS(v, adj);
            if (low[v] < low[u])
                low[u] = low[v];
        }
        else if (inStack[v])
        {
            if (disc[v] < low[u])
                low[u] = disc[v];
        }
    }

    if (low[u] == disc[u])
    {
        while (true)
        {
            int x = stTarjan.top();
            stTarjan.pop();
            inStack[x] = false;
            printf("%d ", x);
            if (x == u)
                break;
        }
        printf("\n");
    }
}

void Tarjan(vector<int> adj[])
{
    timp = 0;
    for (int i = 1; i <= N; i++)
    {
        disc[i] = 0;
        low[i] = 0;
        inStack[i] = false;
    }

    for (int i = 1; i <= N; i++)
        if (disc[i] == 0)
            TarjanDFS(i, adj);
}

void demoDFSsiTopo()
{
    vector<int> adj[N + 1];

    adj[1].push_back(2);
    adj[2].push_back(3);
    adj[3].push_back(1);
    adj[3].push_back(4);
    adj[4].push_back(5);
    adj[5].push_back(4);

    afisareGraf(adj);

    vector<bool> viz(N + 1, false);
    vector<pair<int, int>> arboreDFS;

    Operation op = d.createOperation("test", N);

    DFS(1, adj, viz, arboreDFS,op);

    printf("arborele DFS:\n");
    for (int i = 0; i < arboreDFS.size(); i++)
        printf("%d - %d\n", arboreDFS[i].first, arboreDFS[i].second);
    printf("\n");

    for (int i = 1; i <= N; i++)
        viz[i] = false;

    stack<int> st;

    for (int i = 1; i <= N; i++)
        if (!viz[i])
            DFS_Topo(i, adj, viz, st);

    printf("sortare topologica:\n");
    while (!st.empty())
    {
        printf("%d ", st.top());
        st.pop();
    }
    printf("\n\n");

    printf("componente tare conexe:\n");
    Tarjan(adj);
}


void generateRandomGraph(int V, int E, vector<int> adj[])
{
    for (int i = 1; i <= V; i++)
        adj[i].clear();

    vector<vector<bool>> used(V + 1, vector<bool>(V + 1, false));

    int edges = 0;
    while (edges < E)
    {
        int u = rand() % V + 1;
        int v = rand() % V + 1;

        if (u != v && !used[u][v])
        {
            used[u][v] = true;
            adj[u].push_back(v);
            edges++;
        }
    }
}

void perf_DFS_E()
{
    const int V = 100;

    for (int E = 1000; E <= 4500; E += 100)
    {
        vector<int>* adj = new vector<int>[V + 1];
        vector<bool> viz(V + 1, false);
        vector<pair<int, int>> arboreDFS;

        generateRandomGraph(V, E, adj);

        Operation op = d.createOperation("DFS_E", E);

        for (int i = 1; i <= V; i++)
            if (!viz[i])
                DFS(i, adj, viz, arboreDFS, op);

        delete[] adj;
    }
    d.showReport();
}


void perf_DFS_V()
{
    const int E = 4500;

    for (int V = 100; V <= 200; V += 10)
    {
        vector<int>* adj = new vector<int>[V + 1];
        vector<bool> viz(V + 1, false);
        vector<pair<int, int>> arboreDFS;

        generateRandomGraph(V, E, adj);

        Operation op = d.createOperation("DFS_V", V);

        for (int i = 1; i <= V; i++)
            if (!viz[i])
                DFS(i, adj, viz, arboreDFS, op);

        delete[] adj;
    }
    d.showReport();
}




int main()
{
    demoDFSsiTopo();
    perf_DFS_V();
    perf_DFS_E();
    return 0;
}

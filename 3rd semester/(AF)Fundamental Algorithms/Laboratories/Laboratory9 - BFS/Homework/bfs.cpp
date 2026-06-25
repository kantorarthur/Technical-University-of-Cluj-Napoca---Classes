#include <stdlib.h>
#include <string.h>
#include "bfs.h"

int get_neighbors(const Grid *grid, Point p, Point neighb[])
{
    int cnt = 0;
    if (p.row - 1 >= 0 && grid->mat[p.row - 1][p.col] == 0)
    {
        neighb[cnt].row = p.row - 1; // deci acum spun ca vecinul pe care l am gasit se afla pe linia p.row-1 si linia de mai jos zic coloana
        neighb[cnt].col = p.col;
        cnt++;
    }

    if (p.col + 1 < grid->cols && grid->mat[p.row][p.col + 1] == 0)
    {
        neighb[cnt].col = p.col + 1;
        neighb[cnt].row = p.row;
        cnt++;
    }

    if (p.col - 1 >= 0 && grid->mat[p.row][p.col - 1] == 0)
    {
        neighb[cnt].col = p.col - 1;
        neighb[cnt].row = p.row;
        cnt++;
    }
    
    if (p.row + 1 < grid->rows && grid->mat[p.row + 1][p.col] == 0)
    {
        neighb[cnt].row = p.row + 1;
        neighb[cnt].col = p.col;
        cnt++;
    }
    return cnt;

}

void grid_to_graph(const Grid *grid, Graph *graph)
{
    //we need to keep the nodes in a matrix, so we can easily refer to a position in the grid
    Node *nodes[MAX_ROWS][MAX_COLS];
    int i, j, k;
    Point neighb[4];

    //compute how many nodes we have and allocate each node
    graph->nrNodes = 0;
    for(i=0; i<grid->rows; ++i){
        for(j=0; j<grid->cols; ++j){
            if(grid->mat[i][j] == 0){
                nodes[i][j] = (Node*)malloc(sizeof(Node));
                memset(nodes[i][j], 0, sizeof(Node)); //initialize all fields with 0/NULL
                nodes[i][j]->position.row = i;
                nodes[i][j]->position.col = j;
                ++graph->nrNodes;
            }else{
                nodes[i][j] = NULL;
            }
        }
    }
    graph->v = (Node**)malloc(graph->nrNodes * sizeof(Node*));
    k = 0;
    for(i=0; i<grid->rows; ++i){
        for(j=0; j<grid->cols; ++j){
            if(nodes[i][j] != NULL){
                graph->v[k++] = nodes[i][j];
            }
        }
    }

    //compute the adjacency list for each node
    for(i=0; i<graph->nrNodes; ++i){
        graph->v[i]->adjSize = get_neighbors(grid, graph->v[i]->position, neighb);
        if(graph->v[i]->adjSize != 0){
            graph->v[i]->adj = (Node**)malloc(graph->v[i]->adjSize * sizeof(Node*));
            k = 0;
            for(j=0; j<graph->v[i]->adjSize; ++j){
                if( neighb[j].row >= 0 && neighb[j].row < grid->rows &&
                    neighb[j].col >= 0 && neighb[j].col < grid->cols &&
                    grid->mat[neighb[j].row][neighb[j].col] == 0){
                        graph->v[i]->adj[k++] = nodes[neighb[j].row][neighb[j].col];
                }
            }
            if(k < graph->v[i]->adjSize){
                //get_neighbors returned some invalid neighbors
                graph->v[i]->adjSize = k;
                graph->v[i]->adj = (Node**)realloc(graph->v[i]->adj, k * sizeof(Node*));
            }
        }
    }
}

void free_graph(Graph *graph)
{
    if(graph->v != NULL){
        for(int i=0; i<graph->nrNodes; ++i){
            if(graph->v[i] != NULL){
                if(graph->v[i]->adj != NULL){
                    free(graph->v[i]->adj);
                    graph->v[i]->adj = NULL;
                }
                graph->v[i]->adjSize = 0;
                free(graph->v[i]);
                graph->v[i] = NULL;
            }
        }
        free(graph->v);
        graph->v = NULL;
    }
    graph->nrNodes = 0;
}

void bfs(Graph* graph, Node* s, Operation* op)
{
    for (int i = 0; i < graph->nrNodes; i++)
    {
        if (op != NULL)
            op->count(3);
        graph->v[i]->color = COLOR_WHITE;
        graph->v[i]->dist = -1;
        graph->v[i]->parent = NULL;

    }

    Node** queue = (Node**)malloc(graph->nrNodes * sizeof(Node*));
    int head = 0, tail = 0;

    if (op != NULL)
        op->count(3);
    s->color = COLOR_GRAY;
    s->dist = 0;
    s->parent = NULL;

    queue[tail++] = s; // am initializat nodul de start

    while (head < tail)
    {
        Node* u = queue[head++];

        //parcurg vecinii lui u
        for (int i = 0; i < u->adjSize; i++)
        {
            if (op != NULL)
                op->count();
            Node* v = u->adj[i];

            if (v->color == COLOR_WHITE)
            {
                v->color = COLOR_GRAY;
                v->dist = u->dist + 1;
                v->parent = u;

                queue[tail++] = v;
            }
        }

        u->color = COLOR_BLACK;
    }

    free(queue);
}


void print_tree_rec(int node, int level, int** children, int* childrenCount, Point* repr)
{
    for (int i = 0; i < level; i++)
        printf("  ");

    printf("(%d, %d)\n", repr[node].row, repr[node].col);

    for (int i = 0; i < childrenCount[node]; i++)
    {
        print_tree_rec(children[node][i], level + 1, children, childrenCount, repr);
    }
}

void print_bfs_tree(Graph *graph)
{
    //first, we will represent the BFS tree as a parent array
    int n = 0; //the number of nodes
    int *p = NULL; //the parent array
    Point *repr = NULL; //the representation for each element in p

    //some of the nodes in graph->v may not have been reached by BFS
    //p and repr will contain only the reachable nodes
    int *transf = (int*)malloc(graph->nrNodes * sizeof(int));
    for(int i=0; i<graph->nrNodes; ++i){
        if(graph->v[i]->color == COLOR_BLACK){
            transf[i] = n;
            ++n;
        }else{
            transf[i] = -1;
        }
    }
    if(n == 0){
        //no BFS tree
        free(transf);
        return;
    }

    int err = 0;
    p = (int*)malloc(n * sizeof(int));
    repr = (Point*)malloc(n * sizeof(Node));
    for(int i=0; i<graph->nrNodes && !err; ++i){
        if(graph->v[i]->color == COLOR_BLACK){
            if(transf[i] < 0 || transf[i] >= n){
                err = 1;
            }else{
                repr[transf[i]] = graph->v[i]->position;
                if(graph->v[i]->parent == NULL){
                    p[transf[i]] = -1;
                }else{
                    err = 1;
                    for(int j=0; j<graph->nrNodes; ++j){
                        if(graph->v[i]->parent == graph->v[j]){
                            if(transf[j] >= 0 && transf[j] < n){
                                p[transf[i]] = transf[j];
                                err = 0;
                            }
                            break;
                        }
                    }
                }
            }
        }
    }
    free(transf);
    transf = NULL;

    if(!err)
        {
            int** children = (int**)malloc(n * sizeof(int*));
            int* childrenCount = (int*)malloc(n * sizeof(int));

            for (int i = 0; i < n; i++)
            {
                children[i] = NULL;
                childrenCount[i] = 0;
            }

            for (int i = 0; i < n; i++)
            {
                if (p[i] != -1)
                    childrenCount[p[i]]++;
            }

            for (int i = 0; i < n; i++)
            {
                if (childrenCount[i] > 0)
                {
                    children[i] = (int*)malloc(childrenCount[i] * sizeof(int));
                    childrenCount[i] = 0;
                }
            }

            for (int i = 0; i < n; i++)
            {
                if (p[i] != -1)
                {
                    int parent = p[i];
                    children[parent][childrenCount[parent]++] = i;
                }
            }

            for (int i = 0; i < n; i++)
            {
                if (p[i] == -1)
                {
                    print_tree_rec(i, 0, children, childrenCount, repr);
                }
            }

            for (int i = 0; i < n; i++)
                if (children[i] != NULL)
                    free(children[i]);

            free(children);
            free(childrenCount);
        }


    if(p != NULL){
        free(p);
        p = NULL;
    }
    if(repr != NULL){
        free(repr);
        repr = NULL;
    }
}

int shortest_path(Graph* graph, Node* start, Node* end, Node* path[])
{
    bfs(graph, start, NULL);

    if (end->color != COLOR_BLACK)
        return -1;

    int length = 0;
    Node* current = end;

    while (current != NULL)
    {
        path[length++] = current;
        current = current->parent;
    }

    for (int i = 0; i < length / 2; i++)
    {
        Node* tmp = path[i];
        path[i] = path[length - 1 - i];
        path[length - 1 - i] = tmp;
    }

    return length;
}



void add_edge(Node* u, Node* v)
{
    u->adj = (Node**)realloc(u->adj, (u->adjSize + 1) * sizeof(Node*));
    u->adj[u->adjSize++] = v;
}


void performance()
{
    int n, i;
    Profiler p("bfs");

    for (n = 1000; n <= 4500; n += 100)
    {
        Operation op = p.createOperation("bfs-edges", n);
        Graph graph;
        graph.nrNodes = 100;

        graph.v = (Node**)malloc(graph.nrNodes * sizeof(Node*));
        for (i = 0; i < graph.nrNodes; ++i)
        {
            graph.v[i] = (Node*)malloc(sizeof(Node));
            memset(graph.v[i], 0, sizeof(Node));
            graph.v[i]->adj = NULL;
            graph.v[i]->adjSize = 0;
        }

        for (i = 1; i < graph.nrNodes; i++)
        {
            int parent = rand() % i;
            add_edge(graph.v[i], graph.v[parent]);
            add_edge(graph.v[parent], graph.v[i]);
        }

        int edges = graph.nrNodes - 1;

        while (edges < n)
        {
            int u = rand() % graph.nrNodes;
            int v = rand() % graph.nrNodes;

            if (u == v)
                continue;

            add_edge(graph.v[u], graph.v[v]);
            add_edge(graph.v[v], graph.v[u]);
            edges++;
        }

        bfs(&graph, graph.v[0], &op);
        free_graph(&graph);
    }

    for (n = 100; n <= 200; n += 10)
    {
        Operation op = p.createOperation("bfs-vertices", n);
        Graph graph;
        graph.nrNodes = n;

        graph.v = (Node**)malloc(graph.nrNodes * sizeof(Node*));
        for (i = 0; i < graph.nrNodes; ++i)
        {
            graph.v[i] = (Node*)malloc(sizeof(Node));
            memset(graph.v[i], 0, sizeof(Node));
            graph.v[i]->adj = NULL;
            graph.v[i]->adjSize = 0;
        }

        for (i = 1; i < graph.nrNodes; i++)
        {
            int parent = rand() % i;
            add_edge(graph.v[i], graph.v[parent]);
            add_edge(graph.v[parent], graph.v[i]);
        }

        int edges = graph.nrNodes - 1;

        while (edges < 4500)
        {
            int u = rand() % graph.nrNodes;
            int v = rand() % graph.nrNodes;

            if (u == v)
                continue;

            add_edge(graph.v[u], graph.v[v]);
            add_edge(graph.v[v], graph.v[u]);
            edges++;
        }

        bfs(&graph, graph.v[0], &op);
        free_graph(&graph);
    }

    p.showReport();
}


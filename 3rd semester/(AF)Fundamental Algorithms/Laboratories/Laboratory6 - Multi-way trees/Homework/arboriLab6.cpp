#include <stdlib.h>
#include <stdio.h>
#include <stack>
#include "Profiler.h"
using namespace std;

Profiler d("Tema");


#define maxSize 10000
#define increment 100

typedef struct Node
{
	int val;
	Node* right;
	Node* left;
}Node;


typedef struct n1
{
    int k;
    n1** child;
    int nc;
}n1;

typedef struct n2
{
    int k;
    n2* c, * s;
}n2;


void inOrderRec(Node* root)
{
	if (root == NULL)
		return;
	inOrderRec(root->left);
	printf("%d ", root->val);
	inOrderRec(root->right);
}


void inOrderIterativ(Node* root)
{
    stack<Node*> st;
    Node* curr = root;

    while (curr != NULL || !st.empty()) 
    {
        while (curr != NULL) 
        {
            st.push(curr);
            curr = curr->left;
        }
        curr = st.top();
        st.pop();
        printf("%d ", curr->val);
        curr = curr->right;
    }
}

int* R1(int &n)
{
    static int a[] = {0, 2, 7, 5, 2, 7, 7, -1, 5, 2 };
    n = (sizeof(a) / sizeof(a[0])) - 1;
    return a;
}




Node* createNode(int key)
{
    Node* p = (Node*)malloc(sizeof(Node));
    p->val = key;
    p->left = p->right = NULL;
    return p;
}

Node* insertNode(Node* root, int key)
{
    if (root == NULL)
        return createNode(key);

    if (key < root->val)
        root->left = insertNode(root->left, key);
    else if (key > root->val)
        root->right = insertNode(root->right, key);

    return root;
}

void demoInOrderIterativ()
{
    Node* root = createNode(5);
    insertNode(root, 10);
    insertNode(root, 3);
    insertNode(root, 15);
    insertNode(root, 2);
    insertNode(root, 1);
    inOrderIterativ(root);
    printf("\n");

}

void demoInOrderRecursiv()
{
    Node* root = createNode(5);
    insertNode(root, 10);
    insertNode(root, 3);
    insertNode(root, 15);
    insertNode(root, 2);
    insertNode(root, 1);
    inOrderRec(root);
    printf("\n");
}


void prettyPrint(Node* root, int space = 0, int indent = 6)
{
    if (root == NULL)
        return;

    space = space + indent;

    prettyPrint(root->right, space);

    printf("\n");
    for (int i = indent; i < space; i++)
        printf(" ");
    printf("%d\n", root->val);

    prettyPrint(root->left, space);

}


void printTreeR1(int P[], int n, int node, int level)
{
    for (int i = 0; i < level; i++)
        printf("    ");

    printf("%d\n", node);

    for (int i = 1; i <= n; i++)
        if (P[i] == node)
            printTreeR1(P, n, i, level + 1);
}



void demoPrettyPrintR1()
{
    int root = -1;

    int P[] = {0, 2, 7, 5, 2, 7, 7, -1, 5, 2};
    int n = (sizeof(P) / sizeof(P[0])) - 1;

    for (int i = 1; i <= n; i++)
        if (P[i] == -1)
            root = i;

    if (root == -1)
    {
        printf("Nu exista radacina\n");
        return;
    }

    printTreeR1(P, n, root, 0);
}

n1* R1toR2(int P[], int n)
{
    Operation opTotal = d.createOperation("opTotalR1toR2",n);
    n1** res = (n1**)malloc((n + 1) * sizeof(n1*));
    for (int i = 1; i <= n; i++)
    {
        res[i] = (n1*)malloc(sizeof(n1));
        res[i]->k = i;
        res[i]->nc = 0;
        res[i]->child = (n1**)malloc(n * sizeof(n1*));
    }

    int root = -1;
    for (int i = 1; i <= n; i++)
    {
        opTotal.count();
        if (P[i] == -1)
            root = i;
    }

    for (int i = 1; i <= n; i++)
    {
        opTotal.count();
        if (P[i] != -1)
        {
            if (P[i]<1 || P[i] > n)
            {
                continue;
            }
            opTotal.count();
            n1* parent = res[P[i]];
            parent->child[parent->nc++] = res[i];
        }
    }

    n1* rootNode = res[root];
    free(res);
    return rootNode;
}

void prettyPrintR2(n1* node, int level) 
{
    if (node == NULL) 
        return;

    for (int i = 0; i < level; i++)
        printf("    ");

    printf("%d\n", node->k);

    for (int i = 0; i < node->nc; i++)
        prettyPrintR2(node->child[i], level + 1);
}

void demoPrettyPrintR2()
{
    int n;
    int *a = R1(n);
    n1* root = R1toR2(a, n);
    prettyPrintR2(root, 0);
}

n2* R2toR3(n1* rootR2)
{
    if (rootR2 == NULL)
        return NULL;

    n2* root = (n2*)malloc(sizeof(n2));
    root->k = rootR2->k;
    root->c = NULL;
    root->s = NULL;

    if (rootR2->nc == 0)
        return root;

    root->c = R2toR3(rootR2->child[0]);

    n2* aux = root->c;

    for (int i = 1; i < rootR2->nc; i++)
    {
        aux->s = R2toR3(rootR2->child[i]);
        aux = aux->s;
    }
    return root;
}



void prettyPrintR3(n2* root, int level = 0)
{
    if (root == NULL)
        return;

    for (int i = 0; i < level; i++)
        printf("    ");

    printf("%d\n", root->k);

    prettyPrintR3(root->c, level + 1);

    prettyPrintR3(root->s, level);
}


void demoPrettyPrintR3()
{
    int n;
    int* a = R1(n);
    n1* root = R1toR2(a, n);
    n2* rootNou = R2toR3(root);
    prettyPrintR3(rootNou, 0);

}


int main()
{
    demoInOrderIterativ();
    demoInOrderRecursiv();
    demoPrettyPrintR1();
    printf("\n");
    demoPrettyPrintR2();
    demoPrettyPrintR3();

    return 0;
}

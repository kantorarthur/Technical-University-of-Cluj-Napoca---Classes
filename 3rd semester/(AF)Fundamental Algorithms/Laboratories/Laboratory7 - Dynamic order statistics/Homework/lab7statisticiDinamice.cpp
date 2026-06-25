#include <stdio.h>
#include <stdlib.h>
#include "Profiler.h"

Profiler d("tema");

#define maxSize 10000
#define stepSize 100

typedef struct Node
{
	int key;
	int size;
	Node* left, * right;
}Node;


Node* construireArboreEchilibrat(int l, int r, Operation &opTotal)
{
	if (l > r)
		return NULL;
	
	int mid = (l + r) / 2;
	Node* root = (Node*)malloc(sizeof(Node));
	root->key = mid;
	root->left = NULL;
	root->right = NULL;
	root->size = 1;

	opTotal.count();
	root->left = construireArboreEchilibrat(l, mid - 1,opTotal);
	opTotal.count();
	root->right = construireArboreEchilibrat(mid + 1, r,opTotal);

	int marimeStanga = -1;
	int marimeDreapta = -1;

	opTotal.count();
	if (root->left != NULL)
		marimeStanga = root->left->size;
	else
		marimeStanga = 0;

	opTotal.count();
	if (root->right != NULL)
		marimeDreapta = root->right->size;
	else
		marimeDreapta = 0;

	opTotal.count();
	root->size = 1 + marimeStanga + marimeDreapta;
	return root;
}


Node* osSelect(Node* root, int i, Operation &opTotal)
{
	opTotal.count();
	if (root == NULL)
		return NULL;

	int marimeStanga = -1;
	opTotal.count();
	if (root->left != NULL)
	{
		opTotal.count();
		marimeStanga = root->left->size;
	}
	else
		marimeStanga = 0;

	int r = marimeStanga + 1;

	if (i == r)
		return root;
	else if (i < r)
		return osSelect(root->left, i,opTotal);
	else
		return osSelect(root->right, i - r,opTotal);
}

Node* arboreDelete(Node* root, int key,Operation &opTotal)
{
	if (root == NULL)
		return NULL;

	opTotal.count();
	if (key < root->key)
		root->left = arboreDelete(root->left, key,opTotal);
	else if (key > root->key)
	{
		opTotal.count(2);
		root->right = arboreDelete(root->right, key, opTotal);
	}

	else 
	{
		opTotal.count();
		if (root->left == NULL) 
		{
			opTotal.count();
			Node* temp = root->right;
			free(root);
			return temp;
		}
		opTotal.count();
		if (root->right == NULL) 
		{
			opTotal.count();
			Node* temp = root->left;
			free(root);
			return temp;
		}
		opTotal.count();
		Node* succ = root->right;
		while (succ->left != NULL)
			succ = succ->left;

		opTotal.count();
		root->key = succ->key;

		opTotal.count();
		root->right = arboreDelete(root->right, succ->key,opTotal);
	}

	int sizeSt = -1;
	int sizeDr = -1;

	opTotal.count();
	if (root->left != NULL)
		sizeSt = root->left->size;
	else
		sizeSt = 0;

	opTotal.count();
	if (root->right != NULL)
		sizeDr = root->right->size;
	else
		sizeDr = 0;

	opTotal.count();
	root->size = 1 + sizeSt + sizeDr;

	return root;
}


Node* osDelete(Node* root, int i,Operation &opTotal)
{

	Node* target = osSelect(root, i,opTotal);
	if (target == NULL)
		return root; 

	int keyToDelete = target->key;

	root = arboreDelete(root, keyToDelete,opTotal);

	return root;
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
	printf("%d\n", root->key);

	prettyPrint(root->left, space);
}

void demoConstruire()
{
	int n = 10;
	Operation opTotal = d.createOperation("opTotal", n);
	Node* root = construireArboreEchilibrat(0, n, opTotal);
	prettyPrint(root);
}

void demoOsSelect()
{
	int n = 10;
	Operation opTotal = d.createOperation("opTotal", n);
	Node* root = construireArboreEchilibrat(0, n,opTotal);
	Node* root2 = osSelect(root, 4, opTotal);
	printf("%d ", root2->key);
    root2 = osSelect(root, 2, opTotal);
	printf("%d ", root2->key);
	root2 = osSelect(root, 8, opTotal);
	printf("%d ", root2->key);
}

void demoOsDelete()
{
	printf("\n");
	int n = 10;
	Operation opTotal = d.createOperation("opTotal", n);
	Node* root = construireArboreEchilibrat(0, n,opTotal);
	Node* root2 = osSelect(root, 4,opTotal);
	osDelete(root, 3, opTotal);
	prettyPrint(root);
	printf("\n");
	printf("\n");
	root2 = osSelect(root, 2, opTotal);
	osDelete(root, 5, opTotal);
	prettyPrint(root);
	printf("\n");
	printf("\n");
	root2 = osSelect(root, 8, opTotal);
	osDelete(root, 7, opTotal);
	prettyPrint(root);
	printf("\n");
	printf("\n");
}

void evaluare()
{
	for (int teste = 0;teste<5;teste++)
	{
		for (int i=stepSize;i<maxSize;i=i+stepSize)
		{
			Operation osSelectOP = d.createOperation("osSelectTotal", i);
			Operation osDeleteOP = d.createOperation("osDeleteTotal", i);
			Operation construireOP = d.createOperation("construireTotal", i);
			int random = rand() % (i - 1 + 1);
			Node* root = construireArboreEchilibrat(1, i, construireOP);
			osSelect(root, random, osSelectOP);
			osDelete(root, random, osDeleteOP);
		}
	}
	d.divideValues("osSelectTotal", 5);
	d.divideValues("osDeleteTotal", 5);
	d.divideValues("construireTotal", 5);
	d.showReport();
}

int main()
{
	demoConstruire();
	demoOsSelect();
	demoOsDelete();
	evaluare();
	return 0;
}

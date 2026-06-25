#include <stdlib.h>
#include <stdio.h>
#include "Profiler.h"

Profiler d("tema");

typedef struct lista
{
	int key;
	lista* next;
}list;

typedef struct
{
	list* first;
	list* last;
}lList;

lList* init()
{
	lList* p = (lList*)malloc(sizeof(lList));
	p->first = p->last = NULL;
	return p;
}

list* creareNod(int key)
{
	list* p = (list*)malloc(sizeof(list));
	p->key = key;
	p->next = NULL;
	return p;
}

void insertLast(int key, lList* lista)
{
	list* p = creareNod(key);
	if (lista->first == NULL)
	{
		lista->first = lista->last = p;
	}
	else
	{
		lista->last->next = p;
		lista->last = lista->last->next;
	}
}

void swap(int* a, int* b)
{
	int aux = *a;
	*a = *b;
	*b = aux;
}

int left(int i)
{
	return 2 * i + 1;
}

int right(int i)
{
	return 2 * i + 2;
}

void heapify(int a[], int i, int n)
{
	int min = i;
	int l = left(i);
	int r = right(i);
	if (a[min] > a[l] && l < n)
		min = l;
	if (a[min] > a[r] && r < n)
		min = r;
	if (min != i)
	{
		swap(&a[i], &a[min]);
		heapify(a, min, n);
	}
}

void buildMinHeap(int a[], int n)
{
	for (int i = n / 2 - 1; i >= 0; i--)
		heapify(a, i, n);
}

void minHeap(int a[], int n)
{
	buildMinHeap(a, n);
	for (int i = n - 1; i > 0; i--)
	{
		swap(&a[i], &a[0]);
		heapify(a, 0, i);
	}
}


lList* mergeSorted(lList* a[], int k,int n)
{
	lList* res = init();
	list** heads = (list**)malloc(k * sizeof(list*));
	Operation opTotal = d.createOperation("opTotal", n);
	for (int i = 0; i < k; i++)
	{
		opTotal.count();
		heads[i] = a[i]->first;
	}

	int* heap = (int*)malloc(k * sizeof(int));
	int heapSize = 0;

	for (int i = 0; i < k; i++)	
	{
		opTotal.count();
		if (heads[i] != NULL)
		{
			opTotal.count();
			heap[heapSize] = heads[i]->key;
			heapSize++;
		}
	}

	buildMinHeap(heap, heapSize);

	while (heapSize > 0)
	{
		opTotal.count();
		int minValue = heap[0];
		opTotal.count();
		insertLast(minValue, res);
		int indexLista = -1;
		for (int i = 0; i < k; i++)
		{
			opTotal.count();
			if (heads[i] != NULL && heads[i]->key == minValue)
			{
				indexLista = i;
				break;
			}
		}
		if (indexLista == -1)
		{
			printf("nu s-a gasit lista pentru valoarea %d", minValue);
			break;
		}
		opTotal.count();
		heads[indexLista] = heads[indexLista]->next;

		opTotal.count();
		if (heads[indexLista] != NULL)
		{
			opTotal.count();
			heap[0] = heads[indexLista]->key;
		}
		else
		{
			opTotal.count();
			heap[0] = heap[heapSize - 1];
			heapSize--;
		}
		opTotal.count();
		heapify(heap, 0, heapSize);
	}



	free(heap);
	free(heads);

	return res;
}

void demo()
{
	int k = 4, n = 20;
	lList** a=(lList**)malloc(k*sizeof(lList*));
	lList* a1 = init();
	lList* a2 = init();
	lList* a3 = init();
	lList* a4 = init();
	int p = 0;
	for (int j = 0; j < n; j++)
	{
		insertLast(p, a1);
		p++;
	}
	for (int j = 0; j < n; j++)
	{
		insertLast(p, a2);
		p++;
	}
	for (int j = 0; j < n; j++)
	{
		insertLast(p, a3);
		p++;
	}
	for (int j = 0; j < n; j++)
	{
		insertLast(p, a4);
		p++;
	}
	a[0] = a1;
	a[1] = a2;
	a[2] = a3;
	a[3] = a4;
	lList* rezultat = mergeSorted(a, k, n);
	list* d = rezultat->first;
	while (d != NULL)
	{
		printf("%d ", d->key);
		d = d->next;
	}
	list *remove = rezultat->first;
	while (remove != NULL)
	{
		list* remove2 = remove->next;
		free(remove);
		remove = remove2;
	}

}

void avg()
{
	int k1 = 5, k2 = 10, k3 = 100, n = 10000;
	lList** a = (lList**)malloc(k1 * sizeof(lList*));
	lList** b = (lList**)malloc(k2 * sizeof(lList*));
	lList** c = (lList**)malloc(k3 * sizeof(lList*));

	int cnt = 0, cnt2 = n / k1;
	for (int i = 0; i < k1; i++)
	{
		lList* d = init();
		while (cnt < cnt2)
		{
			insertLast(cnt, d);
			cnt++;
		}
		a[i] = d;
		cnt2 += n / k1;
	}

	cnt = 0, cnt2 = n / k2;
	for (int i = 0; i < k2; i++)
	{
		lList* d = init();
		while (cnt < cnt2)
		{
			insertLast(cnt, d);
			cnt++;
		}
		b[i] = d;
		cnt2 += n / k2;
	}

	cnt = 0, cnt2 = n / k3;
	for (int i = 0; i < k3; i++)
	{
		lList* d = init();
		while (cnt < cnt2)
		{
			insertLast(cnt, d);
			cnt++;
		}
		c[i] = d;
		cnt2 += n / k3;
	}

	mergeSorted(a, k1, n);
	d.showReport();
	d.reset();
	mergeSorted(b, k2, n);
	d.showReport();
	d.reset();
	mergeSorted(c, k3, n);
	d.showReport();
	d.reset();
}


int main()
{
	//demo();
	avg();
	return 0;
}



#include <stdio.h>
#include <stdlib.h>
#include "Profiler.h"
#include <array>

Profiler d("Heapuri");

#define maxBsize 500
#define nrBpasi 20

void swap(int* a, int* b)
{
	int aux = *a;
	*a = *b;
	*b = aux;
}

void bubbleSort(int v[], int n)
{
	Operation nrComp = d.createOperation("bSortComp", n);
	Operation nrAtr = d.createOperation("bSortAtr", n);
	for (int i = 0; i < n; i++)
	{
		boolean schimbat = false;
		for (int j = 0; j < n - i - 1; j++)
		{
			nrComp.count();
			if (v[j] > v[j + 1])
			{
				nrAtr.count(3);
				swap(&v[j], &v[j + 1]);
				schimbat = true;
			}
		}
		if (schimbat == false)
			break;
	}
}




void bubbleSortRec(int v[], int n, Operation &nrComp,Operation &nrAtr)
{

	if (n == 1)
		return;
	boolean schimbat = false;
	for (int j = 0; j < n - 1; j++)
	{
		nrComp.count();
		if (v[j] > v[j + 1])
		{
			nrAtr.count(3);
			swap(&v[j], &v[j + 1]);
			schimbat = true;
		}
	}
	if (schimbat == false)
		return;
	bubbleSortRec(v, n - 1,nrComp,nrAtr);
}

void demoBubble()
{
	int v[] = { 8,2,9,1,3 };
	int w[] = { 8,2,9,1,3 };
	bubbleSort(v, 5);
	Operation nrComp = d.createOperation("bSortRecComp", 5);
	Operation nrAtr = d.createOperation("bSortRecAtr", 5);
	bubbleSortRec(w, 5,nrComp,nrAtr);
	for (int i = 0; i < 5; i++)
		printf("%d ", v[i]);
	printf("\n");
	for (int i = 0; i < 5; i++)
		printf("%d ", w[i]);
	printf("\n");
}


void perfAvgBubbleSort()
{
	int v1[maxBsize];
	int v2[maxBsize];
	for (int i = nrBpasi; i < maxBsize; i += nrBpasi)
	{
		FillRandomArray(v1, i);
		FillRandomArray(v2, i);
		bubbleSort(v1, i);
		Operation nrComp = d.createOperation("bSortRecComp", i);
		Operation nrAtr = d.createOperation("bSortRecAtr", i);
		bubbleSortRec(v2, i,nrComp,nrAtr);
	}


	d.addSeries("bSortTotal", "bSortAtr", "bSortComp");
	d.addSeries("bSortRecTotal", "bSortRecAtr", "bSortRecComp");
	d.createGroup("avgAtr", "bSortAtr", "bSortRecAtr");
	d.createGroup("avgCmp", "bSortComp", "bSortRecComp");
	d.createGroup("avgTotal", "bSortTotal", "bSortRecTotal");
	d.showReport();
}


void timpBsort()
{
	int v1[maxBsize];
	for (int i = nrBpasi; i < maxBsize; i += nrBpasi)
	{
		FillRandomArray(v1, i);
		d.startTimer("bubbleSortRecTimp", i);
		for (int test = 0; test < 100; test++)
		{
			Operation nrComp = d.createOperation("bSortRecComp", i);
			Operation nrAtr = d.createOperation("bSortRecAtr", i);
			bubbleSortRec(v1, i,nrComp,nrAtr);
		}
		d.stopTimer("bubbleSortRecTimp", i);
	}


	int v2[maxBsize];
	for (int i = nrBpasi; i < maxBsize; i += nrBpasi)
	{
		FillRandomArray(v2, i);
		d.startTimer("bubbleSortTimp", i);
		for (int test = 0; test < 100; test++)
		{
			bubbleSort(v2, i);
		}
		d.stopTimer("bubbleSortTimp", i);
	}
	d.showReport();
}

int parent(int i)
{
	return (i - 1) / 2;
}

int left(int i)
{
	return 2 * i + 1;
}

int right(int i)
{
	return 2 * i + 2;
}

void topDown(int v[], int n)
{
	Operation nrAtr = d.createOperation("tDwnATR", n);
	Operation nrCmp = d.createOperation("tDwnCMP", n);
	for (int i = 0; i < n; i++)
	{
		int i_s = i;
		int p = parent(i_s);
		nrCmp.count();
		while (p >= 0 && v[i_s] > v[p])
		{
			nrAtr.count(3);
			swap(&v[i_s], &v[p]);
			i_s = p;
			p = parent(i_s);
		}
	}
}

void heapify(int v[], int i,int n, Operation nrAtr, Operation nrCmp)
{

	int l = left(i);
	int r = right(i);
	int m = i;
	nrCmp.count();
	if (l < n && v[m] < v[l])
		m = l;
	nrCmp.count();
	if (r < n && v[m] < v[r])
		m = r;
	if (m != i)
	{
		nrAtr.count(3);
		swap(&v[m], &v[i]);
		heapify(v, m, n, nrAtr, nrCmp);
	}
}

void bottomUp(int v[], int n)
{
	Operation nrAtr = d.createOperation("bUpATR", n);
	Operation nrCmp = d.createOperation("bUpCMP", n);
	for (int i = n / 2 - 1; i >= 0; i--)
	{	
		heapify(v, i, n,nrAtr,nrCmp);
	}
}

void heapSortUp(int v[], int n)
{
	bottomUp(v, n);
	Operation nrAtr = d.createOperation("bUpATR2", n);
	Operation nrCmp = d.createOperation("bUpCMP2", n);

	for (int i = n - 1; i > 0; i--)
	{
		swap(&v[0], &v[i]);
		heapify(v, 0, i,nrAtr,nrCmp);
	}
}

void heapSortDown(int v[], int n)
{
	topDown(v, n);
	for (int i = n - 1; i > 0; i--)
	{
		Operation nrAtr = d.createOperation("tDwnATR2", n);
		Operation nrCmp = d.createOperation("tDwnCMP2", n);
		nrAtr.count(3);
		swap(&v[0], &v[i]);
		heapify(v, 0, i,nrAtr,nrCmp);
	}
}


void demoHeap()
{
	int v[] = { 9,2,3,1,2 };
	heapSortDown(v, 5);
	for (int i = 0; i < 5; i++)
		printf("%d ", v[i]);
	printf("\n");
	int w[] = { 9,2,3,1,2 };
	heapSortUp(w, 5);
	for (int i = 0; i < 5; i++)
		printf("%d ", v[i]);
	printf("\n");
}

void timpHeapSorturi()
{
	int v1[maxBsize];
	for (int i = nrBpasi; i < maxBsize; i += nrBpasi)
	{
		FillRandomArray(v1, i);
		d.startTimer("heapTopDownTimp", i);
		for (int test = 0; test < 50; test++)
		{
			heapSortDown(v1, i);
		}
		d.stopTimer("heapTopDownTimp", i);
	}


	int v2[maxBsize];
	for (int i = nrBpasi; i < maxBsize; i += nrBpasi)
	{
		FillRandomArray(v2, i);
		d.startTimer("heapBottomUpTimp", i);
		for (int test = 0; test < 50; test++)
		{
			heapSortUp(v2, i);
		}
		d.stopTimer("heapBottomUpTimp", i);
	}
	d.showReport();
}

void perfAvgHeapSort()
{
	int v1[maxBsize];
	int v2[maxBsize];
	for (int i = nrBpasi; i < maxBsize; i += nrBpasi)
	{
		for (int j = 0; j < 5; j++)
		{
			FillRandomArray(v1, i);
			memcpy(v1, v2, i);
			heapSortDown(v1, i);
			heapSortUp(v2, i);
		}
	}

	d.addSeries("bUpTotalATR", "bUpATR", "bUpATR2");
	d.addSeries("bUpTotalCMP", "bUpCMP", "bUpCMP2");
	d.divideValues("bUpTotalCMP", 5);
	d.divideValues("bUpTotalATR", 5);
	d.createGroup("bUpTotal", "bUpTotalCMP", "bUpTotalAtr");
	d.addSeries("tDwnTotalATR", "tDwnATR", "tDwnATR2");
	d.addSeries("tDwnTotalCMP", "tDwnCMP", "tDwnCMP2");
	d.divideValues("tDwnTotalATR", 5);
	d.divideValues("tDwnTotalCMP", 5);
	d.createGroup("tDwnTotal", "tDwnTotalCMP", "tDwnTotalAtr");
	d.createGroup("avgAtr", "bUpTotalATR", "tDwnTotalATR");
	d.createGroup("avgCmp", "bUpTotalCMP", "tDwnTotalCMP");
	d.createGroup("avgTotal", "bUpTotal", "tDwnTotal");
	d.showReport();
}

int main()
{
	//demoBubble();
	perfAvgBubbleSort();
	d.reset();
	timpBsort();
	d.reset();
	//demoHeap();
	timpHeapSorturi();
	d.reset();
	perfAvgHeapSort();
	return 0;
}
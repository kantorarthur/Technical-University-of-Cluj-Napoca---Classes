#include <stdlib.h>
#include <stdio.h>
#include <vector>
#include "Profiler.h"

Profiler d("Tema");

#define maxSize 10000
#define increment 100

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


void heapify(int a[], int n, int i, Operation& operatiiTotal)
{
	int largest = i;
	int l = left(i);
	int r = right(i);

	operatiiTotal.count();
	if (l < n && a[l] > a[largest])
		largest = l;
	operatiiTotal.count();
	if (r<n && a[r]>a[largest])
		largest = r;
	if (largest != i)
	{
		operatiiTotal.count(3);
		swap(&a[largest], &a[i]);
		heapify(a, n, largest, operatiiTotal);
	}
}



void buildMaxHeap(int a[], int n, Operation& operatiiTotal)
{
	for (int i = n / 2 - 1; i >= 0; i--)
		heapify(a, n, i, operatiiTotal);
}

void heapSortBottomUp(int a[], int n, Operation& operatiiTotal)
{
	buildMaxHeap(a, n, operatiiTotal);
	for (int i = n - 1; i > 0; i--)
	{
		operatiiTotal.count(3);
		swap(&a[0], &a[i]);
		heapify(a, i, 0, operatiiTotal);
	}
}

void demoHeapSort()
{
	Operation operatiiTotalHeap = d.createOperation("heapSortTotal", 0);
	int a[] = { 3,8,2,1,9 };
	int n = sizeof(a) / sizeof(a[0]);
	heapSortBottomUp(a, n, operatiiTotalHeap);
	for (int i = 0; i < n; i++)
		printf("%d ", a[i]);
	printf("\n");
}


int partition(int a[], int left, int right, Operation& operatiiTotal)
{
	operatiiTotal.count();
	int piv = a[right];
	int j = left - 1;
	for (int i = left; i < right; i++)
	{
		operatiiTotal.count();
		if (a[i] <= piv)
		{
			j++;
			operatiiTotal.count(3);
			swap(&a[j], &a[i]);
		}
	}
	operatiiTotal.count(3);
	swap(&a[j + 1], &a[right]);
	return j + 1;
}

void quickSort(int a[], int left, int right, Operation& operatiiTotal)
{
	if (left < right)
	{
		int piv = partition(a, left, right, operatiiTotal);
		quickSort(a, left, piv - 1, operatiiTotal);
		quickSort(a, piv + 1, right, operatiiTotal);
	}
}

void demoQuickSort()
{
	Operation operatiiTotal = d.createOperation("quickSortTotal", 0);
	int a[] = { 9,2,8,10,11,7,3,2 };
	int n = sizeof(a) / sizeof(a[0]);
	quickSort(a, 0, n - 1, operatiiTotal);
	for (int i = 0; i < n; i++)
		printf("%d ", a[i]);
	printf("\n");
}


void quickSortCompAvg()
{
	int a[maxSize];
	for (int i = increment; i <= maxSize; i += increment)
	{
		FillRandomArray(a, i);
		Operation operatiiTotalQuick = d.createOperation("quickSortTotalAvg", i);
		quickSort(a, 0, i - 1, operatiiTotalQuick);
	}
	d.showReport();
}

void quickSortCompWorst()
{
	int a[2000];
	for (int i = 75; i <= 2000; i += 75)
	{
		FillRandomArray(a, i, 10, 2000, false, 2);
		Operation operatiiTotalQuick = d.createOperation("quickSortTotalWorst", i);
		quickSort(a, 0, i - 1, operatiiTotalQuick);
	}
	d.showReport();
}

void quickSortCompBest()
{
	int a[maxSize];
	for (int i = increment; i <= maxSize; i += increment)
	{
		FillRandomArray(a, i, 10, 50000, false, 0);
		Operation operatiiTotalQuick = d.createOperation("quickSortTotalBest", i);
		quickSort(a, 0, i - 1, operatiiTotalQuick);
	}
	d.showReport();
}



void quickSortCompAvgBestWorst() //am fct functia asta ca sa creeze toate 3 pe o singura pagina web comparatiile
{
	int a[maxSize];
	for (int i = increment; i <= maxSize; i += increment)
	{
		FillRandomArray(a, i);
		Operation operatiiTotalQuick = d.createOperation("quickSortTotalAvg", i);
		quickSort(a, 0, i - 1, operatiiTotalQuick);
	}

	int b[2000];
	for (int i = 75; i <= 2000; i += 75)
	{
		FillRandomArray(b, i, 10, 2000, false, 2);
		Operation operatiiTotalQuick = d.createOperation("quickSortTotalWorst", i);
		quickSort(a, 0, i - 1, operatiiTotalQuick);
	}

	for (int i = increment; i <= maxSize; i += increment)
	{
		FillRandomArray(a, i, 10, 50000, false, 0);
		Operation operatiiTotalQuick = d.createOperation("quickSortTotalBest", i);
		quickSort(a, 0, i - 1, operatiiTotalQuick);
	}
	d.showReport();
}

void avgHeapQuick()
{
	int a[maxSize];
	int b[maxSize];
	for (int i = increment; i <= maxSize; i += increment)
	{
		for (int j = 0; j < 5; j++)
		{
			FillRandomArray(a, i);
			memcpy(b, a, sizeof(a));
			Operation operatiiTotalQuick = d.createOperation("quickSortTotalVsHeap", i);
			quickSort(a, 0, i - 1, operatiiTotalQuick);
			Operation operatiiTotalHeap = d.createOperation("heapSortTotalVsQuick", i);
			heapSortBottomUp(b, i, operatiiTotalHeap);
		}
	}
	d.divideValues("quickSortTotalVsHeap", 5);
	d.divideValues("heapSortTotalVsQuick", 5);
	d.createGroup("quick_VS_heap", "heapSortTotalVsQuick", "quickSortTotalVsHeap");
	d.showReport();
}

void insertion_sort(int a[],int left, int n, Operation& operatiiTotal)
{

	for (int i = left+1; i <= n; i++)
	{
		operatiiTotal.count();
		int key = a[i];
		int j = i - 1;

		operatiiTotal.count();
		while (j >= 0 && a[j] > key)
		{
			operatiiTotal.count();
			a[j + 1] = a[j];
			j -= 1;
		}
		operatiiTotal.count();
		a[j + 1] = key;
	}
}

void quickSortHibrid(int a[], int left, int right, Operation& operatiiTotal, int prag)
{
	if (right - left+1 <= prag)
	{
		insertion_sort(a,left, right, operatiiTotal);
		return;
	}
	else if (left < right)
	{
		int piv = partition(a, left, right, operatiiTotal);
		quickSortHibrid(a, left, piv - 1, operatiiTotal, prag);
		quickSortHibrid(a, piv + 1, right, operatiiTotal, prag);
	}
}


void demoQuickSortHibrid()
{
	Operation operatiiTotal = d.createOperation("quicksddf", 0);
	int a[] = {9,2,5,15,82,1};
	int n = sizeof(a) / sizeof(a[0]);
	quickSortHibrid(a, 0, n-1, operatiiTotal, 3);
	for (int i = 0; i < n; i++)
		printf("%d ", a[i]);
	printf("\n");
	
}

void quickSortHibridComp()
{
	int a[2000];
	int prag = 5;
	for (int i = 50; i <= 2000; i += 50)
	{
		for (int teste = 1; teste < 101; teste++)
		{
			if (prag * 2 > 50)
				prag = 5;
			else
				prag = prag * 2;
			FillRandomArray(a, i);
			Operation operatiiTotalQuick = d.createOperation("quickSortHibridTotal", i);
			quickSortHibrid(a, 0, i - 1, operatiiTotalQuick, prag);
		}
	}
	d.divideValues("quickSortHibridTotal", 100);
	d.showReport();
}

int partitionTimp(int a[], int left, int right)
{
	int piv = a[right];
	int j = left - 1;
	for (int i = left; i < right; i++)
	{
		if (a[i] <= piv)
		{
			j++;
			swap(&a[j], &a[i]);
		}
	}
	swap(&a[j + 1], &a[right]);
	return j + 1;
}

void quickSortTimp(int a[], int left, int right)
{
	if (left < right)
	{
		int piv = partitionTimp(a, left, right);
		quickSortTimp(a, left, piv - 1);
		quickSortTimp(a, piv + 1, right);
	}
}


void insertion_sortTimp(int a[], int left, int n)
{

	for (int i = left + 1; i <= n; i++)
	{
		int key = a[i];
		int j = i - 1;

		while (j >= 0 && a[j] > key)
		{
			a[j + 1] = a[j];
			j -= 1;
		}
		a[j + 1] = key;
	}
}

void quickSortHibridTimp(int a[], int left, int right, int prag)
{
	if (right - left + 1 <= prag)
	{
		insertion_sortTimp(a, left, right);
		return;
	}
	else if (left < right)
	{
		int piv = partitionTimp(a, left, right);
		quickSortHibridTimp(a, left, piv - 1, prag);
		quickSortHibridTimp(a, piv + 1, right, prag);
	}
}

void quickSortVsQuickSortHibrid()
{
	int a[maxSize];
	int b[maxSize];
	for (int i = increment; i < maxSize; i += increment)
	{
		FillRandomArray(a, i);
		d.startTimer("timpQuickSort", i);
		quickSortTimp(a, 0, i - 1);
		d.stopTimer("timpQuickSort", i);
	}
	for (int i = increment; i < maxSize; i += increment)
	{
		FillRandomArray(b, i);
		d.startTimer("timpQuickSortHibrid", i);
		quickSortHibridTimp(b, 0, i - 1, 30);
		d.stopTimer("timpQuickSortHibrid", i);
	}
	d.createGroup("timpQuickSortVsHibrid", "timpQuickSortHibrid", "timpQuickSort");
	d.showReport();
}

void quickSortVsQuickSortHibridOP()
{
	int a[2000];
	int b[2000];
	for (int i = 50; i <= 2000; i += 50)
	{
		Operation operatiiTotal = d.createOperation("quickSortTotal", i);
		FillRandomArray(a, i);
		quickSort(a, 0, i - 1, operatiiTotal);
	}
	for (int i = 50; i <= 2000; i += 50)
	{
		FillRandomArray(a, i);
		Operation operatiiTotalQuick = d.createOperation("quickSortHibridTotal", i);
		quickSortHibrid(a, 0, i - 1, operatiiTotalQuick, 30);
	}
	d.createGroup("totalQuickSortVsHibrid", "quickSortHibridTotal", "quickSortTotal");
	d.showReport();
}

int quickSelect(int a[], int left, int right, int i)
{
	if (left == right)
		return a[left];
	int piv = partitionTimp(a, left, right);
	int	k = piv - left + 1;
	if (i == k)
		return a[piv];
	else if(i < k)
		return quickSelect(a, left, piv-1, i);
	else
		return quickSelect(a, piv + 1, right, i - k);
}

void demoQuickSelect()
{
	int a[] = { 9,3,2,8,1 };
	int n = sizeof(a) / sizeof(a[0]);
	printf("%d ", quickSelect(a, 0, n-1, 5));
}

int main()
{
	//demoHeapSort();
	//d.reset();
	//demoQuickSort();
	//d.reset();
	//quickSortCompAvg();
	//d.reset();
	//quickSortCompWorst();
	//d.reset();
	//quickSortCompBest();
	//d.reset();
	//avgHeapQuick();
	//quickSortCompAvgBestWorst();
	//d.reset();
	//demoQuickSortHibrid();
	//d.reset();
	//quickSortHibridComp();
	//d.reset();
	//quickSortVsQuickSortHibrid();
	//d.reset();
	//quickSortVsQuickSortHibridOP();
	
	//demoQuickSelect();
	return 0;
}
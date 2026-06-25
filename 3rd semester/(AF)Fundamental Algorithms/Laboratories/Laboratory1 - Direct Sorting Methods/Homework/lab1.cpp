#include <stdio.h>
#include "Profiler.h"
#include <array>

Profiler d("sortari");

#define MAX_SIZE 9000
#define NR_TESTE 5
#define NR_PASI 100

void swap(int* a, int* b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
}

void bubble_sort_optimizat(int a[], int n)
{

	Operation nrComp = d.createOperation("bSortComp", n);
	Operation nrAtr = d.createOperation("bSortAtr", n);

	for (int i = 0; i < n-1; i++)
	{

		boolean continuee = false;
		for (int j = 0; j < n-1-i; j++) 
		{
			nrComp.count();
			if (a[j] > a[j + 1])
			{
				nrAtr.count(3);
				swap(&a[j], &a[j + 1]);
				continuee = true;
			}
		}
		if (continuee == false)
			break;
	}
}


void insertion_sort(int a[], int n)
{
	Operation atrCnt = d.createOperation("insSortAtr", n);
	Operation cmpCnt = d.createOperation("insSortComp", n);

	for (int i = 1; i < n; i++)
	{
		atrCnt.count();
		int key = a[i];

		int j = i - 1;

		cmpCnt.count();
		while (j >= 0 && a[j] > key)
		{
			atrCnt.count();
			a[j + 1] = a[j];
			j -= 1;	
		}
		atrCnt.count();
		a[j + 1] = key;
	}
}


void selection_sort(int a[], int n)
{
	Operation atrCnt = d.createOperation("selSortAtr", n);
	Operation cmpCnt = d.createOperation("selSortComp", n);

	for (int i = 0; i < n; i++)
	{
		int imin = i;
		for (int j = i + 1; j < n; j++)
		{
			cmpCnt.count();
			if (a[j] < a[imin])
				imin = j;
			
		}
		if (imin != i)
		{
			atrCnt.count(3);
			swap(&a[i], &a[imin]);
		}
	}
}


void demo()
{

	int v[] = {5,2,3,8,1,9,4 };
	int n = sizeof(v) / sizeof(v[0]);
	bubble_sort_optimizat(v, n);
	for (int i = 0; i < n; i++)
		printf("%d ", v[i]);
	printf("\n");
	int d[] = {5,2,3,8,1,9,4 };
	insertion_sort(d, n);
	for (int i = 0; i < n; i++)
		printf("%d ", d[i]);
	printf("\n");
	int x[] = {5,2,3,8,1,9,4};
	selection_sort(x, n);
	for (int i = 0; i < n; i++)
		printf("%d ", x[i]);
}


void perfAvg()
{
	int v1[MAX_SIZE];
	int v2[MAX_SIZE];
	int v3[MAX_SIZE];
	for (int i = NR_PASI; i < MAX_SIZE; i += NR_PASI)
	{
		for (int j = 0; j < NR_TESTE; j++) // fac 5 teste pe fiecare array
		{
			FillRandomArray(v1, i); // facem random array de 100 elemente,200 el...pana la 10k,caz mediu e asta
			memcpy(v2, v1, sizeof(v1));
			memcpy(v3, v1, sizeof(v1));
			bubble_sort_optimizat(v1, i);
			insertion_sort(v2, i);
			selection_sort(v3, i);
		}
	}
	d.divideValues("bSortComp", NR_TESTE);
	d.divideValues("bSortAtr", NR_TESTE);
	d.divideValues("insSortComp", NR_TESTE);
	d.divideValues("insSortAtr", NR_TESTE);
	d.divideValues("selSortComp", NR_TESTE);
	d.divideValues("selSortAtr", NR_TESTE);
	d.addSeries("bSortTotal", "bSortAtr", "bSortComp");
	d.addSeries("insSortTotal", "insSortAtr", "insSortComp");
	d.addSeries("selSortTotal", "selSortAtr", "selSortComp");
	d.createGroup("avgAtr", "bSortAtr", "insSortAtr", "selSortAtr");
	d.createGroup("avgCmp", "bSortComp", "insSortComp", "selSortComp");
	d.createGroup("avgTotal", "bSortTotal", "insSortTotal", "selSortTotal");
	d.showReport();

}

void perfBest()
{
	int v1[MAX_SIZE];
	int v2[MAX_SIZE];
	int v3[MAX_SIZE];
	for (int i = NR_PASI; i < MAX_SIZE; i += NR_PASI)
	{
			FillRandomArray(v1, i, 10, 50000, false, 1); // caz best, sortat crescator deja
			FillRandomArray(v2, i, 10, 50000, false, 1);
			FillRandomArray(v3, i, 10, 50000, false, 1);
			bubble_sort_optimizat(v1, i);
			insertion_sort(v2, i);
			selection_sort(v3, i);
	}

	d.addSeries("bSortTotal", "bSortAtr", "bSortComp");
	d.addSeries("insSortTotal", "insSortAtr", "insSortComp");
	d.addSeries("selSortTotal", "selSortAtr", "selSortComp");
	d.createGroup("bestAtr", "bSortAtr", "insSortAtr", "selSortAtr");
	d.createGroup("bestCmp", "bSortComp", "insSortComp", "selSortComp");
	d.createGroup("bestTotal", "bSortTotal", "insSortTotal", "selSortTotal");
	d.showReport();

	

}

void perfWorst()
{
	int v1[MAX_SIZE];
	int v2[MAX_SIZE];
	int v3[MAX_SIZE];
	for (int i = NR_PASI; i < MAX_SIZE; i += NR_PASI)
	{
			FillRandomArray(v1, i, 10, 50000, false, 2);
			FillRandomArray(v2, i, 10, 50000, false, 2);
			FillRandomArray(v3, i, 10, 50000, false, 2);//caz worst, sortat descrescator
			bubble_sort_optimizat(v1, i);
			insertion_sort(v2, i);
			selection_sort(v3, i);
	}

	d.addSeries("bSortTotal", "bSortAtr", "bSortComp");
	d.addSeries("insSortTotal", "insSortAtr", "insSortComp");
	d.addSeries("selSortTotal", "selSortAtr", "selSortComp");
	d.createGroup("worstAtr", "bSortAtr", "insSortAtr", "selSortAtr");
	d.createGroup("worstCmp", "bSortComp", "insSortComp", "selSortComp");
	d.createGroup("worstTotal", "bSortTotal", "insSortTotal", "selSortTotal");
	d.showReport();
}

int main()
{
	//demo();
	perfAvg();
	perfBest();
	perfWorst();
	return 0;
}
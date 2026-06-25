#include <stdio.h>
#include <stdlib.h>
#include "Profiler.h"
#include <string.h>

#define maxSize 9973


typedef struct
{
	int id;
	char name[30];
	int status;
}hash;

enum { liber, ocupat, sters };

int hashing(int id, int n)
{
	return id % n;
}


void initLiber(hash* h, int n)
{
	for (int i = 0; i < n; i++)
		h[i].status = liber;
}


void quadraticProbingInsert(hash* h, int id, int n, const char name[])
{
	int index = hashing(id, n);
	int slotLiber = -1;

	for (int i = 0; i < n; i++)
	{
		int index2 = (index + i * i) % n;

		if (h[index2].status == ocupat && h[index2].id == id)
			return;

		if ((h[index2].status == liber || h[index2].status == sters) && slotLiber == -1)
			slotLiber = index2;
	}

	if (slotLiber != -1)
	{
		h[slotLiber].id = id;
		h[slotLiber].status = ocupat;
		strcpy_s(h[slotLiber].name, sizeof(h[slotLiber].name), name);
	}
	else
		return;
}


void delKey(hash* h, int id, int n)
{
	int index = hashing(id, n);
	if (h[index].status == ocupat && h[index].id == id)
		h[index].status = sters;
	else
	{
		for (int i = 0; i < n; i++)
		{
			int index2 = (index + i * i) % n;
			if (h[index2].status == ocupat && h[index2].id == id)
			{
				h[index2].status = sters;
				break;
			}
		}
	}
}

int cautare(hash* h, int n, int id)
{
	int celuleAccesate = 0;
	int index = hashing(id, n);
	if (h[index].status == ocupat && h[index].id == id)
	{
		celuleAccesate++;
		//printf("%s\n", h[index].name);
	}
	else
	{
		for (int i = 0; i < n; i++)
		{
			celuleAccesate++;
			int index2 = (index + i * i) % n;
			if (h[index2].status == liber)
			{
				//printf("negasit\n");
				break;
			}
			if (h[index2].status == ocupat && h[index2].id == id)
			{
				//printf("%s\n ", h[index2].name);
				break;
			}
		}
	}
	return celuleAccesate;
}


void demo()
{
	int m = 13;
	hash* h = (hash*)malloc(m * sizeof(hash));
	initLiber(h, m);
	quadraticProbingInsert(h, 3, m, "elena");
	quadraticProbingInsert(h, 5, m, "marius");
	quadraticProbingInsert(h, 8, m, "marina");
	quadraticProbingInsert(h, 5, m, "mihai");
	cautare(h, m, 5);
	cautare(h, m, 3);
	cautare(h, m, 2);
	delKey(h, 5, m);
	cautare(h, m, 5);
	quadraticProbingInsert(h, 5, m, "alina");
	cautare(h, m, 5);
}

void avg99()
{
	int a[maxSize];
	int factUmpl = (99 * maxSize) / 100;
	hash* h = (hash*)malloc(maxSize * sizeof(hash));
	initLiber(h, maxSize);
	FillRandomArray(a, factUmpl, 10, 10000, true);
	for (int i = 0; i < factUmpl; i++)
	{
		quadraticProbingInsert(h, a[i], maxSize, "andrei");
	}
	int m = 3000;
	int maxGasite = 0, maxNegasite = 0;
	int avgGasite = 0, avgNegasite = 0;
	for (int test = 0; test < 5; test++)
	{
		int j = 10, p = factUmpl;
		for (int i = 0; i < m / 2; i++)
		{
			int gasite = cautare(h, maxSize, j);
			int negasite = cautare(h, maxSize, p);
			avgGasite = avgGasite + gasite;
			avgNegasite = avgNegasite + negasite;
			if (maxNegasite < negasite)
				maxNegasite = negasite;
			if (maxGasite < gasite)
				maxGasite = gasite;
			j++;
			p++;
		}
	}

	avgGasite = avgGasite / (5 * m / 2);
	avgNegasite = avgNegasite / (5 * m / 2);
	printf("Factor de umplere: %d%, avg effort gasite: %d, avg effort negasite: %d, max ef gasite: %d, max ef negasite: %d\n", 99, avgGasite, avgNegasite, maxGasite, maxNegasite);
	free(h);
}



void avgRestu()
{
	for (int c = 80; c < 100; c = c + 5)
	{
		int a[maxSize];
		int factUmpl = (c * maxSize) / 100;
		hash* h = (hash*)malloc(maxSize * sizeof(hash));
		initLiber(h, maxSize);
		FillRandomArray(a, factUmpl, 10, 9600, true);
		for (int i = 0; i < factUmpl; i++)
		{
			quadraticProbingInsert(h, a[i], maxSize, "andrei");
		}
		int m = 3000;
		int maxGasite = 0, maxNegasite = 0;
		int avgGasite = 0, avgNegasite = 0;
		for (int test = 0; test < 5; test++)
		{
			int j = 10, p = factUmpl;
			for (int i = 0; i < m / 2; i++)
			{
				int gasite = cautare(h, maxSize, j);
				int negasite = cautare(h, maxSize, p);
				avgGasite = avgGasite + gasite;
				avgNegasite = avgNegasite + negasite;
				if (maxNegasite < negasite)
					maxNegasite = negasite;
				if (maxGasite < gasite)
					maxGasite = gasite;
				j++;
				p++;
			}
		}

		avgGasite = avgGasite / (5 * m / 2);
		avgNegasite = avgNegasite / (5 * m / 2);
		printf("Factor de umplere: %d%, avg effort gasite: %d, avg effort negasite: %d, max ef gasite: %d, max ef negasite: %d\n", c, avgGasite, avgNegasite, maxGasite, maxNegasite);
		free(h);
	}
}


void stergereDemo()
{
	int a[maxSize];
	hash* h = (hash*)malloc(maxSize * sizeof(hash));
	initLiber(h, maxSize);
	FillRandomArray(a, 9900, 10, 9910, true);
	for (int i = 0; i < 9900; i++)
	{
		quadraticProbingInsert(h, a[i], maxSize, "andrei");
	}
	int m = 3000;
	int maxGasite = 0, maxNegasite = 0;
	int avgGasite = 0, avgNegasite = 0;
	for (int i = 10; i < 2010; i++)
	{
		delKey(h, i, maxSize);
	}
	for (int test = 0; test < 5; test++)
	{
		int j = 9511;
		int p = 2010;
		for (int i = 0; i < m / 2; i++)
		{
			int gasite = cautare(h, maxSize, j);
			int negasite = cautare(h, maxSize, p);
			avgGasite = avgGasite + gasite;
			avgNegasite = avgNegasite + negasite;
			if (maxNegasite < negasite)
				maxNegasite = negasite;
			if (maxGasite < gasite)
				maxGasite = gasite;
			j++;
			p++;
		}
	}
	avgGasite = avgGasite / (5 * m / 2);
	avgNegasite = avgNegasite / (5 * m / 2);
	printf("Factor de umplere: %d%, avg effort gasite: %d, avg effort negasite: %d, max ef gasite: %d, max ef negasite: %d\n", 99, avgGasite, avgNegasite, maxGasite, maxNegasite);
	free(h);
	
}


int main()
{
	//demo();
	avg99();
	avgRestu();
	stergereDemo();
	return 0;
}

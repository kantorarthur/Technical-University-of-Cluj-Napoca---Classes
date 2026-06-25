#include <stdio.h>
typedef struct{
	int s, f; //timpii de start si final
	char nume[100]; //denumire
}activitate;
activitate activitati[100];


void select_activitati(int x[], int* nr_activitati,int n){
        //se selecteaza activitatile conform strategiei greedy
        //x[i] contine numere 0:n-1
        //x[i] = k, inseamna ca am selectat activitatea k
        //nr_activitati se modifica
        x[0] = 0;
        *nr_activitati=1;
        for(int i=0;i<n-1;i++)
        {
            for(int j=i+1;j<n;j++)
            {
                if(activitati[i].f>activitati[j].f)
                    {
                        activitate temp=activitati[i];
                        activitati[i]=activitati[j];
                        activitati[j]=temp;
                    }
            }
        }
        int ultim_select=0;
        for(int i=1;i<n;i++)
        {
            if(activitati[ultim_select].f <= activitati[i].s)
            {
                x[*nr_activitati]=i;
                (*nr_activitati)++;
                ultim_select=i;
            }

        }
    }

void afisare(int x[], int nr_activitati){
	printf("Am selectat %d activitati\n", nr_activitati);
	for (int i = 0; i < nr_activitati; i++){
		printf("(%2d) %2d : %2d %s", x[i], activitati[x[i]].s, activitati[x[i]].f, activitati[x[i]].nume);
	}
}

int main(){
	FILE* f = fopen("date_activitati.txt", "r");
	int n;
	fscanf(f,"%d", &n);
	for (int i = 0; i < n; i++){
		fscanf(f,"%d%d", &activitati[i].s, &activitati[i].f);
		fgets(activitati[i].nume, 100, f);
	}
	fclose(f);

	int x[100]={};
	int nr_activitati = 0;
	select_activitati(x, &nr_activitati,n);
	afisare(x, nr_activitati);
	return 0;
}

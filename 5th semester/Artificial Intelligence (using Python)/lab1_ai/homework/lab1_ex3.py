#Lab 1 EX 3
#Ai o lista. Fa suma primelor n-2 elemente

n = 10

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
lista_elemente_bune = lista[ :(n - 2)]

suma = 0
for element_curent in lista_elemente_bune:
    suma += element_curent
print(suma)

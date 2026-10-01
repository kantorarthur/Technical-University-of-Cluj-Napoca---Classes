#Lab 1 EX 5
#Ai o lista de numere. Gaseste minimul listei fara sa folosesti functie
#standard

lista = [3, -25, -3, 0, -1, 150]

min = 2 ** 32 - 1

for elem_curent in lista:
    if elem_curent < min:
        min = elem_curent

print(min)

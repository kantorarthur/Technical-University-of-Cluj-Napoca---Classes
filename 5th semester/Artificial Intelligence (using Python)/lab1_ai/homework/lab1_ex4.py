#Lab 1 EX 4
#Ai o lista. Creeaza o noua lista care sa contina elementele de pe pozitii pare ale listei initiale

lista = [0, 1, 2, 3, 4]

lista_pare = []

for index, elem_curent in enumerate(lista):
    if index % 2 == 0:
        lista_pare.append(elem_curent)
print(lista_pare)

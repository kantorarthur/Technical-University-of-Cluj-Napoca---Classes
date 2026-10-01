#Lab 1 ex 2 
#Ai o lista de numere - creeaza doua liste: LISTA 1 - are toate nr pozitive din liste initiala
#                                           LISTA 2 - are toate nr negative din lista initiala


lista = [-3, 30, 25, -2, -30]
lista_elemente_pozitive = []
lista_elemente_negative = []


for element_curent in lista:
    if element_curent < 0:
        lista_elemente_negative.append(element_curent)
    else:
        lista_elemente_pozitive.append(element_curent)

print(lista_elemente_negative)
print(lista_elemente_pozitive)

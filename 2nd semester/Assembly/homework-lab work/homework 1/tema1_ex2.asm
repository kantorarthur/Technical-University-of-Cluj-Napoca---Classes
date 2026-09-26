.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
	y DB 9
	z DB 13
.code
start:
	;((y si 19) sau BL) si ((BH si AH) shiftat stanga cu 2 poz)) sau (z shiftat stanga cu 4 poz)
	mov AH,5 ; initializez AH cu o valoare(5 in cazu asta)
	mov BH,7 ; initializez BH cu o valoare(7 in cazu asta)
	mov BL,13; initializez BL cu o valoare ( 13 in cazu asta)
	mov AL,y
	and AL,19
	or AL,BL ; acum in AL am operatia (y si 19) sau BL
	and BH,AH ; acum in BH am BH si AH
	shl BH,2 ; acum in BH am BH si AH shiftat cu 2 poz
	mov CH, z
	shl CH, 4; acum in CH am z shiftat cu 4 poz in stanga
	or BH,CH ; acum in BH am BH si AH shiftat cu 2 poz sau z shiftat cu 4 poz
	and AL,BH ; aici am operatia finala in AL
	call exit
	end start
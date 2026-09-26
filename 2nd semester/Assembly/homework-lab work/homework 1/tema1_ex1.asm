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
	b DW 5
	x DW 2
.code
start:
	;14*b+x^2
	mov AX,14 ; pun 14 in AX ca sa inmultesc pe b cu 14
	mul b ; inmultesc pe 14 cu b
	mov BX,AX ; salvez 14*b in BX
	mov AX,x ; salvez X in AX ca sa fac x*x
	mul x
	add AX,BX
	call exit
	end start
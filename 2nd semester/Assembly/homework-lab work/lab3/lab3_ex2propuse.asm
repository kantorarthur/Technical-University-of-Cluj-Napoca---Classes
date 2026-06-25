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
rez DW 0
num1 DW 3
num2 DW 4
.code
start:
	;rez=AX*num1+num2*(AX+BX)
	mov AX,2
	mov BX,3
	mov CX,AX ;salvez valoarea lui AX in CX fiindca o sa am nevoie de AX mai tarziu pentru inmultire
	add AX,BX
	mul num2 ; acum in AX am num2*(AX+BX)
	mov BX,AX ; acum in BX am num2*(AX+BX)
	mov AX,CX ;am luat valoarea initiala al lui AX 
	mul num1 ; acum in BX am num2*(AX+BX) iar in AX am num1*AX
	add AX,BX
	mov rez,AX
	push 0
	call exit
	end start
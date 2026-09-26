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
	x DD 11
	y DD 15
.code
start:
	;(x/EDX+y)*(x-5/x*(4+ESI-EAX^3))
	mov EDX,4 ; il initializez pe EDX cu o valoare(5 acum)
	mov ESI, 10 ; il initializez pe ESI cu cu o valoare(5 acum)
	mov EAX, 17 ; il initializez pe EAX cu o valoare(2 acum)
	mov ECX, EAX ; salvez valoarea initiala al lui EAX in ECX
	mov EBX,EDX 
	mov EAX,x
	mov EDX,0
	div EBX ; deci aici am x/EDX, am bagat EDX in EBX deoarece EDX este folosit si in operatia DIV si se poate ajunge la complicatii
	add EAX, y 
	push EAX ;acum am pus operatia x/EDX+y in stiva
	mov EAX,5
	mov EDX,0
	div x; acum in EAX am 5/x
	mov EDI, EAX ; acum in EDI am 5/x
	add ESI, 4 ;in ESI am 4+ESI
	mov EAX,ECX ; iau valoarea initiala al lui EAX
	mul EAX
	mul EAX ; aici am EAX^3
	sub ESI,EAX ; acum in ESI am 4+ESI-EAX^3
	mov EAX, ESI ; acum in EAX am 4+ESI-EAX^3 
	mul EDI ; in EAX am acum 5/x*(4+ESI-EAX^3)
	mov ECX, x
	sub ECX,EDI ; acum in ECX am x-5/x*(4+ESI-EAX^3)
	pop EAX ; iau in EAX operatia x/EDX+y
	mul ECX ; acum in EAX am toata operatia
	call exit
	end start
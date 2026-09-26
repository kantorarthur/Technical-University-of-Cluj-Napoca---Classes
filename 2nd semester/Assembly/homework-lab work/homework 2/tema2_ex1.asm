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
	x DW 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48; sirul initial
	y DW 50 DUP(?) ;sirul in care copiez
.code
start:
	mov ecx, 0 ; asta este i-ul nostru
	mov edx, 2 ; asta o sa il folosesc pe post de index la sir 1
	mov ebx, 0 ; asta o sa fie indexul pt sirul in care copiez
	
	
	loop_start:
	cmp ecx,49 		; compar i cu 49
	jge loop_end 		; daca i mai mare sau egal cu 49, ies din bucla
	
	mov ax, x[edx]
	cmp ax,0 		; aici verific daca numarul meu este pozitiv
	jl sarim
	
	mov bx,x[edx-2]
	cmp bx,-122 		; aici verific daca predecesorul face parte din interval
	jle sarim
	
	cmp bx,122 		; aici verific daca predecesorul face parte din interval
	jge sarim
	mov ax,x[edx]
	mov y[ebx],ax 		; daca toate conditiile sunt indeplinite, copiez din sirul 1 in sirul 2
	add ebx,2 		; aici adaug 2 octeti la sirul in care copiez doar daca sunt indeplinite condiitile
	sarim:
	add edx,2
	inc ecx
	jmp loop_start
	
	loop_end:
	
	call exit
	end start
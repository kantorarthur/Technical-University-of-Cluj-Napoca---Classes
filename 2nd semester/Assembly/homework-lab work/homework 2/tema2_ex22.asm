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
	a DD 11
	y DD 13
.code
start:
	mov ecx,2 ; asta este j
	mov EBP,0 ; in EBP o sa fac adunarea
	start_loop:
	cmp ecx,20
	jg end_loop
	mov EBX,9;initializez EBX
	mov EDI,3;INITIALIZEZ EDI
	mov EDX,5;initializez EDX
	mov ESI,EDX ; bag EDX in ESI fiindca o sa am nevoie pt div de EDX
	mov ESP,edx ; esp o sa fie pe post de putere
	mov EAX,EDI 
	mov EDX,0
	div ecx ; acum in EAX am edi/j
	sub ESI, a ; acum in ESI am EDX-a
	mul ESI ; in eax am EDI/j*(EDX-a)
	mov edx,0
	div ebx ; acum in EAX am toata partea din stanga
	mov ebx,eax ; am pus in ebx ce am in eax
	mov ESI,1
	mov EAX,y
	putere:
	cmp ESI,ESP
	jge continua
	mov edi,y
	mul edi
	inc esi
	jmp putere
	continua:
	;acum in eax am y^edx
	mov edx,0
	div ecx ; acum in eax am partea din stanga
	mul ebx ; in ebx am toata operatia
	add EBP,ebx ; fac suma
	inc ecx
	jmp start_loop
	end_loop:
	mov eax,EBP
	
	call exit
	end start
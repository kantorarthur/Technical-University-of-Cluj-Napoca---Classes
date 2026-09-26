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
	a DD 3
	y DD 19
.code
start:
	mov EBX,7 ;initializez ebx cu o valoare
	mov EDI,13 ; initializez edi cu o valoare
	mov EDX,5 ; initializez edx cu o valoare
	mov ECX,2 ; asta este j
	mov ESI,EDX ; mut edx in esi fiindca de EDX voi avea nevoie pt impartire
	mov ESP,EDX ; aici voi folosi EDX pe post de putere
	mov EBP,0 ; aici voi tot aduna suma
	
	
	start_loop:
	cmp ecx,20
	jg end_loop
	mov eax,edi
	mov edx,0
	div ecx ; acum in eax am edi/j
	sub esi, a ; in esi am edx-a
	mul esi ; acum in eax am edi/j*(edx-a)
	mov edx, 0
	div ebx ;acum in eax am edi/j*(edx-a)/ebx
	mov ebx,eax ; acum in ebx am operatia de mai sus
	mov esi,1
	putere:
	cmp esi,ESP
	jge continua
	mov edi,y
	mul edi
	inc esi
	jmp putere
	continua:
	;acum in eax am y^edx
	mov edx,0
	div ecx ; acum in eax am y^edx/j
	mul ebx ; acum in eax am toata operatia
	add EBP,eax ; aici este suma operatiei
	;acum o sa initializez iar toti registrii cu valoriile initiale
	mov ebx,7
	mov edi,13
	mov edx,5
	mov esi,edx
	mov esp,edx
	inc ecx
	jmp start_loop
	end_loop:
	mov eax,ebp
	call exit
	end start
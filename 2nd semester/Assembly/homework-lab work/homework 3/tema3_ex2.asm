.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern scanf: proc
extern printf: proc

include functie.asm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
	format db "%d", 0
	nr dd 0
	max dd 0
.code
start:
	mov esi, offset nr
	push esi
	push offset format
	call scanf ; citesc nr
	add esp,8 ; curat stiva
	mov esi, offset max
	push esi
	push offset format
	call scanf
	add esp,8
	mov ebx,3
	mov ecx, 2
	puter ebx,ecx ; ebx^ecx (3^2)
	
	mov ecx,0 ; asta e i
	mov ebx,[nr]
	mov edx,[max]
	afisare:
	puter ebx,ecx
	cmp eax,edx
	jg final
	push eax
	push offset format
	call printf
	add esp,8
	inc ecx
	jmp afisare
	final:
	call exit
	end start
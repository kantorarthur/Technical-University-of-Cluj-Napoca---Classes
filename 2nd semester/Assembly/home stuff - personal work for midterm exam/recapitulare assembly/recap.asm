.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern scanf: proc
extern printf: proc
extern fopen: proc
extern fscanf: proc
extern fclose: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data

mod_citire db "r",0
nume_fis db "in.txt", 0
pointer_fis dd 0
v db 10 dup(0)
format db "%s",0
car dd "e",0

.code
start:
	push offset mod_citire
	push offset nume_fis
	call fopen
	add esp,8
	mov pointer_fis,eax
	
	
	push offset v
	push offset format
	push pointer_fis
	call fscanf
	add esp,12
	
	push pointer_fis
	call fclose
	add esp,4
	
	mov esi, 0
	mov ecx,car
	mov ebp,2
	mov edx, ''
	
	lea eax,v
	
	loop_start:
	cmp esi,5
	jg loop_end
	add byte ptr [eax+esi],2
	cmp byte ptr [eax+esi], ecx
	jne termin
	mov [eax+esi], edx
	termin:
	inc esi
	jmp loop_start
	loop_end:
	
	push eax
	push offset format
	call printf
	add esp,8
	
	push 0
	call exit
end start

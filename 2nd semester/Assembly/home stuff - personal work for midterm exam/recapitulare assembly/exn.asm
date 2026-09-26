.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern fscanf: proc
extern fopen: proc
extern printf: proc
extern fclose:proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
nume_fis db "in.txt",0
format_open db "r",0
pointer_fis dd 0
format db "%s",0

v dd 20 dup(0)

.code
start:
	push offset format_open
	push offset nume_fis
	call fopen
	add esp,8
	mov pointer_fis, eax
	
	push offset v
	push offset format
	push pointer_fis
	call fscanf
	add esp,12

	
	push pointer_fis
	call fclose
	add esp,4
	
	lea eax,v
	
	mov esi, 0
	loop_start:
	mov bl, byte ptr [eax+esi]
	cmp bl,0
	jle loop_end
	add bl,2
	mov byte ptr[eax+esi],bl
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

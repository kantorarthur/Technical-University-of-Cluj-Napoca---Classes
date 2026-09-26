.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern fopen: proc
extern fclose: proc
extern fscanf: proc
extern printf:proc
extern scanf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
nume_fis db "in.txt",0
format_read db "r",0
v db 20 dup(0)
car db 0
format db "%s",0
format2 db "%c",0
pointer_fis dd 0
.code
start:
	push offset format_read
	push offset nume_fis
	call fopen
	add esp,8
	mov pointer_fis,eax
	
	push offset v
	push offset format
	push pointer_fis
	call fscanf
	add esp,12
	
	push offset car
	push offset format2
	call scanf
	add esp,8
	
	push pointer_fis
	call fclose
	add esp,4
	
	lea eax,v
	mov esi,0
	
	
	loop_start:
	mov bl, byte ptr [eax+esi]
	cmp bl,0
	jle loop_end
	add bl, 2
	cmp bl, [car]
	jne repet
	mov bl,'+'
	mov byte ptr [eax+esi],bl
	inc esi
	jmp loop_start
	repet:
	mov byte ptr [eax+esi],bl
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

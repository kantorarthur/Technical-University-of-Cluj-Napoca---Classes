.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern fopen: proc
extern fclose: proc
extern fscanf: proc
extern fprintf: proc
extern printf: proc
extern scanf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
;aici declaram date
nume_fis db "in.txt",0
format_open db "r",0
pointer_fis dd 0
v db 30 dup(0)
format db "%s",0
nume_fiso db "out.txt",0
format_openo db "w",0
pointer_fis2 dd 0
.code
start:
	push offset format_open
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
	
	
	

	push offset format_openo
	push offset nume_fiso
	call fopen
	add esp,8
	mov pointer_fis2,eax
	
	
	lea eax, v
	mov esi,0
	start_loop:
	mov bl, byte ptr[esi+eax]
	cmp bl,0
	jle loop_end
	add bl,2
	mov byte ptr[esi+eax],bl
	inc esi
	jmp start_loop
	loop_end:
	
	
	
	
	
	
	
	
	push eax
	push offset format
	push pointer_fis2
	call fprintf
	add esp,12
	
	push pointer_fis2
	call fclose
	add esp,4
	
	
	
	
	
	
	push 0
	call exit
end start

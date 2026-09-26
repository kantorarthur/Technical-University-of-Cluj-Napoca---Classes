.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern fopen: proc
extern fscanf: proc
extern scanf: proc
extern printf: proc
extern fclose: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


.data

mod_citire db "r",0
nume_fisier db "fisier.txt", 0
pointer_fis dd 0
format db "%d",0
n dd 0
m dd 0
V dd 10 dup(0)
.code

functie proc
	
	mov eax,[n]
	mov ebx,[m]
	mov esi, 1
	
	loop_start:
	cmp n,0 
	jle loop_end
	mov edx, 0
	mov eax, [n]	
	div 10 ; acum in edx am ultima cifra numarului numarului n 
	cmp edx,[m]
	jle reincep
	mov [V+EDX*4],1 
	reincep:
	inc edx
	jmp loop_start
	loop_end:
	ret
	functie endp





start:
	push offset mod_citire
	push offset nume_fisier
	call fopen
	add esp, 8
	mov pointer_fis,eax
	
	push offset n
	push offset format
	push offset pointer_fis
	call fscanf
	add esp,12
	
	push offset m
	push offset format
	call scanf
	add esp, 8
	
	push pointer_fis
	call fclose
	add esp,4
	
	
	
	push 0
	call exit
end start

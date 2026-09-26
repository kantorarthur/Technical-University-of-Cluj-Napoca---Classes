.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern fopen:proc
extern fclose: proc
extern fscanf: proc
extern scanf: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
open_mode db "r",0
nume_fis db "in.txt",0
pointer_fis dd 0
v dd 10 dup(0)
n dd 0
m dd 0
format dd "%d",0		
.code

functie proc
		; in ebp o sa am m, in eax n iar in ecx v
		loop_st:
		mov edi,10
		mov edx,0
		div edi ; acum in edx am ultima cifra al lui n 
		cmp edx, 0
		je loop_end
		cmp edx, ebp
		
		
		
		
		ret
functie endp		
		
		
start:
	push offset open_mode
	push offset nume_fis
	call fopen
	add esp,8
	mov pointer_fis, eax
													
	push offset n
	push offset format
	push pointer_fis
	call fscanf
	add esp, 12
	
	push offset m
	push offset format
	call scanf
	add esp,8
	
	lea eax,v
	
	mov esi, 0
	
	loop_start:
	cmp esi, 10
	jge loop_end
							
	
	
	
	
	
	
	
	
	push 0
	call exit
end start

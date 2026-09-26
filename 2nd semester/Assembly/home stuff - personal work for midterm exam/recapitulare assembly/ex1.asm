.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern scanf: proc
extern printf: proc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;sectiunile programului, date, respectiv cod
.data
;aici declaram date



 n dd 0
 a dd 0
 x dd 0
 format db "%d", 0
 
.code

putere proc
	mov eax,ecx
	add eax,edx
	mul eax
	ret ; acum in eax am (a+b)^2
putere endp
start:
	
	
	
	
	push offset n
	push offset format
	call scanf
	add esp,8
	
	push offset a
	push offset format
	call scanf
	add esp,8
	
	push offset x
	push offset format
	call scanf
	add esp,8
	
	mov esi, 1 ; asta o sa fie k
	mov ebp, 0
	loop_start:
	cmp esi,n
	jg loop_end
	
	mov eax, esi
	mul [x] ; acum in eax am k*x
	mov ebx,eax ; acum in ebx am k*x
	
	mov ecx, [a]
	mov edx, [x]
	call putere
	;acum in eax am (a+x)^2
	sub ebx, eax
	; acum in ebx am toata partea de sus
	mov edx, 0
	mov eax, ebx
	cdq
	idiv [a] ; acum in eax am toata operatia
	add ebp, eax ; in ebp am rez final
	inc esi
	jmp loop_start
	loop_end:
	
	push ebp
	push offset format
	call printf
	add esp,8
	
	
	
	
	
	push 0
	call exit
end start



.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
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
	format db "%d", 0
	A dd 5 dup(0) ; vector cu 5 elem
	B dd 5 dup(0)
.code

	maxim proc
    push ebp
    mov ebp, esp

    mov esi, [ebp + 8]     ; adresa vectorului v
    mov ecx, [ebp + 12]    ; nr de elemente

    mov eax, [esi]         ; initializez eax cu primul elem
    add esi, 4             ; trec la urmatoru elem
    dec ecx                

	loop1:
    cmp ecx, 0
    je done1

    mov edx, [esi]         ; elementul curent
    cmp edx, eax
    jle skip1
    mov eax, edx           ; actualizez maximul daca e mai mare
	skip1:
    add esi, 4
    dec ecx
    jmp loop1
	done1:
    pop ebp
    ret
	maxim endp


start:
	mov ecx,5 ; fac asta ca sa citesc 5 numere in sirul a cu loop
	mov esi, offset A ; aici e adresa primului element
	citesc1:
	cmp ecx,0
	je urm
	push esi ; trimit adresa elementului din vector
	push offset format
	call scanf
	add esp,8
	add esi,4 ; adaug 4 ca sa merg la elementul urmator din vector
	dec ecx
	jmp citesc1
	
	urm:
	
	
	mov ecx,5
	mov esi, offset B
	citesc2:
    cmp ecx,0
	je urm1
	push esi
	push offset format
	call scanf
	add esp,8
	add esi,4
	dec ecx
	jmp citesc2
	
	urm1:
	push 5
	push offset A
	call maxim
	add esp,8
	
	mov edx,eax
	
	push 5
	push offset B
	call maxim
	add esp,8
	cmp eax,edx
	jge salvez
	mov eax,edx ; daca eax ii mai mic decat edx, bag edx in eax
	salvez: ; inseamna ca eax e mai mare, acum am maximul in eax
	mov edx,0

	afisare_sir:
	cmp edx,eax
	jg termin ; verific daca edx a ajuns peste maxim
	
	
	mov ecx,5 ; caut de 5 ori in sir (sirul e de 5 elem)
	mov esi,offset A ; adresa primul element din a
	
	
	caut_A:
	cmp edx, [esi] ; vad daca exista elementul de la 0 la maxim in primul sir
	je afisezA
	add esi,4
	loop caut_A
	
	mov ecx,5 ; la fel ca sus
	mov esi,offset B
	
	caut_B:
	cmp edx, [esi] ; ca mai sus dar in sir 2
	je afisezB
	add esi,4
	loop caut_B
	
	jmp final
	afisezA:
	push edx
	push offset format
	call printf
	add esp,8
	jmp final
	afisezB:
	push edx
	push offset format
	call printf
	add esp,8
	jmp final
	final:
	add edx,1
	jmp afisare_sir
	termin:

	call exit
	end start
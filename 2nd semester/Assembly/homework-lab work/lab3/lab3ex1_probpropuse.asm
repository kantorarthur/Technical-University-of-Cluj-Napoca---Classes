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

.code
start:
;formula : EAX=7*eax-2*ebx-ebx/8
	mov eax,3
	mov ebx,2
	mov edi,eax
	imul edi,7
	mov eax,0
	imul ebx,2
	mov ecx,ebx ;aici am 2*ebx
	mov esi, 2
	mov edx,0
	mov eax,ebx
	div esi
	mov esi,8
	div esi
	mov esi,eax
	mov eax,edi
	sub eax,ecx
	sub eax,esi
	;DE RETINUT!! CAND FOLOSEC 'DIV' PRACTIC SE IMPARTE VALOARE DIN EAX CU VALOAREA PE CARE O SPUN, EX: DIV EBX O SA FACA EAX/EBX SI VALOAREA SE SALVEAZA IN EAX
	; ASA SE INTAMPLA SI CU MUL, CAND APELEZ MUL PRACTIC FACE EAX * REGISTRUL PE CARE IL ZIC EX; MUL EBX O SA FACA EAX*EBX SI VALOAREA SE SALVEAZA IN EAX
	push 0
	call exit
end start
	
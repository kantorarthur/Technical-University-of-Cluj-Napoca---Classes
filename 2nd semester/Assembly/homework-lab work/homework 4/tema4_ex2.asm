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
	a dq 0.0
	b dq 0.0
	y dq 0.0
	z dq 0.0
	format db "%lf"
	rezultat dq 0.0
	de_scazut dq 4.94
	de_adunat dq 15.07
	rezultat1 dq 0.0
	rezultat2 dq 0.0
	rezultat_fin dq 0.0
.code
start:
	push offset a
	push offset format
	call scanf
	add esp, 8
	
	push offset b
	push offset format
	call scanf
	add esp,8
	
	push offset y
	push offset format
	call scanf
	add esp,8
	
	push offset z
	push offset format
	call scanf
	add esp,8
	
	mov edx,2 ; asta o sa fie j-ul nostru
	
	loop_start:
	cmp edx,10
	jg loop_end
	
	; aici avem (j-4.94)
	finit
	mov eax,edx ; pregatesc prima adunare
	push eax
	fild dword ptr [esp]
	add esp,4 ; am bagat pe stiva fpu  pe j
	fsub qword ptr [de_scazut] ; am facut j-4.94
	fstp qword ptr [rezultat1] ; salvez rezultatul partial (j-4.94)
	;
	
	;aici avem 15.07-z
	finit ;initializez stiva fpu
	fld de_adunat ; bag de adunat pe stiva fpu
	fsub z ; am facut 15.07-z
	fstp rezultat2 ; salvez in rezultat 2
	;
	
	finit
	fld rezultat1
	fadd rezultat2
	fstp rezultat ; acum in rezultat am (j-4.94+15.07-x)
	
	finit
	fld rezultat
	fadd rezultat_fin
	fstp rezultat_fin ; acum in rezultat_fin o sa am toata suma
	
	inc edx
	jmp loop_start
	loop_end:
	
	push dword ptr [rezultat_fin+4]
	push dword ptr [rezultat_fin]
	push offset format
	call printf
	add esp,12
	
	call exit
	end start
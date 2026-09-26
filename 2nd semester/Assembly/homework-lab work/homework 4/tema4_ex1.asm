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
	x dq 0.0
	y dq 0.0
	z dq 0.0
	impartit dq 15.44
	format db "%lf" 
	rezultat dq 0.0
	de_adunat dq 12.18
.code
start:
	push offset x ; citesc x
	push offset format
	call scanf
	add esp,8
	
	push offset y ; citesc y
	push offset format
	call scanf
	add esp,8
	
	push offset z ; citesc z
	push offset format
	call scanf
	add esp,8
	
	
	push offset a ; citesc a
	push offset format
	call scanf
	add esp,8
	
	FINIT
	FLD y ; incarcac y in stiva coprocesor
	FMUL y; y*y
	FMUL y; y*y*y
	FSTP y ; salvez rezultat in y
	
	
	finit
	FLD a ; incarc a in coprocesor
	fcos
	fstp a ; acum in a am cos(a)
	
	finit
	fld y
	fsub a
	fstp rezultat ; acum in rezultat am y^3-cos(a)
	
	finit
	fld x
	fmul impartit
	fstp x ; acum in x am x*15.44
	
	finit
	fld rezultat
	fdiv x ; fac y^3-cos(a)/(15.44*x)
	fstp rezultat ; salvez in rezultat op de mai sus
	
	finit
	fld z
	fadd de_adunat
	fstp z ; acum in z am 12.18+z
	
	finit
	fld rezultat
	fmul z  
	fstp rezultat ; acum i nrezultat am toata operatia
	
	
	
	
	
	
	push dword ptr [rezultat+4] 
	push dword ptr [rezultat]
	push offset format
	call printf ; afisez rezultatul
	add esp, 12
	
	
	call exit
	end start
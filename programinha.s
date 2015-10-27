; Codigo assembly simples para PROGRAMINHA.
; Os registradores A0...An sao argumentos de funcoes/procedimentos.
; O registrador V0 guarda retorno de funcoes.

	 LD SP , #stackStart
	 BR main 
p: 
	 BR *0(SP) 
c: 
	 BR *0(SP) 
fct: 
	 MUL R1 , #3.4 , #8.9
	 LD V0 , R1
	 BR *0(SP) 
jj: 
	 LD A0 , #23
	 ADD SP , SP , #caller.recordSize
	 ST 0(SP) , #here + 16
	 BR fct
	 SUB SP , SP , #caller.recordSize
	 ST s , V0
	 BR *0(SP) 
main: 
	 MUL R1 , #4 , #8.987
	 ST teste , R1
	 LD R0 , teste
	 ST teste , R0
	 ST charVar , #'a'
$L1:
	 LD R4 , #'t'
	 LD R3 , charVar
	 SUB R0 , R3 , R4
	 BGTZ R0 , $L2
	 LD R3 , charVar
	 ADD R3 , R3 , #1
	 ST charVar , R3
	 BR $L1
$L2:
	 HALT 



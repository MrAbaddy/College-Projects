;Dado um número em uma posição de memória verifique se este é um ;número perfeito. Imprima “verdadeiro” ou “falso” na saída.

JMP start

num: DB 6 ; insira um numero para verificar se ele eh perfeito ou nao

perfeito: DB "Verdadeiro"
	  DB 0

imperfeito: DB "Falso"
	      DB 0

start:
    MOV A, [num]
    DIV 2 ;
    INC A ;
    MOV C, A
    MOV B, 1
    MOV D, 0

.loop:
    MOV A, [num]
	CMP B, C
	JNC .end_loop
    	DIV B
	JNC .divisivel
	INC B
	JMP .loop
	
.divisivel:
	ADD D, B
	INC B
	JMP .loop
	
.end_loop:
	CMP D, [num]
	JC .case_imperfeito
	JMP .case_perfeito

.case_imperfeito: 
	MOV C, imperfeito
	MOV D, 232
	CALL print
	HLT

.case_perfeito:
	MOV C, perfeito
	MOV D, 232
	CALL print
	HLT
	
print:
	PUSH A
	PUSH B
	MOV B, 0

.print_loop:
	MOV A, [C]	
	MOV [D], A	
	INC C
	INC D  
	CMP B, [C]	
	JNZ .print_loop 

	POP B
	POP A
	RET

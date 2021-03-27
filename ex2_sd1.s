#LAB 1 - Exercicio 2 (SD1)	

	.data
numeros: .word 1, 1, 0, 0, 0, 0, 0, 0, 0, 0
j: .word 8						#varia livremente de 0 a 9 
	.text
	li x11, 1 					# x11 = y
	li x12, 1					# x12 = x
	li x14, 2					# x14 = i
	li x15, 10					# i -> max
	la x16, numeros				# x16 = &
	addi x16, x16, 8
						
loop:
	mv x13, x11	
	add x11, x12, x11	
	mv x12, x13						
	sw x11, 0(x16)
	addi x14, x14, 1
	addi x16, x16, 4
	blt x14, x15, loop
	#obs_para conseguir com que o j aponte para a posicao de memoria pretendida, 
	#considera-se que ha que subtrair, do valor de 4*j(word), 40, ja que, no fim do 
	#programa, a posicao de memoria ja incrementou em 40									
	lw x18, j					
	slli x18, x18 2				
	li x19, -40
	add x18, x18, x19			#4*j-40 = variacao de & desejada
	add x16, x16, x18			#variacao de &
	lw x10, 0(x16)				#carregar o valor no & ponderado a j

	li x20, 2
	remu x21, x10, x20			
	beq x21, x0, par			#caso par 
	addi x10, x10, 1			#caso impar->fib[j]++ -> end
	jal x0, end
	#essa soma e deduzida do enunciado: <<(...)maior que um elemento da sequencia(...)>>
	#i.e quando é par, soma-se 2, impar, 1
par:
	addi x10, x10, 2
end:
	li x17, 1
	ecall	
	li x17, 10
	ecall

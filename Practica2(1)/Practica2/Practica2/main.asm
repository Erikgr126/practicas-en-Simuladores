;
; Practica2.asm
;
; Created: 01/04/2022 03:53:07 p. m.
; Author : Erik Guijarro



.dseg
b1: .byte 16
b2: .byte 32


.cseg
start:
        ldi XH,high (b1)		;Una vez generado el registro X, cargamos manualmente los 2 primeros dígitos de la serie, que son los unicos conicidos (0 y 1)
		ldi XL,low (b1)
		ldi YH,high (b2)
		ldi YL,low (b2)
		;ldi ZH,high (b3)
		;ldi ZL,low (b3)
		ldi r16,0x00
		st X+,r16
		st X+,r16
		st X+,r16
		inc r16
		st X+,r16
		ld r17,-X
		ld r16,-X
		ld r17,-X
		ld r16,-X
		clr r18
		clr r19
		clr r20
		clr r21
		clr r22

ciclo1:
		ld r16,X+			;cargamos los primeros datos del registro X a los registros que hacen las operaciónes
		ld r17,X+

		st Y+,r16			;MSB	Guardamos los datos de los registros de operaciónes en el registro Y
		st Y+,r17			;LSB
		inc r22
		cpi r22,2			;Empieza la cuenta que nos ayuda a saber cuantos números tenemos escritos
		brne ciclo1

ciclo2:

		st X+,r16			;Guardo lo que tiene R16 y R17 en X 
		st X+,r17
		add r17,r19
		adc r16,r18			;Hago la suma del fn-1 + fn-2
		st Y+,r16
		st Y+,r17			;Guardo el resultado fn en el registro Y
		ld r19,-X
		ld r18,-X			; Cargo lo que guardé en X a los registros 18 y 19 para poder hacer la suma posteriormente

		inc r22
		cpi r22,16
		breq start			;Cuando r22 = 16 se completa la secuencia hasta el número en la posición 16 de la serie de Fibonacci
		rjmp ciclo2


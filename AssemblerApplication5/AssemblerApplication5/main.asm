
;
; Practica2.asm
;
; Created: 01/04/2022 06:53:17 p. m.
; Author : Erik Guijarro Ruiz


.dseg
b1: .byte 16
b2: .byte 32
.cseg
start:
ldi XH,high (b1)		
ldi XL,low (b1)
ldi YH,high (b2)
ldi YL,low (b2)
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
	ld r16,X+			
	ld r17,X+

	st Y+,r16			
	st Y+,r17			
	inc r22
	cpi r22,2			
	brne ciclo1

ciclo2:

	st X+,r16			 
	st X+,r17
	add r17,r19
	adc r16,r18			
	st Y+,r16
	st Y+,r17			
	ld r19,-X
	ld r18,-X			

	inc r22
	cpi r22,16
	breq start			
	rjmp ciclo2




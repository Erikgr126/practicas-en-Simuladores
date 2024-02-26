;
; AssemblerApplication1.asm
;
; Created: 8/06/2022 01:28:39 p. m.
; Author : erik Guijarro
;

.dseg
  .org 0x100
  tabla_arreglo: .byte 0x10
  .cseg

  .org 0
  rjmp inicio
  .org 0x002A
  rjmp values

  inicio:
    
	cbi DDRC, 0
	cbi PORTC, 0
	sbi DDRC, 1
	ldi r16, 0xFF
	out DDRD, r16
	out DDRB, r16
	ldi r16, 0b0110_0000
	sts ADMUX, r16
	ldi r16, 0b1000_1101
	sts ADCSRA, r16

	ldi r28, low(tabla_arreglo)
	ldi r29, high(tabla_arreglo)
	ldi r16, 0b0011_1111     //DIGITO 0
	st y+, r16
	ldi r16, 0b0000_0110     //DIGITO 1
	st y+, r16
	ldi r16, 0b0101_1011     //DIGITO 2
	st y+, r16
	ldi r16, 0b0100_1111     //DIGITO 3
	st y+, r16
	ldi r16, 0b0110_0110     //DIGITO 4
	st y+, r16
	ldi r16, 0b0110_1101     //DIGITO 5
	st y+, r16
	ldi r16, 0b0111_1101     //DIGITO 6
	st y+, r16
	ldi r16, 0b0000_0111     //DIGITO 7
	st y+, r16
    ldi r16, 0b1111_1111     //DIGITO 8
	st y+, r16
	ldi r16, 0b0110_1111     //DIGITO 9
	st y+, r16

	ldi r16, 0b1100_1101
	sts 0x7A, r16
	sei

main:
    rjmp main
	

Values:
    
	push r16
	in r16, SREG
	push r16

	call escalamiento
	ldi r16, 0b1100_1101
	sts 0x7A, r16
	pop r16
	out SREG, r16
	pop r16
	reti

Escalamiento:
    
	lds r16, ADCH
	ldi r17, 0b0001_1001
	fmul r16, r17
	mov r16, r1
	ldi r17, 0b0000_1101
	fmul r16,r17
	mov r21, r1
	sts 0x111, r1
	ldi r17, 5
	mul r0, r17
	ror r1
	ror r0
	ror r1
	ror r0
	ror r1
	ror r0
	ror r1
	ror r0
	ror r1
	ror r0
	ror r1
	ror r0
	ror r1
	ror r0
	mov r22, r0
	sts 0x110, r0

	clz
	ldi r17, 10
	loop_anterior:
	  dec r17
	  cpse r17, r21
	  brne loop_anterior
    mov r28, r17
	ld r16, y
	out PORTD, r16
	sbi PORTD, 7

	clz
	ldi r17, 10
	loop_anterior2:
	   dec r17
	   cpse r17, r22
	   brne loop_anterior2
	mov r28, r17
	ld r16, y
	out PORTB, R16
	clr r17

	rol r16
	rol r17
	rol r16
	rol r17
	rol r16
	rol r17
	out PORTC, r17
	ret








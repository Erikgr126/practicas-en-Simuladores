;
; Practica5.asm
;
; Created: 11/11/202 09:16:25 p. m.
; Author : Edwing Alexis Casillas Valencia.	19110113.	6E6.
;

	ldi r16,0x02
	out	DDRB,r16		;configuración de PB1 como salida

	ldi	r23,0x00
	out	DDRD,r23		;configuración del puerto D como entrada
	ldi	r24,0XFF
	sbi	PORTB,0			;activamos resistencias de pull-up en PB0

	ldi	r17,0x82
	sts	TCCR1A,r17		;salida PWM en PB1, modo fast PWM
	ldi	r18,0x1B
	sts	TCCR1B,r18		;valor de prescaler, modo fast PWM
	ldi	r19,0x00
	sts	ICR1H,r19		;valor de top, 8 bits msb
	ldi	r20,0xFA
	sts	ICR1L,r20		;valor de top, 8 bits lsb

ciclo:
	in r21,PINB
	andi r21,0X00
	sts	OCR1AH,r21		;duty cicle, 8 bits msb
	
	in r22,PIND
	cpi r22,0x19		;compara con el 10%
	brlo conf			;si es menor al 10% salta a conf, si es mayor continúa

	andi r22,0XE1		;limite del 90%
	sts	OCR1AL,r22		;duty cicle, 8 bits lsb
	rjmp ciclo

conf:					;menor al 10%
	ldi r24,0x19		;cargamos con el 10% de la señal
	andi r24,0x19		;límite del 10%
	sts OCR1AL,r24
	rjmp ciclo
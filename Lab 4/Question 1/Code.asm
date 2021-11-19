
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,1 :: 		void main() {
;Code.c,2 :: 		DDRA = DDRC = 0x01;
	LDI        R27, 1
	OUT        DDRC+0, R27
	LDI        R27, 1
	OUT        DDRA+0, R27
;Code.c,3 :: 		SREG.b7 = 1; // Global Interrupt
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;Code.c,4 :: 		MCUCR = 0x03; // Local External Interrupt Rising edge
	LDI        R27, 3
	OUT        MCUCR+0, R27
;Code.c,5 :: 		GICR = 1<<INT0;
	LDI        R27, 64
	OUT        GICR+0, R27
;Code.c,6 :: 		while(1)
L_main0:
;Code.c,8 :: 		PORTC ^= 0x01; // Toggle port
	IN         R16, PORTC+0
	LDI        R27, 1
	EOR        R16, R27
	OUT        PORTC+0, R16
;Code.c,9 :: 		Delay_ms(1000); // Apply delay
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main2:
	DEC        R16
	BRNE       L_main2
	DEC        R17
	BRNE       L_main2
	DEC        R18
	BRNE       L_main2
;Code.c,10 :: 		}
	JMP        L_main0
;Code.c,11 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

_INT0_VECT:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;Code.c,13 :: 		void INT0_VECT() org 0x002
;Code.c,15 :: 		PORTC = 0x00;
	LDI        R27, 0
	OUT        PORTC+0, R27
;Code.c,16 :: 		PORTA = 0x01;
	LDI        R27, 1
	OUT        PORTA+0, R27
;Code.c,17 :: 		Delay_ms(500);
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_INT0_VECT4:
	DEC        R16
	BRNE       L_INT0_VECT4
	DEC        R17
	BRNE       L_INT0_VECT4
	DEC        R18
	BRNE       L_INT0_VECT4
	NOP
;Code.c,18 :: 		PORTA = 0x00;
	LDI        R27, 0
	OUT        PORTA+0, R27
;Code.c,19 :: 		Delay_ms(500);
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_INT0_VECT6:
	DEC        R16
	BRNE       L_INT0_VECT6
	DEC        R17
	BRNE       L_INT0_VECT6
	DEC        R18
	BRNE       L_INT0_VECT6
	NOP
;Code.c,20 :: 		PORTA = 0x01;
	LDI        R27, 1
	OUT        PORTA+0, R27
;Code.c,21 :: 		Delay_ms(500);
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_INT0_VECT8:
	DEC        R16
	BRNE       L_INT0_VECT8
	DEC        R17
	BRNE       L_INT0_VECT8
	DEC        R18
	BRNE       L_INT0_VECT8
	NOP
;Code.c,22 :: 		PORTA = 0x00;
	LDI        R27, 0
	OUT        PORTA+0, R27
;Code.c,23 :: 		Delay_ms(500);
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_INT0_VECT10:
	DEC        R16
	BRNE       L_INT0_VECT10
	DEC        R17
	BRNE       L_INT0_VECT10
	DEC        R18
	BRNE       L_INT0_VECT10
	NOP
;Code.c,24 :: 		}
L_end_INT0_VECT:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _INT0_VECT

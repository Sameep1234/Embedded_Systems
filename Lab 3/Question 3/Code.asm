
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,1 :: 		void main() {
;Code.c,2 :: 		DDRA = 0x01;
	LDI        R27, 1
	OUT        DDRA+0, R27
;Code.c,3 :: 		DDRB = 0x01;
	LDI        R27, 1
	OUT        DDRB+0, R27
;Code.c,5 :: 		TCCR0 = 0x02;
	LDI        R27, 2
	OUT        TCCR0+0, R27
;Code.c,6 :: 		TCNT0 = 6;
	LDI        R27, 6
	OUT        TCNT0+0, R27
;Code.c,8 :: 		TIMSK = 0x01; // Local
	LDI        R27, 1
	OUT        TIMSK+0, R27
;Code.c,9 :: 		SREG.b7 = 1; // Global
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;Code.c,11 :: 		while(1)
L_main0:
;Code.c,13 :: 		PORTB.b0 = PINB.b1;
	IN         R27, PINB+0
	BST        R27, 1
	IN         R27, PORTB+0
	BLD        R27, 0
	OUT        PORTB+0, R27
;Code.c,14 :: 		}
	JMP        L_main0
;Code.c,15 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

_timer0_ovf_isr:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;Code.c,17 :: 		void timer0_ovf_isr(void) org 0x012
;Code.c,19 :: 		PORTA ^= 0x01;
	IN         R16, PORTA+0
	LDI        R27, 1
	EOR        R16, R27
	OUT        PORTA+0, R16
;Code.c,20 :: 		TCNT0 = 6;
	LDI        R27, 6
	OUT        TCNT0+0, R27
;Code.c,21 :: 		}
L_end_timer0_ovf_isr:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _timer0_ovf_isr


_T2Delay:

;Code.c,1 :: 		void T2Delay()
;Code.c,3 :: 		TCNT2 = 61;
	LDI        R27, 61
	OUT        TCNT2+0, R27
;Code.c,4 :: 		TCCR2 = 0x07;
	LDI        R27, 7
	OUT        TCCR2+0, R27
;Code.c,6 :: 		while((TIFR & 0x40) == 0);
L_T2Delay0:
	IN         R16, TIFR+0
	ANDI       R16, 64
	CPI        R16, 0
	BREQ       L__T2Delay5
	JMP        L_T2Delay1
L__T2Delay5:
	JMP        L_T2Delay0
L_T2Delay1:
;Code.c,7 :: 		TIFR = 0x40;
	LDI        R27, 64
	OUT        TIFR+0, R27
;Code.c,8 :: 		TCCR2 = 0x00;
	LDI        R27, 0
	OUT        TCCR2+0, R27
;Code.c,9 :: 		}
L_end_T2Delay:
	RET
; end of _T2Delay

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,11 :: 		void main() {
;Code.c,12 :: 		DDRA = 0x03;
	LDI        R27, 3
	OUT        DDRA+0, R27
;Code.c,14 :: 		TCCR0 = 0x05;
	LDI        R27, 5
	OUT        TCCR0+0, R27
;Code.c,15 :: 		TCNT0 = 253;
	LDI        R27, 253
	OUT        TCNT0+0, R27
;Code.c,17 :: 		TIMSK = 0x01; // Local Interrupt timer0
	LDI        R27, 1
	OUT        TIMSK+0, R27
;Code.c,18 :: 		SREG.b7 = 1; // Global Interrupt
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;Code.c,19 :: 		while(1)
L_main2:
;Code.c,21 :: 		PORTA ^= 0x01;
	IN         R16, PORTA+0
	LDI        R27, 1
	EOR        R16, R27
	OUT        PORTA+0, R16
;Code.c,22 :: 		T2Delay();
	CALL       _T2Delay+0
;Code.c,23 :: 		T2Delay();
	CALL       _T2Delay+0
;Code.c,24 :: 		}
	JMP        L_main2
;Code.c,25 :: 		}
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

;Code.c,27 :: 		void timer0_ovf_isr(void) org 0x012
;Code.c,29 :: 		PORTA ^= 0x02;
	IN         R16, PORTA+0
	LDI        R27, 2
	EOR        R16, R27
	OUT        PORTA+0, R16
;Code.c,30 :: 		TCNT0=253;
	LDI        R27, 253
	OUT        TCNT0+0, R27
;Code.c,31 :: 		}
L_end_timer0_ovf_isr:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _timer0_ovf_isr

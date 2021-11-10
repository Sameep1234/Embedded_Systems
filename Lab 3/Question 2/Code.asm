
_T1Delay:

;Code.c,1 :: 		T1Delay()
;Code.c,3 :: 		TCNT1L = 0xF1;
	LDI        R27, 241
	OUT        TCNT1L+0, R27
;Code.c,4 :: 		TCNT1H = 0xFF;
	LDI        R27, 255
	OUT        TCNT1H+0, R27
;Code.c,5 :: 		TCCR1B = 0x04;
	LDI        R27, 4
	OUT        TCCR1B+0, R27
;Code.c,6 :: 		TCCR1A = 0x00;
	LDI        R27, 0
	OUT        TCCR1A+0, R27
;Code.c,8 :: 		while((TIFR & 0x04) == 0);
L_T1Delay0:
	IN         R16, TIFR+0
	ANDI       R16, 4
	CPI        R16, 0
	BREQ       L__T1Delay5
	JMP        L_T1Delay1
L__T1Delay5:
	JMP        L_T1Delay0
L_T1Delay1:
;Code.c,9 :: 		TIFR = 0x04;
	LDI        R27, 4
	OUT        TIFR+0, R27
;Code.c,10 :: 		TCCR1A = 0;
	LDI        R27, 0
	OUT        TCCR1A+0, R27
;Code.c,11 :: 		TCCR1B = 0;
	LDI        R27, 0
	OUT        TCCR1B+0, R27
;Code.c,12 :: 		}
L_end_T1Delay:
	RET
; end of _T1Delay

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,14 :: 		void main() {
;Code.c,15 :: 		DDRA = 0x01;
	LDI        R27, 1
	OUT        DDRA+0, R27
;Code.c,16 :: 		while(1)
L_main2:
;Code.c,18 :: 		PORTA ^= 0x01;
	IN         R16, PORTA+0
	LDI        R27, 1
	EOR        R16, R27
	OUT        PORTA+0, R16
;Code.c,19 :: 		T1Delay();
	CALL       _T1Delay+0
;Code.c,20 :: 		}
	JMP        L_main2
;Code.c,21 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

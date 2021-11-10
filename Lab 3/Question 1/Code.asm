
_T1Delay:

;Code.c,1 :: 		void T1Delay()
;Code.c,3 :: 		TCCR1A = 0x00;
	LDI        R27, 0
	OUT        TCCR1A+0, R27
;Code.c,4 :: 		TCCR1B = 0x09;
	LDI        R27, 9
	OUT        TCCR1B+0, R27
;Code.c,5 :: 		TCNT1H = 0x00;
	LDI        R27, 0
	OUT        TCNT1H+0, R27
;Code.c,6 :: 		TCNT1L = 0x00;
	LDI        R27, 0
	OUT        TCNT1L+0, R27
;Code.c,7 :: 		OCR1AL = 235;
	LDI        R27, 235
	OUT        OCR1AL+0, R27
;Code.c,8 :: 		OCR1AH = 0x00;
	LDI        R27, 0
	OUT        OCR1AH+0, R27
;Code.c,10 :: 		while((TIFR & 0x08) == 0);
L_T1Delay0:
	IN         R16, TIFR+0
	ANDI       R16, 8
	CPI        R16, 0
	BREQ       L__T1Delay5
	JMP        L_T1Delay1
L__T1Delay5:
	JMP        L_T1Delay0
L_T1Delay1:
;Code.c,11 :: 		TIFR = 0x08;
	LDI        R27, 8
	OUT        TIFR+0, R27
;Code.c,12 :: 		TCCR1A = 0x00;
	LDI        R27, 0
	OUT        TCCR1A+0, R27
;Code.c,13 :: 		TCCR1B = 0x00;
	LDI        R27, 0
	OUT        TCCR1B+0, R27
;Code.c,14 :: 		}
L_end_T1Delay:
	RET
; end of _T1Delay

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,16 :: 		void main() {
;Code.c,17 :: 		DDRA = 0x01;
	LDI        R27, 1
	OUT        DDRA+0, R27
;Code.c,18 :: 		while(1)
L_main2:
;Code.c,20 :: 		PORTA ^= 0x01;
	IN         R16, PORTA+0
	LDI        R27, 1
	EOR        R16, R27
	OUT        PORTA+0, R16
;Code.c,21 :: 		T1Delay();
	CALL       _T1Delay+0
;Code.c,22 :: 		}
	JMP        L_main2
;Code.c,23 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

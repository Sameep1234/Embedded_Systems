
_T0Delay:

;Code.c,1 :: 		void T0Delay() {
;Code.c,2 :: 		TCNT0 = 0x00;
	LDI        R27, 0
	OUT        TCNT0+0, R27
;Code.c,3 :: 		OCR0 = 150;
	LDI        R27, 150
	OUT        OCR0+0, R27
;Code.c,4 :: 		TCCR0 = 0x09;
	LDI        R27, 9
	OUT        TCCR0+0, R27
;Code.c,5 :: 		while((TIFR&0x02) == 0);
L_T0Delay0:
	IN         R16, TIFR+0
	ANDI       R16, 2
	CPI        R16, 0
	BREQ       L__T0Delay5
	JMP        L_T0Delay1
L__T0Delay5:
	JMP        L_T0Delay0
L_T0Delay1:
;Code.c,6 :: 		TIFR=0x02;
	LDI        R27, 2
	OUT        TIFR+0, R27
;Code.c,7 :: 		}
L_end_T0Delay:
	RET
; end of _T0Delay

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,8 :: 		void main() {
;Code.c,9 :: 		DDRA = 0x01;
	LDI        R27, 1
	OUT        DDRA+0, R27
;Code.c,10 :: 		while(1)
L_main2:
;Code.c,12 :: 		PORTA = 0x01;
	LDI        R27, 1
	OUT        PORTA+0, R27
;Code.c,13 :: 		T0Delay();
	CALL       _T0Delay+0
;Code.c,14 :: 		PORTA = 0x00;
	LDI        R27, 0
	OUT        PORTA+0, R27
;Code.c,15 :: 		T0Delay();
	CALL       _T0Delay+0
;Code.c,16 :: 		}
	JMP        L_main2
;Code.c,17 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

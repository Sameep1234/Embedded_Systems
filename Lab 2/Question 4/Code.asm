
_T0delay:

;Code.c,1 :: 		void T0delay()
;Code.c,3 :: 		TCNT0 = 194;
	LDI        R27, 194
	OUT        TCNT0+0, R27
;Code.c,4 :: 		TCCR0 = 0x03;
	LDI        R27, 3
	OUT        TCCR0+0, R27
;Code.c,5 :: 		while((TIFR & 0x01) == 0);
L_T0delay0:
	IN         R16, TIFR+0
	ANDI       R16, 1
	CPI        R16, 0
	BREQ       L__T0delay5
	JMP        L_T0delay1
L__T0delay5:
	JMP        L_T0delay0
L_T0delay1:
;Code.c,6 :: 		TCCR0 = 0;
	LDI        R27, 0
	OUT        TCCR0+0, R27
;Code.c,7 :: 		TIFR = 0x01;
	LDI        R27, 1
	OUT        TIFR+0, R27
;Code.c,8 :: 		}
L_end_T0delay:
	RET
; end of _T0delay

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,9 :: 		void main() {
;Code.c,10 :: 		DDRA = 0x03;
	LDI        R27, 3
	OUT        DDRA+0, R27
;Code.c,11 :: 		while(1)
L_main2:
;Code.c,13 :: 		T0Delay();
	CALL       _T0delay+0
;Code.c,14 :: 		PORTA ^= 0x02;
	IN         R16, PORTA+0
	LDI        R27, 2
	EOR        R16, R27
	OUT        PORTA+0, R16
;Code.c,15 :: 		T0Delay();
	CALL       _T0delay+0
;Code.c,16 :: 		PORTA ^= 0x01;
	IN         R16, PORTA+0
	LDI        R27, 1
	EOR        R16, R27
	OUT        PORTA+0, R16
;Code.c,17 :: 		}
	JMP        L_main2
;Code.c,18 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main


_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,1 :: 		void main() {
;Code.c,2 :: 		DDRA = 0x01;
	LDI        R27, 1
	OUT        DDRA+0, R27
;Code.c,3 :: 		while(1)
L_main0:
;Code.c,5 :: 		PORTA = 0x01;
	LDI        R27, 1
	OUT        PORTA+0, R27
;Code.c,6 :: 		Delay_ms(1);
	LDI        R17, 11
	LDI        R16, 99
L_main2:
	DEC        R16
	BRNE       L_main2
	DEC        R17
	BRNE       L_main2
;Code.c,7 :: 		PORTA = 0x00;
	LDI        R27, 0
	OUT        PORTA+0, R27
;Code.c,8 :: 		Delay_ms(1);
	LDI        R17, 11
	LDI        R16, 99
L_main4:
	DEC        R16
	BRNE       L_main4
	DEC        R17
	BRNE       L_main4
;Code.c,9 :: 		}
	JMP        L_main0
;Code.c,10 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

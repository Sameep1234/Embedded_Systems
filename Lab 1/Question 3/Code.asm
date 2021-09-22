
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,1 :: 		void main() {
;Code.c,3 :: 		DDRA = 0x55;
	LDI        R27, 85
	OUT        DDRA+0, R27
;Code.c,4 :: 		while(1)
L_main0:
;Code.c,6 :: 		PORTA = PINA >> 0x01;
	IN         R16, PINA+0
	LSR        R16
	OUT        PORTA+0, R16
;Code.c,8 :: 		}
	JMP        L_main0
;Code.c,9 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

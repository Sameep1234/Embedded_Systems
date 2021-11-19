
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,1 :: 		int main()
;Code.c,3 :: 		DDRA = DDRB = 0xFF; // Common Cathode PORTA output
	LDI        R27, 255
	OUT        DDRB+0, R27
	LDI        R27, 255
	OUT        DDRA+0, R27
;Code.c,4 :: 		while(1)
L_main0:
;Code.c,6 :: 		PORTA = 0x08; // Display A
	LDI        R27, 8
	OUT        PORTA+0, R27
;Code.c,7 :: 		PORTB.b0 = 1; // Enable pin
	IN         R27, PORTB+0
	SBR        R27, 1
	OUT        PORTB+0, R27
;Code.c,8 :: 		}
	JMP        L_main0
;Code.c,10 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

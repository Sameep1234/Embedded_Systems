
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,1 :: 		void main()
;Code.c,3 :: 		DDRB = 0x01;
	LDI        R27, 1
	OUT        DDRB+0, R27
;Code.c,4 :: 		while (1)
L_main0:
;Code.c,6 :: 		if (PINB.b1 == 1)
	IN         R27, PINB+0
	SBRS       R27, 1
	JMP        L_main2
;Code.c,8 :: 		PORTB = 0x01;
	LDI        R27, 1
	OUT        PORTB+0, R27
;Code.c,9 :: 		}
	JMP        L_main3
L_main2:
;Code.c,12 :: 		PORTB = 0x00;
	LDI        R27, 0
	OUT        PORTB+0, R27
;Code.c,13 :: 		}
L_main3:
;Code.c,14 :: 		}
	JMP        L_main0
;Code.c,15 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

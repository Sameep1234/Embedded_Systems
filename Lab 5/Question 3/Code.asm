
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,1 :: 		void main()
;Code.c,3 :: 		int flag = 0;
; flag start address is: 16 (R16)
	LDI        R16, 0
	LDI        R17, 0
;Code.c,4 :: 		DDRB = 0X04;
	LDI        R27, 4
	OUT        DDRB+0, R27
; flag end address is: 16 (R16)
;Code.c,6 :: 		while (1)
L_main0:
;Code.c,8 :: 		TCCR0 = 0x62;
; flag start address is: 16 (R16)
	LDI        R27, 98
	OUT        TCCR0+0, R27
;Code.c,9 :: 		if (flag == 0)
	CPI        R17, 0
	BRNE       L__main9
	CPI        R16, 0
L__main9:
	BREQ       L__main10
	JMP        L_main2
L__main10:
; flag end address is: 16 (R16)
;Code.c,11 :: 		OCR0 = 230;
	LDI        R27, 230
	OUT        OCR0+0, R27
;Code.c,12 :: 		delay_ms(5000);
	LDI        R18, 203
	LDI        R17, 236
	LDI        R16, 133
L_main3:
	DEC        R16
	BRNE       L_main3
	DEC        R17
	BRNE       L_main3
	DEC        R18
	BRNE       L_main3
	NOP
;Code.c,13 :: 		flag = 1;
; flag start address is: 16 (R16)
	LDI        R16, 1
	LDI        R17, 0
;Code.c,14 :: 		}
; flag end address is: 16 (R16)
	JMP        L_main5
L_main2:
;Code.c,17 :: 		OCR0 = 63;
	LDI        R27, 63
	OUT        OCR0+0, R27
;Code.c,18 :: 		delay_ms(5000);
	LDI        R18, 203
	LDI        R17, 236
	LDI        R16, 133
L_main6:
	DEC        R16
	BRNE       L_main6
	DEC        R17
	BRNE       L_main6
	DEC        R18
	BRNE       L_main6
	NOP
;Code.c,19 :: 		flag = 0;
; flag start address is: 16 (R16)
	LDI        R16, 0
	LDI        R17, 0
; flag end address is: 16 (R16)
;Code.c,20 :: 		}
L_main5:
;Code.c,21 :: 		}
; flag start address is: 16 (R16)
; flag end address is: 16 (R16)
	JMP        L_main0
;Code.c,22 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

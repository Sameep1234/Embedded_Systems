
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,3 :: 		void main()
;Code.c,5 :: 		int flag = 0;
; flag start address is: 16 (R16)
	LDI        R16, 0
	LDI        R17, 0
;Code.c,6 :: 		DDRB = 0X08;
	LDI        R27, 8
	OUT        DDRB+0, R27
; flag end address is: 16 (R16)
;Code.c,8 :: 		while (1)
L_main0:
;Code.c,10 :: 		TCCR0 = 0x62;
; flag start address is: 16 (R16)
	LDI        R27, 98
	OUT        TCCR0+0, R27
;Code.c,11 :: 		if (flag == 0)
	CPI        R17, 0
	BRNE       L__main9
	CPI        R16, 0
L__main9:
	BREQ       L__main10
	JMP        L_main2
L__main10:
; flag end address is: 16 (R16)
;Code.c,13 :: 		OCR0 = 204;
	LDI        R27, 204
	OUT        OCR0+0, R27
;Code.c,14 :: 		delay_ms(5000);
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
;Code.c,15 :: 		flag = 1;
; flag start address is: 16 (R16)
	LDI        R16, 1
	LDI        R17, 0
;Code.c,16 :: 		}
; flag end address is: 16 (R16)
	JMP        L_main5
L_main2:
;Code.c,19 :: 		OCR0 = 90;
	LDI        R27, 90
	OUT        OCR0+0, R27
;Code.c,20 :: 		delay_ms(5000);
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
;Code.c,21 :: 		flag = 0;
; flag start address is: 16 (R16)
	LDI        R16, 0
	LDI        R17, 0
; flag end address is: 16 (R16)
;Code.c,22 :: 		}
L_main5:
;Code.c,23 :: 		}
; flag start address is: 16 (R16)
; flag end address is: 16 (R16)
	JMP        L_main0
;Code.c,24 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main


_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,3 :: 		int main()
;Code.c,5 :: 		DDRA = DDRB = 0xFF;
	LDI        R27, 255
	OUT        DDRB+0, R27
	LDI        R27, 255
	OUT        DDRA+0, R27
;Code.c,7 :: 		while(1)
L_main0:
;Code.c,9 :: 		PORTB.b0 = 1;
	IN         R27, PORTB+0
	SBR        R27, 1
	OUT        PORTB+0, R27
;Code.c,10 :: 		for(i=0;i<10;i++)
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
L_main2:
	LDS        R18, _i+0
	LDS        R19, _i+1
	LDI        R16, 10
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__main8
	JMP        L_main3
L__main8:
;Code.c,12 :: 		PORTA = arr[i];
	LDS        R16, _i+0
	LDS        R17, _i+1
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_arr+0)
	LDI        R17, hi_addr(_arr+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	OUT        PORTA+0, R16
;Code.c,13 :: 		delay_ms(1000);
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main5:
	DEC        R16
	BRNE       L_main5
	DEC        R17
	BRNE       L_main5
	DEC        R18
	BRNE       L_main5
;Code.c,10 :: 		for(i=0;i<10;i++)
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;Code.c,14 :: 		}
	JMP        L_main2
L_main3:
;Code.c,15 :: 		}
	JMP        L_main0
;Code.c,17 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

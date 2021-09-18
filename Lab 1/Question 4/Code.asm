
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,2 :: 		void main() {
;Code.c,3 :: 		DDRA = 0x0F;
	LDI        R27, 15
	OUT        DDRA+0, R27
;Code.c,4 :: 		while(1)
L_main0:
;Code.c,6 :: 		if(PINA.b4 == 1)
	IN         R27, PINA+0
	SBRS       R27, 4
	JMP        L_main2
;Code.c,8 :: 		for(i=0;i<=15;i++)
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
L_main3:
	LDS        R18, _i+0
	LDS        R19, _i+1
	LDI        R16, 15
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__main8
	JMP        L_main4
L__main8:
;Code.c,10 :: 		PORTA = i;
	LDS        R16, _i+0
	OUT        PORTA+0, R16
;Code.c,11 :: 		if(PINA.b4 == 0)
	IN         R27, PINA+0
	SBRC       R27, 4
	JMP        L_main6
;Code.c,13 :: 		i=0;
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
;Code.c,14 :: 		break;
	JMP        L_main4
;Code.c,15 :: 		}
L_main6:
;Code.c,8 :: 		for(i=0;i<=15;i++)
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;Code.c,16 :: 		}
	JMP        L_main3
L_main4:
;Code.c,17 :: 		}
L_main2:
;Code.c,18 :: 		}
	JMP        L_main0
;Code.c,19 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main


_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,3 :: 		void main()
;Code.c,5 :: 		DDRA = 0x0F; //2nd is L and 3rd is R
	LDI        R27, 15
	OUT        DDRA+0, R27
;Code.c,6 :: 		MCUCR = 0xFF;
	LDI        R27, 255
	OUT        MCUCR+0, R27
;Code.c,7 :: 		SREG.b7 = 1;
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;Code.c,8 :: 		GICR = 0xC0;
	LDI        R27, 192
	OUT        GICR+0, R27
;Code.c,10 :: 		while (1)
L_main0:
;Code.c,12 :: 		if (left == 1)
	LDS        R16, _left+0
	LDS        R17, _left+1
	CPI        R17, 0
	BRNE       L__main15
	CPI        R16, 1
L__main15:
	BREQ       L__main16
	JMP        L_main2
L__main16:
;Code.c,14 :: 		for (count = 0; count <= 3; count++)
	LDI        R27, 0
	STS        _count+0, R27
	STS        _count+1, R27
L_main3:
	LDS        R18, _count+0
	LDS        R19, _count+1
	LDI        R16, 3
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__main17
	JMP        L_main4
L__main17:
;Code.c,16 :: 		PORTA = count + 1;
	LDS        R16, _count+0
	SUBI       R16, 255
	OUT        PORTA+0, R16
;Code.c,17 :: 		Delay_ms(500);
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_main6:
	DEC        R16
	BRNE       L_main6
	DEC        R17
	BRNE       L_main6
	DEC        R18
	BRNE       L_main6
	NOP
;Code.c,14 :: 		for (count = 0; count <= 3; count++)
	LDS        R16, _count+0
	LDS        R17, _count+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _count+0, R16
	STS        _count+1, R17
;Code.c,18 :: 		}
	JMP        L_main3
L_main4:
;Code.c,19 :: 		}
	JMP        L_main8
L_main2:
;Code.c,23 :: 		for (count = 3; count >= 0; count--)
	LDI        R27, 3
	STS        _count+0, R27
	LDI        R27, 0
	STS        _count+1, R27
L_main9:
	LDS        R18, _count+0
	LDS        R19, _count+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__main18
	JMP        L_main10
L__main18:
;Code.c,25 :: 		PORTA = count +1;
	LDS        R16, _count+0
	SUBI       R16, 255
	OUT        PORTA+0, R16
;Code.c,26 :: 		Delay_ms(500);
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_main12:
	DEC        R16
	BRNE       L_main12
	DEC        R17
	BRNE       L_main12
	DEC        R18
	BRNE       L_main12
	NOP
;Code.c,23 :: 		for (count = 3; count >= 0; count--)
	LDS        R16, _count+0
	LDS        R17, _count+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _count+0, R16
	STS        _count+1, R17
;Code.c,27 :: 		}
	JMP        L_main9
L_main10:
;Code.c,28 :: 		}
L_main8:
;Code.c,29 :: 		}
	JMP        L_main0
;Code.c,30 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

_INT0_VECT:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;Code.c,31 :: 		void INT0_VECT() org 0x002
;Code.c,33 :: 		left=1;
	LDI        R27, 1
	STS        _left+0, R27
	LDI        R27, 0
	STS        _left+1, R27
;Code.c,35 :: 		}
L_end_INT0_VECT:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _INT0_VECT

_INT1_VECT:

;Code.c,36 :: 		void INT1_VECT() org 0x003
;Code.c,38 :: 		left=0;
	LDI        R27, 0
	STS        _left+0, R27
	STS        _left+1, R27
;Code.c,40 :: 		}
L_end_INT1_VECT:
	RET
; end of _INT1_VECT

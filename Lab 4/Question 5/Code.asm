
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;Code.c,4 :: 		void main()
;Code.c,6 :: 		DDRA = DDRC =0XFF;
	LDI        R27, 255
	OUT        DDRC+0, R27
	LDI        R27, 255
	OUT        DDRA+0, R27
;Code.c,7 :: 		SREG.B7 = 1;
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;Code.c,8 :: 		MCUCR = 0x03;
	LDI        R27, 3
	OUT        MCUCR+0, R27
;Code.c,9 :: 		GICR = (1 << INT0);
	LDI        R27, 64
	OUT        GICR+0, R27
;Code.c,10 :: 		while (1)
L_main0:
;Code.c,12 :: 		int temp = count;
	LDS        R16, _count+0
	LDS        R17, _count+1
	STD        Y+0, R16
	STD        Y+1, R17
;Code.c,13 :: 		PORTC = lookup[temp % 10];
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _count+0
	LDS        R17, _count+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_lookup+0)
	LDI        R17, hi_addr(_lookup+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	OUT        PORTC+0, R16
;Code.c,14 :: 		temp /= 10;
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
;Code.c,15 :: 		PORTA = lookup[temp];
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_lookup+0)
	LDI        R17, hi_addr(_lookup+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	OUT        PORTA+0, R16
;Code.c,18 :: 		}
	JMP        L_main0
;Code.c,19 :: 		}
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

;Code.c,21 :: 		void INT0_VECT() org 0x002
;Code.c,23 :: 		count++;
	LDS        R16, _count+0
	LDS        R17, _count+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _count+0, R16
	STS        _count+1, R17
;Code.c,24 :: 		if (count == 21)
	CPI        R17, 0
	BRNE       L__INT0_VECT6
	CPI        R16, 21
L__INT0_VECT6:
	BREQ       L__INT0_VECT7
	JMP        L_INT0_VECT2
L__INT0_VECT7:
;Code.c,26 :: 		count = 0;
	LDI        R27, 0
	STS        _count+0, R27
	STS        _count+1, R27
;Code.c,27 :: 		}
L_INT0_VECT2:
;Code.c,28 :: 		}
L_end_INT0_VECT:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _INT0_VECT


_LCD_Command:

;Code.c,11 :: 		void LCD_Command(unsigned char cmnd)
;Code.c,13 :: 		PORTB = cmnd;
	OUT        PORTB+0, R2
;Code.c,14 :: 		PORTC &= ~(0x01); /* RS=0 command reg. */
	IN         R16, PORTC+0
	ANDI       R16, 254
	OUT        PORTC+0, R16
;Code.c,15 :: 		PORTC &= ~(0x02); /* RW=0 Write operation */
	ANDI       R16, 253
	OUT        PORTC+0, R16
;Code.c,16 :: 		PORTC |= (0x04);  /* Enable pulse */
	ORI        R16, 4
	OUT        PORTC+0, R16
;Code.c,17 :: 		delay_ms(100);
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_LCD_Command0:
	DEC        R16
	BRNE       L_LCD_Command0
	DEC        R17
	BRNE       L_LCD_Command0
	DEC        R18
	BRNE       L_LCD_Command0
;Code.c,18 :: 		PORTC &= ~(0x04);
	IN         R27, PORTC+0
	CBR        R27, 4
	OUT        PORTC+0, R27
;Code.c,19 :: 		delay_ms(100);
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_LCD_Command2:
	DEC        R16
	BRNE       L_LCD_Command2
	DEC        R17
	BRNE       L_LCD_Command2
	DEC        R18
	BRNE       L_LCD_Command2
;Code.c,20 :: 		}
L_end_LCD_Command:
	RET
; end of _LCD_Command

_LCD_Char:

;Code.c,22 :: 		void LCD_Char(unsigned char char_data) /* LCD data write function */
;Code.c,24 :: 		LCD_Data_Port = char_data;
	OUT        PORTB+0, R2
;Code.c,25 :: 		LCD_Command_Port |= (0x01);  /* RS=1 Data reg. */
	IN         R16, PORTC+0
	ORI        R16, 1
	OUT        PORTC+0, R16
;Code.c,26 :: 		LCD_Command_Port &= ~(0x02); /* RW=0 write operation */
	ANDI       R16, 253
	OUT        PORTC+0, R16
;Code.c,27 :: 		LCD_Command_Port |= (0x04);  /* Enable Pulse */
	ORI        R16, 4
	OUT        PORTC+0, R16
;Code.c,28 :: 		delay_ms(100);
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_LCD_Char4:
	DEC        R16
	BRNE       L_LCD_Char4
	DEC        R17
	BRNE       L_LCD_Char4
	DEC        R18
	BRNE       L_LCD_Char4
;Code.c,29 :: 		LCD_Command_Port &= ~(0x04);
	IN         R27, PORTC+0
	CBR        R27, 4
	OUT        PORTC+0, R27
;Code.c,30 :: 		delay_ms(100);
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_LCD_Char6:
	DEC        R16
	BRNE       L_LCD_Char6
	DEC        R17
	BRNE       L_LCD_Char6
	DEC        R18
	BRNE       L_LCD_Char6
;Code.c,31 :: 		}
L_end_LCD_Char:
	RET
; end of _LCD_Char

_LCD_Init1:

;Code.c,33 :: 		void LCD_Init1() /* LCD Initialize function */
;Code.c,35 :: 		DDRC = 0xFF; /* Make LCD command port direction as o/p */
	PUSH       R2
	LDI        R27, 255
	OUT        DDRC+0, R27
;Code.c,36 :: 		DDRB = 0xFF; /* Make LCD data port direction as o/p */
	LDI        R27, 255
	OUT        DDRB+0, R27
;Code.c,37 :: 		delay_ms(100);
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_LCD_Init18:
	DEC        R16
	BRNE       L_LCD_Init18
	DEC        R17
	BRNE       L_LCD_Init18
	DEC        R18
	BRNE       L_LCD_Init18
;Code.c,39 :: 		LCD_Command(0x38); /* Initialization of 16X2 LCD in 8bit mode */
	LDI        R27, 56
	MOV        R2, R27
	CALL       _LCD_Command+0
;Code.c,40 :: 		LCD_Command(0x0C); /* Display ON Cursor OFF */
	LDI        R27, 12
	MOV        R2, R27
	CALL       _LCD_Command+0
;Code.c,41 :: 		LCD_Command(0x06); /* Auto Increment cursor */
	LDI        R27, 6
	MOV        R2, R27
	CALL       _LCD_Command+0
;Code.c,42 :: 		LCD_Command(0x01); /* Clear display */
	LDI        R27, 1
	MOV        R2, R27
	CALL       _LCD_Command+0
;Code.c,43 :: 		LCD_Command(0x80); /* Cursor at home position */
	LDI        R27, 128
	MOV        R2, R27
	CALL       _LCD_Command+0
;Code.c,44 :: 		}
L_end_LCD_Init1:
	POP        R2
	RET
; end of _LCD_Init1

_LCD_String:

;Code.c,46 :: 		void LCD_String(char *str) /* Send string to LCD function */
;Code.c,49 :: 		for (i = 0; str[i] != 0; i++) /* Send each char of string till the NULL */
; i start address is: 18 (R18)
	LDI        R18, 0
	LDI        R19, 0
; i end address is: 18 (R18)
L_LCD_String10:
; i start address is: 18 (R18)
	MOVW       R30, R18
	ADD        R30, R2
	ADC        R31, R3
	LD         R16, Z
	CPI        R16, 0
	BRNE       L__LCD_String30
	JMP        L_LCD_String11
L__LCD_String30:
;Code.c,51 :: 		LCD_Char(str[i]);
	MOVW       R30, R18
	ADD        R30, R2
	ADC        R31, R3
	LD         R16, Z
	PUSH       R19
	PUSH       R18
	PUSH       R3
	PUSH       R2
	MOV        R2, R16
	CALL       _LCD_Char+0
	POP        R2
	POP        R3
	POP        R18
	POP        R19
;Code.c,49 :: 		for (i = 0; str[i] != 0; i++) /* Send each char of string till the NULL */
	MOVW       R16, R18
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R18, R16
;Code.c,52 :: 		}
; i end address is: 18 (R18)
	JMP        L_LCD_String10
L_LCD_String11:
;Code.c,53 :: 		}
L_end_LCD_String:
	RET
; end of _LCD_String

_LCD_String_xy:

;Code.c,55 :: 		void LCD_String_xy(char row, char pos, char str) /* Send string to LCD with xy position */
;Code.c,57 :: 		if (row == 0 && pos < 16)
	PUSH       R2
	PUSH       R3
	LDI        R27, 0
	CP         R2, R27
	BREQ       L__LCD_String_xy32
	JMP        L__LCD_String_xy23
L__LCD_String_xy32:
	LDI        R27, 16
	CP         R3, R27
	BRLO       L__LCD_String_xy33
	JMP        L__LCD_String_xy22
L__LCD_String_xy33:
L__LCD_String_xy21:
;Code.c,58 :: 		LCD_Command((pos & 0x0F) | 0x80); /* Command of first row and required position<16 */
	MOV        R16, R3
	ANDI       R16, 15
	ORI        R16, 128
	MOV        R2, R16
	CALL       _LCD_Command+0
	JMP        L_LCD_String_xy16
;Code.c,57 :: 		if (row == 0 && pos < 16)
L__LCD_String_xy23:
L__LCD_String_xy22:
;Code.c,59 :: 		else if (row == 1 && pos < 16)
	LDI        R27, 1
	CP         R2, R27
	BREQ       L__LCD_String_xy34
	JMP        L__LCD_String_xy25
L__LCD_String_xy34:
	LDI        R27, 16
	CP         R3, R27
	BRLO       L__LCD_String_xy35
	JMP        L__LCD_String_xy24
L__LCD_String_xy35:
L__LCD_String_xy20:
;Code.c,60 :: 		LCD_Command((pos & 0x0F) | 0xC0); /* Command of first row and required position<16 */
	MOV        R16, R3
	ANDI       R16, 15
	ORI        R16, 192
	MOV        R2, R16
	CALL       _LCD_Command+0
;Code.c,59 :: 		else if (row == 1 && pos < 16)
L__LCD_String_xy25:
L__LCD_String_xy24:
;Code.c,60 :: 		LCD_Command((pos & 0x0F) | 0xC0); /* Command of first row and required position<16 */
L_LCD_String_xy16:
;Code.c,61 :: 		LCD_String(str);                      /* Call LCD string function */
	MOV        R16, R4
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _LCD_String+0
;Code.c,62 :: 		}
L_end_LCD_String_xy:
	POP        R3
	POP        R2
	RET
; end of _LCD_String_xy

_LCD_Clear:

;Code.c,64 :: 		void LCD_Clear()
;Code.c,66 :: 		LCD_Command(0x01); /* clear display */
	PUSH       R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       _LCD_Command+0
;Code.c,67 :: 		LCD_Command(0x80); /* cursor at home position */
	LDI        R27, 128
	MOV        R2, R27
	CALL       _LCD_Command+0
;Code.c,68 :: 		}
L_end_LCD_Clear:
	POP        R2
	RET
; end of _LCD_Clear

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Code.c,70 :: 		int main()
;Code.c,73 :: 		LCD_Init1();         /* Initialize LCD */
	PUSH       R2
	PUSH       R3
	CALL       _LCD_Init1+0
;Code.c,74 :: 		LCD_Command(0x82);   /* Go to 2nd line*/
	LDI        R27, 130
	MOV        R2, R27
	CALL       _LCD_Command+0
;Code.c,75 :: 		LCD_String("Hello"); /* write string on 1st line of LCD*/
	LDI        R27, #lo_addr(?lstr1_Code+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_Code+0)
	MOV        R3, R27
	CALL       _LCD_String+0
;Code.c,76 :: 		LCD_Command(0xC4);   /* Go to 2nd line*/
	LDI        R27, 196
	MOV        R2, R27
	CALL       _LCD_Command+0
;Code.c,77 :: 		LCD_String("World"); /* Write string on 2nd line*/
	LDI        R27, #lo_addr(?lstr2_Code+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_Code+0)
	MOV        R3, R27
	CALL       _LCD_String+0
;Code.c,79 :: 		return 0;
	LDI        R16, 0
	LDI        R17, 0
;Code.c,80 :: 		}
;Code.c,79 :: 		return 0;
;Code.c,80 :: 		}
L_end_main:
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

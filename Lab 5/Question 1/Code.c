#define F_CPU 8000000UL /* Define CPU Frequency e.g. here 8MHz */

#define LCD_Data_Dir DDRB      /* Define LCD data port direction */
#define LCD_Command_Dir DDRC   /* Define LCD command port direction register */
#define LCD_Data_Port PORTB    /* Define LCD data port */
#define LCD_Command_Port PORTC /* Define LCD data port */
#define RS PORTC               /* Define Register Select (data/command reg.)pin */
#define RW PORTC.b1            /* Define Read/Write signal pin */
#define EN PORTC.b2            /* Define Enable signal pin */

void LCD_Command(unsigned char cmnd)
{
    PORTB = cmnd;
    PORTC &= ~(0x01); /* RS=0 command reg. */
    PORTC &= ~(0x02); /* RW=0 Write operation */
    PORTC |= (0x04);  /* Enable pulse */
    delay_ms(100);
    PORTC &= ~(0x04);
    delay_ms(100);
}

void LCD_Char(unsigned char char_data) /* LCD data write function */
{
    LCD_Data_Port = char_data;
    LCD_Command_Port |= (0x01);  /* RS=1 Data reg. */
    LCD_Command_Port &= ~(0x02); /* RW=0 write operation */
    LCD_Command_Port |= (0x04);  /* Enable Pulse */
    delay_ms(100);
    LCD_Command_Port &= ~(0x04);
    delay_ms(100);
}

void LCD_Init1() /* LCD Initialize function */
{
    DDRC = 0xFF; /* Make LCD command port direction as o/p */
    DDRB = 0xFF; /* Make LCD data port direction as o/p */
    delay_ms(100);

    LCD_Command(0x38); /* Initialization of 16X2 LCD in 8bit mode */
    LCD_Command(0x0C); /* Display ON Cursor OFF */
    LCD_Command(0x06); /* Auto Increment cursor */
    LCD_Command(0x01); /* Clear display */
    LCD_Command(0x80); /* Cursor at home position */
}

void LCD_String(char *str) /* Send string to LCD function */
{
    int i;
    for (i = 0; str[i] != 0; i++) /* Send each char of string till the NULL */
    {
        LCD_Char(str[i]);
    }
}

void LCD_String_xy(char row, char pos, char str) /* Send string to LCD with xy position */
{
    if (row == 0 && pos < 16)
        LCD_Command((pos & 0x0F) | 0x80); /* Command of first row and required position<16 */
    else if (row == 1 && pos < 16)
        LCD_Command((pos & 0x0F) | 0xC0); /* Command of first row and required position<16 */
    LCD_String(str);                      /* Call LCD string function */
}

void LCD_Clear()
{
    LCD_Command(0x01); /* clear display */
    LCD_Command(0x80); /* cursor at home position */
}

int main()
{

    LCD_Init1();         /* Initialize LCD */
    LCD_Command(0x82);   /* Go to 2nd line*/
    LCD_String("Hello"); /* write string on 1st line of LCD*/
    LCD_Command(0xC4);   /* Go to 2nd line*/
    LCD_String("World"); /* Write string on 2nd line*/

    return 0;
}
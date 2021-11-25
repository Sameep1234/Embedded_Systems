#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 5/Question 1/Code.c"










void LCD_Command(unsigned char cmnd)
{
 PORTB = cmnd;
 PORTC &= ~(0x01);
 PORTC &= ~(0x02);
 PORTC |= (0x04);
 delay_ms(100);
 PORTC &= ~(0x04);
 delay_ms(100);
}

void LCD_Char(unsigned char char_data)
{
  PORTB  = char_data;
  PORTC  |= (0x01);
  PORTC  &= ~(0x02);
  PORTC  |= (0x04);
 delay_ms(100);
  PORTC  &= ~(0x04);
 delay_ms(100);
}

void LCD_Init1()
{
 DDRC = 0xFF;
 DDRB = 0xFF;
 delay_ms(100);

 LCD_Command(0x38);
 LCD_Command(0x0C);
 LCD_Command(0x06);
 LCD_Command(0x01);
 LCD_Command(0x80);
}

void LCD_String(char *str)
{
 int i;
 for (i = 0; str[i] != 0; i++)
 {
 LCD_Char(str[i]);
 }
}

void LCD_String_xy(char row, char pos, char str)
{
 if (row == 0 && pos < 16)
 LCD_Command((pos & 0x0F) | 0x80);
 else if (row == 1 && pos < 16)
 LCD_Command((pos & 0x0F) | 0xC0);
 LCD_String(str);
}

void LCD_Clear()
{
 LCD_Command(0x01);
 LCD_Command(0x80);
}

int main()
{

 LCD_Init1();
 LCD_Command(0x82);
 LCD_String("Hello");
 LCD_Command(0xC4);
 LCD_String("World");

 return 0;
}

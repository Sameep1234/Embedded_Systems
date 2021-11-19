#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 4/Question 5/Code.c"
int lookup[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
int count = 0;

void main()
{
 DDRA = DDRC =0XFF;
 SREG.B7 = 1;
 MCUCR = 0x03;
 GICR = (1 << INT0);
 while (1)
 {
 int temp = count;
 PORTC = lookup[temp % 10];
 temp /= 10;
 PORTA = lookup[temp];


 }
}

void INT0_VECT() org 0x002
{
 count++;
 if (count == 21)
 {
 count = 0;
 }
}

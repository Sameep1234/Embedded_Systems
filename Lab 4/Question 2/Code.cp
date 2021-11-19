#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 4/Question 2/Code.c"
int count = 0;
int left = 1;
void main()
{
 DDRA = 0x0F;
 MCUCR = 0xFF;
 SREG.b7 = 1;
 GICR = 0xC0;

 while (1)
 {
 if (left == 1)
 {
 for (count = 0; count <= 3; count++)
 {
 PORTA = count + 1;
 Delay_ms(500);
 }
 }

 else
 {
 for (count = 3; count >= 0; count--)
 {
 PORTA = count +1;
 Delay_ms(500);
 }
 }
 }
}
void INT0_VECT() org 0x002
{
 left=1;

}
void INT1_VECT() org 0x003
{
 left=0;

}

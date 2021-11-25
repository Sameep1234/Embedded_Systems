#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 5/Question 2/Code.c"
void main()
{
 DDRB = 0x01;
 while (1)
 {
 if (PINB.b1 == 1)
 {
 PORTB = 0x01;
 }
 else
 {
 PORTB = 0x00;
 }
 }
}

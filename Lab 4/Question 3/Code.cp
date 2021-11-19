#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 4/Question 3/Code.c"
int main()
{
 DDRA = DDRB = 0xFF;
 while(1)
 {
 PORTA = 0x08;
 PORTB.b0 = 1;
 }
 return 0;
}

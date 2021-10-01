#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 2/Question 4/Code.c"
void T0delay()
{
 TCNT0 = 194;
 TCCR0 = 0x03;
 while((TIFR & 0x01) == 0);
 TCCR0 = 0;
 TIFR = 0x01;
}
void main() {
 DDRA = 0x03;
 while(1)
 {
 T0Delay();
 PORTA ^= 0x02;
 T0Delay();
 PORTA ^= 0x01;
 }
}

#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 2/Question 3/Code.c"
void T0Delay()
{
 TCCR0 = 0x05;
 TCNT0 = 0x3D;
 while((TIFR & 0x01) == 0);
 TIFR = 0x01;
 TCCR0=0x00;
}

void main() {
 DDRA = 0x01;
 while(1)
 {
 PORTA ^= 0x01;
 T0Delay();
 T0Delay();
 }
}

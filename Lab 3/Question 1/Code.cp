#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 3/Question 1/Code.c"
void T1Delay()
{
 TCCR1A = 0x00;
 TCCR1B = 0x09;
 TCNT1H = 0x00;
 TCNT1L = 0x00;
 OCR1AL = 235;
 OCR1AH = 0x00;

 while((TIFR & 0x08) == 0);
 TIFR = 0x08;
 TCCR1A = 0x00;
 TCCR1B = 0x00;
}

void main() {
 DDRA = 0x01;
 while(1)
 {
 PORTA ^= 0x01;
 T1Delay();
 }
}

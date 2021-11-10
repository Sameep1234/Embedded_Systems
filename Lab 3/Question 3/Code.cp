#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 3/Question 3/Code.c"
void main() {
 DDRA = 0x01;
 DDRB = 0x01;

 TCCR0 = 0x02;
 TCNT0 = 6;

 TIMSK = 0x01;
 SREG.b7 = 1;

 while(1)
 {
 PORTB.b0 = PINB.b1;
 }
}

void timer0_ovf_isr(void) org 0x012
{
 PORTA ^= 0x01;
 TCNT0 = 6;
}

void main() {
     DDRA = 0x01;
     DDRB = 0x01;
     
   TCCR0 = 0x02;
   TCNT0 = 6;
   
   TIMSK = 0x01; // Local
   SREG.b7 = 1; // Global
   
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
void T2Delay()
{
 TCNT2 = 61;
 TCCR2 = 0x07;
 
 while((TIFR & 0x40) == 0);
 TIFR = 0x40;
 TCCR2 = 0x00;
}

void main() {
    DDRA = 0x03;
    
    TCCR0 = 0x05;
    TCNT0 = 253;
    
    TIMSK = 0x01; // Local Interrupt timer0
    SREG.b7 = 1; // Global Interrupt
    while(1)
    {
     PORTA ^= 0x01;
     T2Delay();
     T2Delay();
    }
}

void timer0_ovf_isr(void) org 0x012
{
 PORTA ^= 0x02;
 TCNT0=253;
}
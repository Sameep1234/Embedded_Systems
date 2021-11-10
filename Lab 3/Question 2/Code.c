T1Delay()
{
 TCNT1L = 0xF1;
 TCNT1H = 0xFF;
 TCCR1B = 0x04;
 TCCR1A = 0x00;
 
 while((TIFR & 0x04) == 0);
 TIFR = 0x04;
 TCCR1A = 0;
 TCCR1B = 0;
}

void main() {
    DDRA = 0x01;
    while(1)
    {
     PORTA ^= 0x01;
     T1Delay();
    }
}
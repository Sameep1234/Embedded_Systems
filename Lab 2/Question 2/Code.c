void T0Delay() {
     TCNT0 = 0x00;
     OCR0 = 150;
     TCCR0 = 0x09;
     while((TIFR&0x02) == 0);
     TIFR=0x02;
}
void main() {
    DDRA = 0x01;
    while(1)
    {
       PORTA = 0x01;
       T0Delay();
       PORTA = 0x00;
       T0Delay();
    }
}
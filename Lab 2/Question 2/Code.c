void T0Delay() {
     TCNT0 = 0x00;
     TCCR0 = 0x01;
     while((TIFR&0x1) == 0);
     TIFR=0x1;
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
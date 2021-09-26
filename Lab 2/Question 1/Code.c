void main() {
    DDRA = 0x01;
    while(1)
    {
     PORTA = 0x01;
     Delay_ms(1);
     PORTA = 0x00;
     Delay_ms(1);
    }
}
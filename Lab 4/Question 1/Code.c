void main() {
   DDRA = DDRC = 0x01;
   SREG.b7 = 1;
   MCUCR = 0x03;
   GICR = 1<<INT0;
   while(1)
   {
    PORTC ^= 0x01;
    Delay_ms(1000);
   }
}

void INT0_VECT() org 0x002
{
 PORTC = 0x00;
 PORTA = 0x01;
 Delay_ms(500);
 PORTA = 0x00;
 Delay_ms(500);
 PORTA = 0x01;
 Delay_ms(500);
 PORTA = 0x00;
 Delay_ms(500);
}
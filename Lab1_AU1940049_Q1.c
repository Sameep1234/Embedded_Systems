void main() {
     int i;
     DDRA = 0xF0;
     DDRB = 0x55;
     while(1) {
              PORTA = 0xF0;
              PORTB = 0x55;
              for(i = 0;i<50000;i++) {}
              PORTA = 0x00;
              PORTB = 0x00;
              for(i = 0;i<50000;i++) {}
     }
}
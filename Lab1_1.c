void main() {
    int i;
    DDRA = 0x01;
    while(1) {
             PORTA = 0x01;
             for(i = 0;i<10000;i++){}
             PORTA = 0x00;
             for(i = 0;i<10000;i++) {}

    }
}
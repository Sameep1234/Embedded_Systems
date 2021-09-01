void main() {
// Question 0
// Turn on LED on PORTA
// A.0 is thus output
int i;
DDRA = 0x01;         // Starts from LSB

while(1) {
         // Make A.0 1
         PORTA = 0x01;
         // Delay and then A.0 = 0
         for(i = 0;i<50000;i++) { }
         PORTA = 0x00;
         for(i = 0;i<50000;i++) { }
         PORTA = 0x01;
}
}
#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 2/Question 1/Code.c"
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

#line 1 "C:/Users/Sameep/Desktop/AU/ESD/Lab 1/Question 4/Code.c"
int i;
void main() {
 DDRA = 0x0F;
 while(1)
 {
 if(PINA.b4 == 1)
 {
 for(i=0;i<=15;i++)
 {
 PORTA = i;
 if(PINA.b4 == 0)
 {
 i=0;
 break;
 }
 }
 }
 }
}

// Convert packed BCD 0x29 to ASCII and display on PORTB and PORTC.
// Two ports because there are two numbers. Hence one on PORTB and other on PORTC.
#include<avr/io.h>

void main() {
	unsigned char x,y;
	unsigned char requiredNumber = 0x29;
	DDRB = 0xFF;
	DDRC = 0xFF;
	
	x=requiredNumber & 0x0F; // Will return 0x09
	PORTB = x | 0x30; // Will return 0x39
	y=requiredNumber & 0xF0; // Will return 0x20
	y=y>>4; // Shifting right to get 0x02
	PORTC=y | 0x30; // Will return 0x32
}

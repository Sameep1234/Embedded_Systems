// Convert ASCII digits of '4' and '7' to packed BCD and display them on PORTB
#include<avr/io.h>

void main() {
	DDRB = 0xFF;
	
	unsigned char four = 0x34;
	unsigned char seven = 0x37;
	unsigned char temp;
	
	// This is not required as anyways we are going to shift 4 bits to the left.
	four = four & 0x0F; // Will return 0x04.
	
	
	
	
	seven = seven & 0x0F // Will return 0x07
	four = four<<4; // Will return 0x40
	temp = four | seven; // Will return 0x47
	
	PORTB = temp; // Display on PORTB
}

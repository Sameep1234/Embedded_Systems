// Get data from PORTB, add 5 to it and display it on PORTC.

#include<avr/io.h>

void main() {
	int temp;
	DDRB = 0x00;
	DDRC = 0xFF;
	
	while(1) {
		temp = PINB;
		PORTC = temp + 5;
	}
}

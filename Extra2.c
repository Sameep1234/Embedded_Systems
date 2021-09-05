// Get data from PORTC, display on PORTB if it is less than 100, else on PORTD
#include<avr/io.h>

void main() {
	int temp;
	DDRB = 0xFF;
	DDRC = 0x00;
	DDRD = 0xFF;
	
	while(1){
		temp = PINC;
		if(temp < 100) {
			PORTB=temp;
		} else {
			PORTD = temp;
		}
	}
}

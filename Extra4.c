// Send numbers -4 to 4 to PORTB but will delay of 100ms.
#include<avr/io.h>

void delay100ms() {
	int i;
	for(i=0;i<42150;i++);//This number may vary. Trial and error to check when 100ms has reached.
}

void main() {
	DDRB = 0xFF;
	
	while(1) {
		PORTB = 0xFF;
		delay100ms();
		PORTB = 0x55;
		delay100ms();
	}
}

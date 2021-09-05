// Send numbers -4 to +4 to PORTB
#include<avr/io.h>

void main() {
	int i;
	DDRB = 0xFF;
	for(i=-4;i<=4;i++) {
		PORTB = i;
	}
}

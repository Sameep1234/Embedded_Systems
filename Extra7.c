// Toggle bits on 4th Pin of PORTB continuously with delay of 70 microseconds. Use Timer0, normal mode and 1:8 prescaler. Frequency of clock is 8MHz.
#include<avr/io.h>

void T0Delay() {
    TCNT0 = 0xBA;
    TCCR0 = 0x02;
    while((TIFR & 0x1) == 0);
    TCCR0 = 0;
    TIFR = 0x1;
}

void main() {
	DDRB = 0x10;
	while(1)
	{
		PORTB = 0x10;
        T0Delay();
        PORTB = 0x00;
        T0Delay();
	}
}

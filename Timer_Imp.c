/*
	C program to toggle all the bits of PORTB continuously with some delay. Use Timer0, Normal mode, and no prescaler options to 
	generate the delay.
*/

#include<avr/io.h>
void T0Delay() {
	TCNT0 = 0x20; // Load TCNT0 (Timer Register with value '20')
	TCCR0 = 0x01; //Timer0, Normal Mode, no prescaler
	while((T1FR&0x1) == 0); //wait fro TF0 to roll over
	TCCR0 = 0;
	TIFR = 0x1; // clear TF0
}

int main() {
	DDRB = 0xFF; //PORTB is the output
	while(1) {
		PORTB = 0x55; //repeat forever
		T0Delay( ); //delay size unknown
		PORTB = 0xAA //repeat forever
		T0Delay( );
	}
}

/*
	NOTES: 

	1. TCCR = Timer/Counter Control Register (Decide which way of operation you would like to perform (like compare etc.))
	2. TOV = Timer Overflow (Turns on the overflow flag)
	3. TCNT = Timer/Counter Register
	4. OCR = Output compare register
	5. OCF = Output Compare Flag (Turns on the output compare flag)
*/

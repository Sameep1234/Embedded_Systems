#include<avr/io.h>

int main() {
	unsigned int temp1 = 0x34;
	unsigned int temp2 = 0x37;
	DDRB = 0xFF;
	while(1) {
		unsigned int msb = temp1 & 0x0F; //msb = 0x04
		unsigned int lsb = temp2 & 0x0F; //lsb = 0x07
		msb = msb << 4; // msb = 0x40. we can skip this
		PORTB = msb | lsb; //0x47
	}
	return 0;
}

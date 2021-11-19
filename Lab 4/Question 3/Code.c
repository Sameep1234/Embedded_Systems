int main()
{
    DDRA = DDRB = 0xFF;
    while(1)
    {
        PORTA = 0x08; // Display A
        PORTB.b0 = 1; // Enable pin
    }
    return 0;
}
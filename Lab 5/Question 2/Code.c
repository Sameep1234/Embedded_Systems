void main()
{
    DDRB = 0x01;
    while (1)
    {
        if (PINB.b1 == 1)
        {
            PORTB = 0x01;
        }
        else
        {
            PORTB = 0x00;
        }
    }
}
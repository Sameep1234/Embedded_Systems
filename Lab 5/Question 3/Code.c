void main()
{
    int flag = 0;
    DDRB = 0X04;

    while (1)
    {
        TCCR0 = 0x62;
        if (flag == 0)
        {
            OCR0 = 230;
            delay_ms(5000);
            flag = 1;
        }
        else
        {
            OCR0 = 63;
            delay_ms(5000);
            flag = 0;
        }
    }
}
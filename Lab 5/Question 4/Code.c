
void main()
{
    int flag = 0;
    DDRB = 0X08;

    while (1)
    {
        TCCR0 = 0x62;
        if (flag == 0)
        {
            OCR0 = 204;
            delay_ms(5000);
            flag = 1;
        }
        else
        {
            OCR0 = 90;
            delay_ms(5000);
            flag = 0;
        }
    }
}



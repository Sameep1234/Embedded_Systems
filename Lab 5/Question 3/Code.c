void main()
{
    DDRB = 0X08;
    OCR0 = 63;
    TCCR0 = 0X6A;
    while (1);
}
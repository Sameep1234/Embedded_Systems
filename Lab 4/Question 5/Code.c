int arr[] = {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
int count = 0;

void main()
{
    DDRA = DDRC = 0XFF;
    SREG.B7 = 1;
    MCUCR = 0x03;
    GICR = (1 << INT0);
    while (1)
    {
        int temp = count;
        PORTC = arr[temp % 10];
        temp /= 10;
        PORTA = arr[temp];
    }
}

void INT0_VECT() org 0x002
{
    if (count == 20)
    {
        count = 0;
    }
    count++;
}
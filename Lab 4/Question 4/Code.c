int arr[] = {0x90, 0x80, 0xF8, 0x82, 0x92, 0x99, 0xB0, 0xA4, 0xF9, 0xC0};
int i;
int main()
{
    DDRA = DDRB = 0xFF;

    while(1)
    {
        PORTB.b0 = 1;
        for(i=0;i<10;i++)
        {
            PORTA = arr[i];
            delay_ms(1000);
        }
    }
    return 0;
}
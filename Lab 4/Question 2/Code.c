int count = 0;
int left = 1;
void main()
{
    DDRA = 0x0F; //L is 2nd and R is 3rd
    DDRB = 0x00;
    GICR = 0xC0;
    MCUCR = 0xFF;
    SREG.b7 = 1;
    while (1)
    {
        if (left == 1)
        {

            for (count=0; count <= 3; count++)
            {
                PORTA =  1<<count;
                Delay_ms(500);
                if(left==0){
                break;
                }
            }
        }

        else
        {

           for (count=3; count >= 0; count--)
            {
                PORTA = 1<<count;
                Delay_ms(500);
                if(left==1){
                break;
                }
            }
        }
    }
}
void INT0_VECT() org 0x02
{
    left=1;

}
void INT1_VECT() org 0x04
{
    left=0;

}
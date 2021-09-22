void main() {
    int i;
    DDRA = 0x55;
    while(1)
    {
     if(PINA.b1 == 1)
     {
      PORTA.b0 = 1;
     }
     if(PINA.b3 == 1)
     {
      PORTA.b2 = 1;
     }
     if(PINA.b5 == 1)
     {
      PORTA.b4 = 1;
     }
     if(PINA.b7 == 1)
     {
      PORTA.b6 = 1;
     }
    }
}
#include "built_in.h"

int num = 13;
int segment_choicer = 1;
int num_mask[] = {0x3F,  0x06,  0x5B,  0x4F,  0x66,  0x6D,  0x7D,  0x07,  0x7F,  0x6F,  0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

unsigned short shifter, portd_index;
unsigned int   digit, i = 0, k;
unsigned short portd_array[4] = {0, 0, 0, 0};

int a, b, res; // task 2 vars
char * str, p_ch;

void Timer0Overflow_ISR() org IVT_ADDR_TIMER0_OVF {
  PORTA = 0;                             // Turn off all 7seg displays
  PORTC = portd_array[portd_index];      // bring appropriate value to PORTC
  PORTA = shifter;                       // turn on appropriate 7seg. display

  // move shifter to next digit
  shifter <<= 1;
  if (shifter > 8u)
    shifter = 1;

  // increment portd_index
  portd_index++ ;
  if (portd_index > 3u)
    portd_index = 0;            // turn on 1st, turn off 2nd 7seg.
}

void clear_portd()
{
  for (i = 0; i < 4; ++i)
  portd_array[i] = 0;
}

void num_changer(char * value)
{
   clear_portd();

  for (i = strlen(value); i >= 0; --i)
  {
     switch(value[i])
     {
       case 'a':
       case 'A':
         digit = num_mask[10];
         break;

       case 'b':
       case 'B':
         digit = num_mask[11];
         break;
         
       case 'c':
       case 'C':
         digit = num_mask[12];
         break;
         
       case 'd':
       case 'D':
         digit = num_mask[13];
         break;
         
       case 'e':
       case 'E':
         digit = num_mask[14];
         break;

       case 'f':
       case 'F':
         digit = num_mask[15];
         break;
       default:
         digit = num_mask[atoi(value[i])];
     }
     portd_array[i] = digit;
  }
}

void num_changer_with_dot(char * value, int dot_position)
{
  num_changer(value);
  
  portd_array[dot_position] |= 0x80;
}

void task1()
{
  clear_portd();
  while(1)
  {
    if (PINB7_bit)
       num_changer("0059");
    while(PINB7_bit);

    if (PINB6_bit)
       num_changer("4619");
    while(PINB6_bit);

    if (PINB5_bit)
       num_changer_with_dot("0403", 2);
    while(PINB5_bit);

    if (PINB4_bit)
       num_changer("17");
    while(PINB4_bit);

    if (PINB3_bit)
       num_changer("15");
    while(PINB3_bit);

    if (PINB2_bit)
       num_changer("110b");
    while(PINB2_bit);

    if (PINB1_bit)
    {
       for(k = 0; k <= 16; ++k)
       {
         digit = num_mask[k];
         portd_array[0] = digit;
         delay_ms(750);
       }
    }
    while(PINB1_bit);
    
    if (PINB0_bit)
     return;
    while(PINB0_bit);

  }
}

void task2()
{ // 15 вариант  - (2a^2 - 4b) / 5
  clear_portd();

  a = 10 + rand() % 10;
  digit = num_mask[a];
  portd_array[0] = digit;
  delay_ms(1000);

  
  b = 10 + rand() % 10;
  res = (2 * a * a - 4 * b) / 5;
  digit = num_mask[b];
  portd_array[0] = digit;
  delay_ms(1000);

  i = 0;
  
  while (res > 0)
  {
   digit = num_mask[res % 10];
   res /= 10;
   portd_array[i] = digit;
   i++;
  }
}

void task3()
{  // E 4
  clear_portd();

  portd_array[3] = num_mask[15];
  portd_array[0] = num_mask[4];
}

void task_picker()
{
  clear_portd();
  
  while(1)
  {
    if (PINB7_bit)
       task1();
    while(PINB7_bit);

    if (PINB6_bit)
       task2();
    while(PINB6_bit);

    if (PINB5_bit)
       task3();
    while(PINB5_bit);
   }
}

void main() {
     DDRA = 0x0f;
     PORTA = 0;
     DDRC = 0xff;
     PORTC = 0;
     DDRB = 0x00;   // input

     digit = 0;
     portd_index = 0;
     shifter = 1;
                 // Initial number value
     TCCR0 = 0x03;                 // ClkI/O/64 (From prescaler)
     
     SREG_I_bit = 1;               // Interrupt enable
     TOIE0_bit  = 1;               // Timer0 overflow interrupt enable
     
     task_picker();
}
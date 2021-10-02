#include "built_in.h"

int num = 13;
int segment_choicer = 1;
int num_mask[] = {0x3F,  0x06,  0x5B,  0x4F,  0x66,  0x6D,  0x7D,  0x07,  0x7F,  0x6F,  0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

unsigned short shifter, portd_index;
unsigned int   digit,  k ;
unsigned short portd_array[4] = {0, 0, 0, 0};

int  res, i = 0, a, b; // task 2 vars
char  ch;


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

  for (i = strlen(value) - 1; i >= 0; --i)
  {
     ch = value[i];
     switch(ch)
     {
       case '0':
       {
         digit = num_mask[0];
         break;
       }
       case '1':
       {
         digit = num_mask[1];
         break;
       }
       case '2':
        {
         digit = num_mask[2];
         break;
        }
       case '3':
        {
         digit = num_mask[3];
         break;
        }
       case '4':
         {
         digit = num_mask[4];
         break;
         }
       case '5':
         {
         digit = num_mask[5];
         break;
         }
        case '6':
         {
         digit = num_mask[6];
         break;
         }
       case '7':
         {
         digit = num_mask[7];
         break;
         }
       case '8':
         {
         digit = num_mask[8];
         break;
         }
       case '9':
         {
         digit = num_mask[9];
         break;
         }
       case 'a':
       case 'A':
         {
         digit = num_mask[10];
         break;
         }
       case 'b':
       case 'B':
         {
         digit = num_mask[11];
         break;
         }
       case 'c':
       case 'C':
         {
         digit = num_mask[12];
         break;
         }
       case 'd':
       case 'D':
         {
         digit = num_mask[13];
         break;
         }
       case 'e':
       case 'E':
         {
         digit = num_mask[14];
         break;
         }
       case 'f':
       case 'F':
         {
         digit = num_mask[15];
         break;
         }
       default:
         digit = num_mask[atoi(&value[i])];
     }
     portd_array[3 - i] = digit;
     //delay_ms(1000);
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
       num_changer("0013");
    while(PINB4_bit);

    if (PINB3_bit)
       num_changer("0015");
    while(PINB3_bit);

    if (PINB2_bit)
       num_changer("110b");
    while(PINB2_bit);

    if (PINB1_bit)
    {
       clear_portd();
       for(k = 0; k <= 15; ++k)
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

  a = rand() % 10;
  digit = num_mask[a];
  portd_array[0] = digit;
  delay_ms(1000);

  
  b = rand() % 10;
  digit = num_mask[b];
  portd_array[0] = digit;
  delay_ms(1000);

  i = 0;
  
  res = (2 * a * a - 4 * b) / 5;
  
  if(res < 0)
  {
    res *= -1;
    if (res / 10)
      portd_array[2] = 0x40;
    else
      portd_array[1] = 0x40;
  }
  
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
     PORTB = 0;

     digit = 0;
     portd_index = 0;
     shifter = 1;
                 // Initial number value
     TCCR0 = 0x03;                 // ClkI/O/64 (From prescaler)
     
     SREG_I_bit = 1;               // Interrupt enable
     TOIE0_bit  = 1;               // Timer0 overflow interrupt enable
     
     task_picker();
}
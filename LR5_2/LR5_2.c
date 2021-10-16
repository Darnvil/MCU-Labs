#include "built_in.h"

unsigned int adc_rd;
char message[] = "ADC:";
int arr[4];
int i = 0;
int converted;
char c [5];


int num_mask[] = {0x3F,  0x06,  0x5B,  0x4F,  0x66,  0x6D,  0x7D,  0x07,  0x7F,  0x6F,  0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

unsigned short shifter, portd_index;
unsigned int   digit,  k ;
unsigned short portd_array[4] = {0, 0, 0, 0};



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

void clear_portd(int l)
{
  for (; l < 4; ++l)
  portd_array[l] = 0;
}

void main()
{
      DDRB = 0xFF;
      DDRC = 0xFF;               // set PORTC as output
      DDRA = 0x0F;



      digit = 0;
      portd_index = 0;
      shifter = 1;
      TCCR0 = 0x03;                 // ClkI/O/64 (From prescaler)

      SREG_I_bit = 1;               // Interrupt enable
      TOIE0_bit  = 1;               // Timer0 overflow interrupt enable

      while(1)
      {

       adc_rd = ADC_Read(5);
       PORTB = adc_rd;
       converted = adc_rd / 1.564;
       while (converted > 0)
       {
        digit = num_mask[converted % 10];
        converted /= 10;
        portd_array[i] = digit;
        clear_portd(i + 1);
        i++;
       }
       //PORTD = hi(adc_rd);
       i = 0;
      }
}


#include "built_in.h"

int num = 13;
int segment_choicer = 1;
int num_mask[] = {0x3F,  0x06,  0x5B,  0x4F,  0x66,  0x6D,  0x7D,  0x07,  0x7F,  0x6F };

unsigned short shifter, portd_index;
unsigned int   digit, number, i = 0;
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


void main() {
     DDRA = 0x0f;
     PORTA = 0;
     DDRC = 0xff;
     PORTC = 0;
     
     
     digit = 0;
     portd_index = 0;
     shifter = 1;
                 // Initial number value

     TCCR0 = 0x03;                 // ClkI/O/64 (From prescaler)
     
     SREG_I_bit = 1;               // Interrupt enable
     TOIE0_bit  = 1;               // Timer0 overflow interrupt enable
     
     while(num > 0)
     {
       digit = num_mask[num % 10];
       num /= 10;
       portd_array[i] = digit;
       i++;
     }
}
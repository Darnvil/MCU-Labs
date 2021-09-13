#line 1 "C:/Users/Kolba/Desktop/Микропроцессорные системы/2Sem/LR1/LR1.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for avr/include/built_in.h"
#line 3 "C:/Users/Kolba/Desktop/Микропроцессорные системы/2Sem/LR1/LR1.c"
int num = 13;
int segment_choicer = 1;
int num_mask[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F };

unsigned short shifter, portd_index;
unsigned int digit, number, i = 0;
unsigned short portd_array[4] = {0, 0, 0, 0};

void Timer0Overflow_ISR() org IVT_ADDR_TIMER0_OVF {
 PORTA = 0;
 PORTC = portd_array[portd_index];
 PORTA = shifter;


 shifter <<= 1;
 if (shifter > 8u)
 shifter = 1;


 portd_index++ ;
 if (portd_index > 3u)
 portd_index = 0;
}


void main() {
 DDRA = 0x0f;
 PORTA = 0;
 DDRC = 0xff;
 PORTC = 0;


 digit = 0;
 portd_index = 0;
 shifter = 1;


 TCCR0 = 0x03;

 SREG_I_bit = 1;
 TOIE0_bit = 1;

 while(num > 0)
 {
 digit = num_mask[num % 10];
 num /= 10;
 portd_array[i] = digit;
 i++;
 }
}

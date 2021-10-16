#line 1 "Z:/gitProj/MCU-Labs/LR5_2/LR5_2.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for avr/include/built_in.h"
#line 3 "Z:/gitProj/MCU-Labs/LR5_2/LR5_2.c"
unsigned int adc_rd;
char message[] = "ADC:";
int arr[4];
int i = 0;
int converted;
char c [5];


int num_mask[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

unsigned short shifter, portd_index;
unsigned int digit, k ;
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

void clear_portd(int l)
{
 for (; l < 4; ++l)
 portd_array[l] = 0;
}

void main()
{
 DDRB = 0xFF;
 DDRC = 0xFF;
 DDRA = 0x0F;



 digit = 0;
 portd_index = 0;
 shifter = 1;
 TCCR0 = 0x03;

 SREG_I_bit = 1;
 TOIE0_bit = 1;

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

 i = 0;
 }
}

#line 1 "Z:/gitProj/MCU-Labs/LR5/LR5.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for avr/include/built_in.h"
#line 5 "Z:/gitProj/MCU-Labs/LR5/LR5.c"
sbit LCD_RS at PORTA2_bit;
sbit LCD_EN at PORTD6_bit;
sbit LCD_D4 at PORTC4_bit;
sbit LCD_D5 at PORTC5_bit;
sbit LCD_D6 at PORTC6_bit;
sbit LCD_D7 at PORTC7_bit;

sbit LCD_RS_Direction at DDA2_bit;
sbit LCD_EN_Direction at DDD6_bit;
sbit LCD_D4_Direction at DDC4_bit;
sbit LCD_D5_Direction at DDC5_bit;
sbit LCD_D6_Direction at DDC6_bit; sbit LCD_D7_Direction at DDC7_bit;

unsigned int adc_rd;
char message[] = "ADC:";
int arr[4];
int i = 1;
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

void clear_portd()
{
 for (i = 0; i < 4; ++i)
 portd_array[i] = 0;
}

void task1()
{
 TCCR0 = 0x03;

 SREG_I_bit = 1;
 TOIE0_bit = 1;

 while(1)
 {

 while (acd > 0)
 {
 digit = num_mask[acd % 10];
 adc_rd /= 10;
 portd_array[i] = digit;
 i++;
 }
 }
}

void task2()
{

}

void task_picker()
{
 while(1)
 {

 if(PORTB7_bit)
 {
 task1();
 }
 while (PORTB7_bit);

 if (PORTB6_bit)
 {
 task2();
 }
 while(PORTB6_bit);
 }
}

void main() {
 DDRB = 0x00;
 DDRC = 0xFF;
 DDRA = 0x0F;

 PORTB = 0x00;

 digit = 0;
 portd_index = 0;
 shifter = 1;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 while (1)
 {
 Lcd_Out(1,6,message);
 adc_rd = ADC_Read(5);
 PORTB = adc_rd;
 converted = adc_rd / 1.564;
 IntToStr(converted, c);

 Lcd_Out(2,6,c);
 Delay_ms (100);
 Lcd_Cmd(_LCD_CLEAR);
 PORTC =  ((char *)&adc_rd)[1] ;
 }

}

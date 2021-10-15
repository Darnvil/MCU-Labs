#include <built_in.h>


// LCD module connections
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
int old_max = 1023, new_max = 645, old_min = 0, new_min = 0, old_range, new_range;

int get_converted_value(unsigned int value_to_convert)
{
    int new_value = (((value_to_convert - old_min) * new_range) / old_range) + new_min;
    return new_value;
}

void main() {
     DDRB = 0xFF;               // set PORTC as output
     DDRC = 0xFF;               // set PORTC as output

     Lcd_Init();                        // Initialize LCD
     Lcd_Cmd(_LCD_CLEAR);               // Clear display
     Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

     old_range = old_max - old_min;
     new_range = new_max - new_min;

     while (1){
           Lcd_Out(1,6,message);
           adc_rd = ADC_Read(5)/1;
           PORTB = adc_rd;
           converted = get_converted_value(adc_rd);
           IntToStr(converted, c);

           Lcd_Out(2,6,c);
           Delay_ms (100);
           Lcd_Cmd(_LCD_CLEAR);
           PORTC = Hi(adc_rd);
     }
}
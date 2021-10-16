#line 1 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for AVR/Examples/Development systems/EasyAVR7/USB UART/USB_UART.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for avr/include/built_in.h"
#line 4 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for AVR/Examples/Development systems/EasyAVR7/USB UART/USB_UART.c"
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
sbit LCD_D6_Direction at DDC6_bit;
sbit LCD_D7_Direction at DDC7_bit;

char uart_rd;
char ch[2];

void main() {
 DDRB = 0x00;
 PORTB =0x00;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_FIRST_ROW);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 UART1_Init(9600);
 Delay_ms(100);

 UART1_Write_Text("Init");
 UART1_Write(13);
 UART1_Write(10);

 ch[1] = '\0';

 while (1) {
 if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();

 ch[0] = uart_rd;

 Lcd_Out_Cp(ch);
 UART1_Write(uart_rd);
 }
 if(PINB7_bit)
 {
 Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 Lcd_Chr_Cp(' ');
 Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 }
 while(PINB7_bit);

 if(PINB6_bit)
 {
 Lcd_Cmd(_LCD_CLEAR);
 }
 while(PINB6_bit);
 }
}

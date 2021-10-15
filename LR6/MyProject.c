#include <built_in.h>

// All Variables

char current_char_at_UART;
char* readedText;
int lcd_row_max = 4, lcd_columns_max = 10;   // not correct
int lcd_row, lcd_columns;

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
sbit LCD_D6_Direction at DDC6_bit;
sbit LCD_D7_Direction at DDC7_bit;





void main() {

     Lcd_Init();
     Lcd_Cmd(_LCD_CLEAR);               // Clear display
     Lcd_Cmd(_LCD_FIRST_ROW);           // Move cursor to the 1st row
     //Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
     
     UART1_Init(9600);               // Initialize UART module at 9600 bps
     Delay_ms(100);                  // Wait for UART module to stabilize
     while(1)
     {
         if(UART1_Data_Ready())
         {
             if(lcd_row % (lcd_row_max + 1) == 0)
             {
                 Lcd_Cmd(_LCD_FIRST_ROW);           // Move cursor to the 1st row
                 lcd_row = 0;
                 lcd_columns = 0;
             }
             
             
             current_char_at_UART = UART_Read();
             Lcd_Chr_CP(current_char_at_UART);
             Delay_ms(700);
             
             // Add 1 to local rows and columns
             lcd_row++;
             lcd_columns++;
         }
     }



}
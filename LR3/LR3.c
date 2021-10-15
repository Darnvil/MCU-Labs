
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
// End LCD module connections


int arr[10] = {9, 73, 62, 48, 55, 93, 40, 12, 32, 74};
char txt1[];
char txt2[];
int i,max,min;


void main() {
   Lcd_Init(); //
   Lcd_Cmd(_LCD_CURSOR_OFF); //
}

void task2(){
     max = -1;
     min = 100;
    Lcd_Cmd(_LCD_CLEAR);
    for(i = 0; i<10;i++){
       if (arr[i] > max){
          max = arr[i];
       } else if(arr[i] < min){
         min = arr[i];
       }
    }
    Lcd_Out(1,2,txt1);
}


void task1_1(){
   Lcd_Cmd(_LCD_CLEAR); //
   txt1 = "Ульянов А.И.";
   txt2 = "04.09.2000"
   Lcd_Out(1,2,txt1); //
   Lcd_Out(2,4,txt2); //
}
void task1_2(){
   Lcd_Cmd(_LCD_CLEAR); //
   txt1 = "Hello!";
   txt2 = "15.10.2021"
   Lcd_Out(1,4,txt1); //
   Lcd_Out(2,4,txt2); //
}
void task1_3(){
   Lcd_Cmd(_LCD_CLEAR); //
   txt1 = "ул. Тёплый Стан";
   txt2 = "м. Юго-Западная"
   Lcd_Out(1,1,txt1); //
   Lcd_Out(2,1,txt2); //
}
void task1_4(){
   Lcd_Cmd(_LCD_CLEAR); //
   txt1 = "№23; Микропроц.";
   txt2 = "системы"
   Lcd_Out(1,1,txt1); //
   Lcd_Out(2,4,txt2); //
}
void task1_5(){
   Lcd_Cmd(_LCD_CLEAR); //
   txt1 = "Информатика и";
   txt2 = "выч. техника"
   Lcd_Out(1,1,txt1); //
   Lcd_Out(2,1,txt2); //
}
void task1_6(){
   Lcd_Cmd(_LCD_CLEAR); //
   txt1 = "Выч. машины";
   txt2 = "комплексы"
   Lcd_Out(1,1,txt1); //
   Lcd_Out(2,1,txt2); //
   Delay_ms(1000);
   Lcd_Cmd(_LCD_CLEAR);
   txt1 = "системы и сети";
   Lcd_Out(1,1,txt1); //
   Delay_ms(1000);
}
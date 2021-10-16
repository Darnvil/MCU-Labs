
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
   char txt1[] = "Ulyanov A. I.";
   char txt2[] = "04.09.2000";
   char txt3[] = "Hello!";
   char txt4[] = "15.10.2021";
   char txt5[] = "Tepliy Stan st.";
   char txt6[] = "Yugo-Zapadnaya";
   char txt7[] = "#23; Microproc.";
   char txt8[] = "systems";
   char txt9[] = "Informatics and";
   char txt10[] = "Comp. Machines";
   char txt11[] = "Comp. machines";
   char txt12[] = "Complexes";
   char txt13[] = "Systems and Nets";
int i;
int mIn_, max_;



void task2(){
     max_ = arr[0];
     min_ = arr[0];
    Lcd_Cmd(_LCD_CLEAR);
    for(i = 0; i<10;i++){
       if (arr[i] > max_){
          max_ = arr[i];
       } 
       if(arr[i] < min_){
         min_ = arr[i];
       }
    }
    Lcd_Out(1,2,txt1);
}
void task3(){
    Lcd_Out_CP(500);
}

void task1_1(){
   Lcd_Cmd(_LCD_CLEAR); //

   Lcd_Out(1,2,txt1); //
   Lcd_Out(2,4,txt2); //
}
void task1_2(){
   Lcd_Cmd(_LCD_CLEAR); //

   Lcd_Out(1,4,txt3); //
   Lcd_Out(2,4,txt4); //
}
void task1_3(){
   Lcd_Cmd(_LCD_CLEAR); //
   Lcd_Out(1,1,txt5); //
   Lcd_Out(2,1,txt6); //
}
void task1_4(){
   Lcd_Cmd(_LCD_CLEAR); //

   Lcd_Out(1,1,txt7); //
   Lcd_Out(2,4,txt8); //
}
void task1_5(){
   Lcd_Cmd(_LCD_CLEAR); //

   Lcd_Out(1,1,txt9); //
   Lcd_Out(2,1,txt10); //
}
void task1_6(){
   while(1)
   {
     Lcd_Cmd(_LCD_CLEAR); //

     Lcd_Out(1,1,txt11); //
     Lcd_Out(2,1,txt12); //
     Delay_ms(1000);
     
     if(PINB0_bit)
      return;
      
     Lcd_Cmd(_LCD_CLEAR);

     Lcd_Out(1,1,txt13); //
     Delay_ms(1000);
     
     if(PINB0_bit)
      return;
    }
}

void task1()
{
   while(1)
   {
    if(PINB7_bit)
    {
      task1_1();
    }
    while(PINB7_bit);
    
    if(PINB6_bit)
    {
      task1_2();
    }
    while(PINB6_bit);
    
    if(PINB5_bit)
    {
      task1_3();
    }
    while(PINB5_bit);
    
    if(PINB4_bit)
    {
      task1_4();
    }
    while(PINB4_bit);
    
    if(PINB3_bit)
    {
      task1_5();
    }
    while(PINB3_bit);
    
    if(PINB2_bit)
    {
      task1_6();
    }
    while(PINB2_bit);
    
    if(PINB0_bit)
    {
      return;
    }
    while(PINB0_bit);
   }
}

void task_picker()
{   
    while(1)
    {
      if(PINB7_bit)
      {
        task1();
      }
      while(PINB7_bit);

      if(PINB6_bit)
      {
        task2();
      }
      while(PINB6_bit);

      if(PINB5_bit)
      {
        task3();
      }
      while(PINB5_bit);
    }
}


void main() {
   DDRB = 0x00;
   DDRC = 0xFF;
   PORTB = 0x00;
   
   Lcd_Init(); //
   //Lcd_Cmd(_LCD_CURSOR_OFF); //

   task_picker();
}
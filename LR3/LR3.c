
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

char character[8];
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
   char text[]="The next station is RTU MIREA";   //29
   char text1[16];
int i,j,a,b,res;
int mIn_, max_;
int temp = 0;
int xx[13] = {0, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640, 704, 768};
int F;
char ch;

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
    Lcd_Out_CP("Max = ");
    Lcd_Out_CP(max_);
    Lcd_Out_CP("; Min = ");
    Lcd_Out_CP(min_);
}
void task3(){
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Out_CP("(2a^2 - 4b)/5\n");
    Lcd_Out_CP(500);
     a = rand() % 10;
     b = rand() % 10;
     res = (2 * a * a - 4 * b) / 5;
     Lcd_Out_CP("A=");
     Lcd_Out_CP(a);
     Lcd_Out_CP(" B=");
     Lcd_Out_CP("b");
     Lcd_Out_CP("; ");
     Lcd_Out_CP(res);
}

void Pixels(int F){
   switch(F){
      case 1:
         character[2] = 16;
         character[3] = 16;
         character[4] = 16;
         character[5] = 16;
         break;
      case 2:
         character[2] = 24;
         character[3] = 24;
         character[4] = 24;
         character[5] = 24;
         break;
      case 3:
         character[2] = 28;
         character[3] = 28;
         character[4] = 28;
         character[5] = 28;
         break;
      case 4:
         character[2] = 30;
         character[3] = 30;
         character[4] = 30;
         character[5] = 30;
         break;
      default:
         character[2] = 31;
         character[3] = 31;
         character[4] = 31;
         character[5] = 31;
   }

}

void CustomChar(int F) {
     Lcd_Cmd(64);
     for (j=0;F>0;j+=4) {
     Pixels(F);
     for (ch = 2; ch<=5; ch++) Lcd_Chr_CP(character[ch]);
     Lcd_Cmd(_LCD_RETURN_HOME);
     Lcd_Chr(0, j, 0);
     F-=4;
     }
}

void task4(){
 //F = abs(2*x-768)
   F = abs(2*xx[rand()%12]-768)/16;
   Lcd_Cmd(_LCD_CLEAR);
   CustomChar(F);
}


void task5(){
   i = 0;
   while(1)
    {
     Lcd_Cmd(_LCD_CLEAR);
     for (i = 0; i < 16; i++)
    {
      text1[i] = text[i+temp%29];
    }
    Lcd_Out(1,1,text1);
    delay_ms(1000);
    temp++;
    if (temp == 22) temp = 0;
    }
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
      if(PINB4_bit)
      {
        task4();
      }
      while(PINB4_bit);
      if(PINB3_bit)
      {
        task5();
      }
      while(PINB3_bit);
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
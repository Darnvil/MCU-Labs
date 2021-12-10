#line 1 "Z:/gitProj/MCU-Labs/LR3/LR3.c"

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


const char character16[8] = { 0, 0, 16, 16, 16, 16, 0, 0 };
const char character24[8] = { 0, 0, 24, 24, 24, 24, 0, 0 };
const char character28[8] = { 0, 0, 28, 28, 28, 28, 0, 0 };
const char character30[8] = { 0, 0, 30, 30, 30, 30, 0, 0 };
const char character31[8] = { 0, 0, 31, 31, 31, 31, 0, 0 };
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
 char text[]="The next station is RTU MIREA";
 char text1[16];
int i,j,a,b,res;
int min_, max_;
int temp = 0;
int xx[13] = {0, 64, 128, 192, 256, 320, 384, 448, 512, 576, 640, 704, 768};
int F;
char ch;
char ch_p[3];
int cmd = 64;

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
 IntToStr(max_, ch_p);

 Lcd_Out_CP(ch_p + 4);
 Lcd_Out_CP(";");
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Out_CP("Min = ");
 IntToStr(min_, ch_p);
 Lcd_Out_CP(ch_p + 4);
}
void task3(){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out_CP("(2a^2 - 4b)/5");
 Lcd_Cmd(_LCD_SECOND_ROW);
 a = rand() % 10;
 b = rand() % 10;
 res = (2 * a * a - 4 * b) / 5;
 Lcd_Out_CP("A=");
 IntToStr(a, ch_p);
 Lcd_Out_CP(ch_p + 4);
 Lcd_Out_CP(" B=");
 IntToStr(b, ch_p);
 Lcd_Out_CP(ch_p + 4);
 Lcd_Out_CP("; ");
 IntToStr(res, ch_p);
 Lcd_Out_CP(ch_p + 4);
}

void Pixels(int F){
#line 107 "Z:/gitProj/MCU-Labs/LR3/LR3.c"
}

void CustomChar(int F_1) {


 a = 0;
 for (j=1;F_1>0;j++) {

 switch(F_1){
 case 1:

 cmd = 96;
 a = 4;

 break;
 case 2:

 cmd = 88;
 a = 3;

 break;
 case 3:

 cmd = 80;
 a = 2;

 break;
 case 4:

 cmd = 72;
 a = 1;

 break;
 default:

 cmd = 64;
 a = 0;

 }

 Lcd_Cmd(cmd);
 for (ch = 0; ch<=7; ch++)
 {
 switch(F_1){
 case 1:

 Lcd_Chr_CP(character16[ch]);


 break;
 case 2:

 Lcd_Chr_CP(character24[ch]);


 break;
 case 3:

 Lcd_Chr_CP(character28[ch]);


 break;
 case 4:

 Lcd_Chr_CP(character30[ch]);


 break;
 default:

 Lcd_Chr_CP(character31[ch]);


 }

 }

 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(1, j, a);

 F_1 -=5;

 }



}

void task4(){


 F = abs(2*xx[rand()%12]-768);

 Lcd_Cmd(_LCD_CLEAR);
 cmd = 64;



 CustomChar(F/16);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Cmd(_LCD_SECOND_ROW);
 IntToStr(F, ch_p);
 Lcd_Out_CP(ch_p );
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
 Delay_ms(400);
 temp++;
 if (temp == 22) temp = 0;
 }
}

void task1_1(){
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,2,txt1);
 Lcd_Out(2,4,txt2);
}
void task1_2(){
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,4,txt3);
 Lcd_Out(2,4,txt4);
}
void task1_3(){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt5);
 Lcd_Out(2,1,txt6);
}
void task1_4(){
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,1,txt7);
 Lcd_Out(2,4,txt8);
}
void task1_5(){
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,1,txt9);
 Lcd_Out(2,1,txt10);
}
void task1_6(){
 while(1)
 {
 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,1,txt11);
 Lcd_Out(2,1,txt12);
 Delay_ms(1000);

 if(PINB0_bit)
 return;

 Lcd_Cmd(_LCD_CLEAR);

 Lcd_Out(1,1,txt13);
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

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 task_picker();
}

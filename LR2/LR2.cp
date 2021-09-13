#line 1 "C:/Users/Kolba/Desktop/Микропроцессорные системы/2Sem/LR2/LR2.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for avr/include/built_in.h"
#line 3 "C:/Users/Kolba/Desktop/Микропроцессорные системы/2Sem/LR2/LR2.c"
int i = 4;

const int length = 9;
int j = 0;
int sequence[] = { 1, 5, 20, 80, 192, 160, 40, 10, 3 };

void task1()
{
 DDRB = 0xFF;

 do
 {
 while (i>0)
 {
 PORTB = i;
 Delay_ms(500);
 i/=2;
 }
 i = 4;
 } while(1);
}

void task2()
{
 DDRD = 0xFF;
 while(1)
 {
 while (j < 9)
 {
 PORTD = sequence[j];
 Delay_ms(1000);
 j++;
 }
 j--;
 while (j > 0)
 {
 PORTD = sequence[j];
 Delay_ms(1000);
 j--;
 }
 }
}

void main() {
 task2();
}

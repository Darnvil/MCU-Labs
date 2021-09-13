#line 1 "F:/Programs/mikroC PRO for AVR/Examples/Lab4/Lab4.c"
#line 1 "f:/programs/mikroc pro for avr/include/built_in.h"
#line 10 "F:/Programs/mikroC PRO for AVR/Examples/Lab4/Lab4.c"
int num_mask[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

unsigned short shifter, portd_index;
unsigned int digit, number, i = 0, loop_index = 0;
unsigned short portd_array[4] = {0, 0, 0, 0};

const int length = 9;
int j = 0;
int sequence[] = {1, 5, 20, 80, 192, 160, 40, 10, 3};

void Timer0Overflow_ISR() org IVT_ADDR_TIMER0_OVF
{
 PORTA = 0;
 PORTC = portd_array[portd_index];
 PORTA = shifter;


 shifter <<= 1;
 if (shifter > 8u)
 shifter = 1;


 portd_index++;
 if (portd_index > 3u)
 portd_index = 0;
}

void enter_value_to_portd_array(int value)
{
 while (value > 0)
 {
 digit = num_mask[value % 10];
 value /= 10;
 portd_array[i] = digit;
 i++;
 }
}

void task1()
{
 DDRD = 0xFF;
 while (1)
 {
 while (j < 9)
 {
 PORTD = sequence[j];
 enter_value_to_portd_array(PORTD);
 Sound_Play(1397, 100);
 Delay_ms(1000);
 j++;
 }
 Sound_Play(440, 100);
 j--;
 while (j > 0)
 {
 PORTD = sequence[j];
 enter_value_to_portd_array(PORTD);
 Sound_Play(1318, 100);
 Delay_ms(1000);
 j--;
 }
 }
}

void d5(int duration)
{
 Sound_Play(1244, duration);
}

void e5(int duration)
{
 Sound_Play(1318, duration);
}
void f5(int duration)
{
 Sound_Play(1396, duration);
}
void g5(int duration)
{
 Sound_Play(1568, duration);
}
void a5(int duration)
{
 Sound_Play(1720, duration);
}
void ad5(int duration)
{
 Sound_Play(1865, duration);
}

void h5(int duration)
{
 Sound_Play(1975, duration);
}

void play_popular_song()
{
 d5( 240000 / 146  / 4 );
 g5( 240000 / 146  / 4 );
 h5( 240000 / 146  / 8 );
 a5( 240000 / 146  / 2 );
 Delay_ms( 240000 / 146  / 8 );
 f5( 240000 / 146  / 8 );
 f5( 240000 / 146  / 8 );
 f5( 240000 / 146  / 16 );
 e5( 240000 / 146  / 16 );
 d5( 240000 / 146  / 8 );
 f5( 240000 / 146  / 8 );
 f5( 240000 / 146  / 8 );
 f5( 240000 / 146  / 16 );
 e5( 240000 / 146  / 16 );
 d5( 240000 / 146  / 16 );
 Delay_ms( 240000 / 146  / 16 );
 g5( 240000 / 146  / 16 );
 a5( 240000 / 146  / 16 );
 ad5( 240000 / 146  / 16 );
 Delay_ms( 240000 / 146  / 16 );
 g5( 240000 / 146  / 16 );
 a5( 240000 / 146  / 16 );
 ad5( 240000 / 146  / 16 );
 Delay_ms( 240000 / 146  / 16 );
 g5( 240000 / 146  / 16 );
 a5( 240000 / 146  / 16 );
 ad5( 240000 / 146  / 16 );
 Delay_ms( 240000 / 146  / 2 );
 d5( 240000 / 146  / 4 );
 g5( 240000 / 146  / 4 );
 ad5( 240000 / 146  / 8 );
 a5( 240000 / 146  / 2 );
 Delay_ms( 240000 / 146  / 8 );
 d5( 240000 / 146  / 4 );
 g5( 240000 / 146  / 4 );
 ad5( 240000 / 146  / 8 );
 a5( 240000 / 146  / 2 );
 Delay_ms( 240000 / 146  / 8 );
 f5( 240000 / 146  / 8 );
 f5( 240000 / 146  / 8 );
 f5( 240000 / 146  / 16 );
 e5( 240000 / 146  / 16 );
 d5( 240000 / 146  / 8 );
 f5( 240000 / 146  / 8 );
 f5( 240000 / 146  / 8 );
 f5( 240000 / 146  / 16 );
 e5( 240000 / 146  / 16 );
 d5( 240000 / 146  / 16 );
 Delay_ms( 240000 / 146  / 16 );
 ad5( 240000 / 146  / 8 );
 g5( 240000 / 146  / 8 );
}

void main()
{

 {
 DDRA = 0x0f;
 PORTA = 0;
 DDRC = 0xff;
 PORTC = 0;

 digit = 0;
 portd_index = 0;
 shifter = 1;

 TCCR0 = 0x03;

 SREG_I_bit = 1;
 TOIE0_bit = 1;

 Sound_Init(&PORTB, 1);
 }

 task1();

 play_popular_song();
}

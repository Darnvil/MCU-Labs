#include <built_in.h>

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
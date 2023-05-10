/*
 * CounterDemo.c
 *
 * Created: 12/24/2022 6:46:00 PM
 * Author : hp
 */ 

#define F_CPU 1000000
#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    /* Replace with your application code */
	DDRD = 0b00001111;
	DDRA = 0b00000000;
	unsigned char count = 0;
    while (1) 
    {
		if((PINA & 0b00000001) == 1){
			count++;
			if(count == 16)	count = 0;
			PORTD = count;
			_delay_ms(1000);
		}
    }
}


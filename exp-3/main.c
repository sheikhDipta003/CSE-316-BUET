/*
 * ADC.c
 *
 * Created: 1/15/2023 7:15:11 PM
 * Author : hp
 */ 

#ifndef F_CPU
#define F_CPU 16000000UL // 16 MHz clock speed
#endif

#define D4 eS_PORTD4
#define D5 eS_PORTD5
#define D6 eS_PORTD6
#define D7 eS_PORTD7
#define RS eS_PORTC6
#define EN eS_PORTC7
#define _VREF 3.76			//LDR_max * 5 / (LDR_max + R1)
#define RES (1<<10)			//resolution of n-bit ADC = 2^n

#include <avr/io.h>
#include <stdlib.h>
#include <util/delay.h>
#include "lcd.h"

int main(void)
{
	char str[15];				//output voltage in string format
	unsigned char high,low;		//stores the values of ADCH and ADCL
	unsigned int adc;			//internally converted digital value from atmega32
	
	DDRD = 0xFF;
	DDRC = 0xFF;
	
	ADMUX  = 0b00100000;
	ADCSRA = 0b10000000;

	Lcd4_Init();				//initialize LCD module
	
	while(1)
	{
		Lcd4_Set_Cursor(1,1);				//set position in the screen of LCD module where the reading will be shown
		
		ADCSRA |= (1<<ADSC);
		
		while(ADCSRA & (1<<ADSC)) {;}
		
		low = ADCL;
		high = ADCH;
		
		adc = high;
		adc = adc << 8;
		adc |= low;
		adc = adc >> 6;
		
		float v_approx = adc * _VREF / RES;
		
		dtostrf(v_approx,3, 2, str);			//dtostrf(float_value, min_width, num_digits_after_decimal, where_to_store_string)
		Lcd4_Write_String("Voltage:");
		Lcd4_Write_String(str);
	}
	
	
	//for testing LCD
	//DDRD = 0xFF;
	//DDRC = 0xFF;
	//Lcd4_Init();
	//while(1)
	//{
	//Lcd4_Set_Cursor(1,1);
	//Lcd4_Write_String("Hello World");
	//}
}


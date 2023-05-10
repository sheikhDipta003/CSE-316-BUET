#define F_CPU 1000000UL
#define D4 eS_PORTD4
#define D5 eS_PORTD5
#define D6 eS_PORTD6
#define D7 eS_PORTD7
#define RS eS_PORTC6
#define EN eS_PORTC7
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdio.h>
#include "lcd.h"
#define ACK 0x7E

void spi_init_slave (void)
{
	DDRB=(1<<DDB4);                                  //MISO as OUTPUT
	SPCR=(1<<SPE);                                //Enable SPI
}

//Function to send and receive data
char spi_tranceiver (char data)
{
	SPDR = data;                                  //Load data into buffer
	while(!(SPSR & (1<<SPIF) ));                  //Wait until transmission complete
	return(SPDR);                                 //Return received data
}

int main(void)
{
	DDRD = 0xFF;
	DDRC = 0xFF;
	Lcd4_Init();
	spi_init_slave();                             //Initialize slave SPI
	char data ,buffer[10];
	while(1)
	{
		data = spi_tranceiver(ACK);               //Receive data, send ACK
		sprintf(buffer, "%c", data);
		Lcd4_Set_Cursor(0,1);
		Lcd4_Write_String(buffer);                         //Display received data
		_delay_ms(20);                            //Wait
	}
}
//Steps to use interrupt:
//1. Include header file <avr\interrupt.h>.
//2. Use C macro ISR() to declare the interrupt handler and update IVT. (INT0_vect, INT1_vect, INT2_vect)
//3. Specify what type of events will trigger the interrupt by setting relevant registers. (MCUCR for INT0, MCUCSRA for INT1 and INT2)
//4. Enable the specific interrupt. (GICR register)
//5. Enable the interrupt subsystem globally using sei(). (Set Global Interrupt)


#define F_CPU 1000000

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

void uart_init()
{
	UCSRA = 0b00000000;
	UCSRB = 0b00111000;
	UCSRC = 0b10000110;
	
	UBRRH = 0;
	UBRRL = 12;
}

void uart_send(unsigned char data){
	while ((UCSRA & (1<<UDRE)) == 0x00);
	UDR = data;
}

unsigned char uart_receive(void){
	while ((UCSRA & (1<<RXC)) == 0x00);
	return UDR;
}

//ISR(INT0_vect){
	//uart_send('a');
//}

int main(void)
{
	uart_init();
	_delay_ms(1000);
	
	//GICR = (1 << INT0);
	//MCUCR = MCUCR & (~(1 << ISC01));
	//MCUCR = MCUCR & (~(1 << ISC00));
	//sei();
	
	while(1)
	{
		for(char c = 'a'; c <= 'z'; c++) {
			uart_send(c);
			_delay_ms(1000);
		}
	}
}

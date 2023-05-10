/*
 * led_matrix.c
 *
 * Created: 12/24/2022 7:49:07 PM
 * Author : hp
 */ 

#define F_CPU 1000000
#include <avr/io.h>
#include <util/delay.h>

#define NUM_LETTERS 26
#define SIZE 8
#define OFF_COLUMN 0xFF

//stores the state of 8 column pins for each row in led matrix to display corresponding symbol
char cols_alpha[][SIZE] = {
	{0x00,0x18,0x24,0x7e,0x42,0x42,0x00,0x00},	//A
	{0x00,0x38,0x28,0x30,0x28,0x38,0x00,0x00},	//B
	{0x00,0x18,0x20,0x20,0x20,0x18,0x00,0x00},	//C
	{0x00,0x38,0x24,0x24,0x24,0x38,0x00,0x00},	//D
	{0x00,0x3c,0x20,0x38,0x20,0x3c,0x00,0x00},	//E
	{0x00,0x3c,0x20,0x38,0x20,0x20,0x00,0x00},	//F
	{0x00,0x38,0x40,0x40,0x5c,0x54,0x34,0x00},	//G
	{0x00,0x00,0x24,0x24,0x3c,0x24,0x24,0x00},	//H
	{0x00,0x00,0x38,0x10,0x10,0x10,0x38,0x00},	//I
	{0x00,0x38,0x08,0x08,0x28,0x18,0x00,0x00},	//J
	{0x00,0x24,0x28,0x30,0x30,0x28,0x24,0x00},	//K
	{0x00,0x20,0x20,0x20,0x20,0x38,0x00,0x00},	//L
	{0x00,0x00,0x22,0x36,0x2a,0x22,0x22,0x00},	//M
	{0x00,0x22,0x32,0x2a,0x26,0x22,0x00,0x00},	//N
	{0x00,0x1c,0x22,0x22,0x22,0x22,0x1c,0x00},	//O
	{0x00,0x38,0x24,0x24,0x38,0x20,0x20,0x00},	//P
	{0x00,0x3c,0x42,0x42,0x4a,0x44,0x3a,0x00},	//Q
	{0x00,0x3c,0x24,0x24,0x38,0x28,0x24,0x00},	//R
	{0x00,0x3c,0x20,0x20,0x18,0x04,0x04,0x3c},	//S
	{0x00,0x7c,0x10,0x10,0x10,0x10,0x00,0x00},	//T
	{0x00,0x22,0x22,0x22,0x22,0x1c,0x00,0x00},	//U
	{0x00,0x00,0x00,0x81,0x42,0x24,0x18,0x00},	//V
	{0x00,0x41,0x41,0x41,0x49,0x55,0x22,0x00},	//W
	{0x00,0x00,0x44,0x28,0x10,0x28,0x44,0x00},	//X
	{0x00,0x00,0x44,0x28,0x10,0x10,0x10,0x00},	//Y
	{0x00,0x3c,0x04,0x08,0x10,0x20,0x3c,0x00}	//Z
};

int left_rotate_cell(int n, int d){
	return (n << d) | (n >> (SIZE - d));
}

int right_rotate_cell(int n, int d){
	return (n >> d) | (n << (SIZE - d));
}

int main(void)
{
    DDRA = 0xFF;	//row
	DDRD = 0xFF;	//column
	int alpha_no = 0, cell_no = 0, render_count = 0;	//render_count -> in order to fix the duration that each letter is displayed for (2ms x 250 = 500ms)
	int k = 0;											//keeps count of number of iterations of the outermost while loop
	char rotate_mode = 'u';								//direction of rotation : 'u','r','d','l'
		
    while (1) 
    {
		//display all the letters one by one with 500ms duration
		//for(render_count = 0; render_count < 250; render_count++){		//sets a row pin in led matrix at each iteration
			//PORTA = 1<<cell_no;		//Each cell in cols_alpha matrix corresponds to the state of 8 column pins for that row pin in led matrix
			//PORTD = ~cols_alpha[alpha_no][cell_no];
			//_delay_ms(2);
			//cell_no = (cell_no + 1) % SIZE;
		//}
		//alpha_no++;
		//if(alpha_no >= NUM_LETTERS){
			//alpha_no = 0;
			//cell_no = 0;
		//}
		
		//flash a letter, i.e display it for some time, then make it disappear before displaying it again and so on
		for(render_count = 0; render_count < 250; render_count++){		//sets a row pin in led matrix at each iteration
			PORTA = 1<<cell_no;		//Each cell in cols_alpha matrix corresponds to the state of 8 column pins for that row pin in led matrix
			if(k % 2 == 0)	PORTD = ~cols_alpha[alpha_no][cell_no];
			else	PORTD = OFF_COLUMN;
			_delay_ms(2);
			cell_no = (cell_no + 1) % SIZE;
		}
		
		//rotate a letter
		//for(render_count = 0; render_count < 250; render_count++)
		//{
			//if(rotate_mode == 'u'){
				//PORTA = 1 << ((cell_no + SIZE - k) % SIZE);
				//PORTD = ~cols_alpha[alpha_no][cell_no];
			//}
			//else if(rotate_mode == 'r'){
				//PORTA = 1 << cell_no;
				//PORTD = ~right_rotate_cell(cols_alpha[alpha_no][cell_no], k);
			//}
			//else if(rotate_mode == 'd'){
				//PORTA = 1 << ((cell_no + SIZE + k) % SIZE);
				//PORTD = ~cols_alpha[alpha_no][cell_no];
			//}
			//else if(rotate_mode == 'l'){
				//PORTA = 1 << cell_no;
				//PORTD = ~left_rotate_cell(cols_alpha[alpha_no][cell_no], k);
			//}
			//_delay_ms(2);
			//cell_no = (cell_no + 1) % SIZE;
		//}
		
		k = (k + 1) % SIZE;
    }
}


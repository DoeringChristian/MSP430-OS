
#include "os.h"

char buffer[10];
uint16_t buffcount = 0;

void switch_on(){
	while(1){
		__delay_cycles(100000);
		P1OUT = 0x01;
	}
	
}

void switch_off(){
	while(1){
		__delay_cycles(150000);
		P1OUT = 0x00;	
	}
}


/**
 * main.c
 */
void main(void){
	

	P1DIR = 0xff;
	P1OUT = 0x00;

	
	os_push_task(switch_on);
	os_push_task(switch_off);
	

	os_init();
	
	
}




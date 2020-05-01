#include "os.h"

struct os_task *os_current_task = NULL;

void os_init_timer(){
    WDTCTL = WDTPW | WDTHOLD;		// stop watchdog timer
	CCTL0 = CCIE;                             // CCR0 interrupt enabled
  	TACTL = TASSEL_2 + MC_1 + ID_3;           // SMCLK/8, upmode  
  	CCR0 =  20;                           // 12.5 Hz   
}

void os_init(){

	os_init_timer();

	OS_MTUNLOCK;

	r1 = os_current_task->sp;
	OS_POP_REGISTERS;
	asm("incd r1\n\t");
}

void os_task_init(struct os_task *self, void (*func)(void *args)){
    self->sp = (uint16_t)(&self->stack[(OS_STACK_SIZE-4)-OS_REGISTERS*sizeof(uint16_t)]);
	*((uint16_t*)(&self->stack[OS_STACK_SIZE-sizeof(uint16_t)])) = (uint16_t)((uint16_t*)func);
	*((uint16_t*)(&self->stack[OS_STACK_SIZE-sizeof(uint16_t)*2])) = OS_DEFAULT_SR;
}



void os_push_task(void (*func)(void *args)){
    OS_MTLOCK;
    if(os_current_task == NULL){
        os_current_task = malloc(sizeof(struct os_task));
        os_current_task->next = os_current_task;
        os_task_init(os_current_task, func);
    }
    else{
        struct os_task *tmp = os_current_task->next;
        os_current_task->next = malloc(sizeof(struct os_task));
        os_current_task->next->next = tmp;
        os_task_init(os_current_task->next, func);
    }
    OS_MTUNLOCK;
}

__attribute__( ( __interrupt__( TIMER0_A0_VECTOR ), __naked__ ) ) void Timer_A (void){
    OS_PUSH_REGISTERS;
	os_current_task->sp = r1;

	//sheduler (round robin)
	os_current_task = os_current_task->next;

	r1 = os_current_task->sp;
	OS_POP_REGISTERS;
    asm("reti");
}
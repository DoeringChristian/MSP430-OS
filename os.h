#ifndef OS_H
#define OS_H
#include <inttypes.h>
#include <msp430g2553.h>
#include <stdlib.h>


#define OS_PUSH_REGISTERS\
	asm("push r4 \n\t" \
		"push r5 \n\t" \
		"push r6 \n\t" \
		"push r7 \n\t" \
		"push r8 \n\t" \
		"push r9 \n\t" \
		"push r10 \n\t" \
		"push r11 \n\t" \
		"push r12 \n\t" \
		"push r13 \n\t" \
		"push r14 \n\t" \
		"push r15 \n\t" \
	)
#define OS_POP_REGISTERS\
	asm("pop r15 \n\t" \
		"pop r14 \n\t" \
		"pop r13 \n\t" \
		"pop r12 \n\t" \
		"pop r11 \n\t" \
		"pop r10 \n\t" \
		"pop r9 \n\t" \
		"pop r8 \n\t" \
		"pop r7 \n\t" \
		"pop r6 \n\t" \
		"pop r5 \n\t" \
		"pop r4 \n\t" \
	)
#define OS_STACK_SIZE 50
#define OS_REGISTERS 12
#define OS_DEFAULT_SR  ((uint16_t)0x0048) 
#define OS_MTLOCK __disable_interrupt()
#define OS_MTUNLOCK __enable_interrupt();

struct os_task{
	uint16_t sp;
    uint8_t alive;
	struct os_task *next;
	uint8_t stack[OS_STACK_SIZE];
};

extern struct os_task *os_current_task;
register uint16_t r1 asm("r1");

void os_init_timer();
void os_init();



void os_task_init(struct os_task *self, void (*func)(void *args));
void os_push_task(void (*func)(void *args));




#endif //OS_H
	.file	"os.c"
	.arch msp430g2553
	.cpu 430
	.mpy none

	.text
.Ltext0:
	.section	.text.Timer_A,"ax",@progbits
	.p2align 1,0
.global	Timer_A
	.type	Timer_A,@function
/***********************
 * Interrupt Vector 9 Service Routine `Timer_A' 
 ***********************/
Timer_A:
.global	__isr_9
__isr_9:
.LFB2:
	.file 1 "os.h"
	.loc 1 55 0
	.loc 1 56 0
#APP
 ;  56 "os.h" 1
	push r4 
	push r5 
	push r6 
	push r7 
	push r8 
	push r9 
	push r10 
	push r11 
	push r12 
	push r13 
	push r14 
	push r15 
	
 ;  0 "" 2
	.loc 1 57 0
#NOAPP
	mov	&os_current_task, r15
	mov	r1, @r15
	.loc 1 60 0
	mov	4(r15), r15
	mov	r15, &os_current_task
	.loc 1 62 0
	mov	@r15, r1
	.loc 1 63 0
#APP
 ;  63 "os.h" 1
	pop r15 
	pop r14 
	pop r13 
	pop r12 
	pop r11 
	pop r10 
	pop r9 
	pop r8 
	pop r7 
	pop r6 
	pop r5 
	pop r4 
	
 ;  0 "" 2
	.loc 1 64 0
 ;  64 "os.h" 1
	reti
 ;  0 "" 2
	.loc 1 65 0
#NOAPP
.LIRD0:
.LFE2:
.Lfe1:
	.size	Timer_A,.Lfe1-Timer_A
;; End of function 

	.section	.text.os_init_timer,"ax",@progbits
	.p2align 1,0
.global	os_init_timer
	.type	os_init_timer,@function
/***********************
 * Function `os_init_timer' 
 ***********************/
os_init_timer:
.LFB3:
	.file 2 "os.c"
	.loc 2 5 0
	.loc 2 6 0
	mov	#23168, &__WDTCTL
	.loc 2 7 0
	mov	#16, &__TA0CCTL0
	.loc 2 8 0
	mov	#720, &__TA0CTL
	.loc 2 9 0
	mov	#10000, &__TA0CCR0
	.loc 2 10 0
	ret
.LFE3:
.Lfe2:
	.size	os_init_timer,.Lfe2-os_init_timer
;; End of function 

	.section	.text.os_init,"ax",@progbits
	.p2align 1,0
.global	os_init
	.type	os_init,@function
/***********************
 * Function `os_init' 
 ***********************/
os_init:
.LFB4:
	.loc 2 12 0
	.loc 2 14 0
	call	#os_init_timer
	.loc 2 16 0
	eint
	.loc 2 18 0
	mov	&os_current_task, r15
	mov	@r15, r1
	.loc 2 19 0
#APP
 ;  19 "os.c" 1
	pop r15 
	pop r14 
	pop r13 
	pop r12 
	pop r11 
	pop r10 
	pop r9 
	pop r8 
	pop r7 
	pop r6 
	pop r5 
	pop r4 
	
 ;  0 "" 2
	.loc 2 20 0
 ;  20 "os.c" 1
	incd r1
	
 ;  0 "" 2
	.loc 2 21 0
#NOAPP
	ret
.LFE4:
.Lfe3:
	.size	os_init,.Lfe3-os_init
;; End of function 

	.section	.text.os_task_init,"ax",@progbits
	.p2align 1,0
.global	os_task_init
	.type	os_task_init,@function
/***********************
 * Function `os_task_init' 
 ***********************/
os_task_init:
.LFB5:
	.loc 2 23 0
.LVL0:
	.loc 2 24 0
	mov	r15, r13
	add	#28, r13
	mov	r13, @r15
	.loc 2 25 0
	mov	r14, 54(r15)
	.loc 2 26 0
	mov	#72, 52(r15)
	.loc 2 27 0
	ret
.LFE5:
.Lfe4:
	.size	os_task_init,.Lfe4-os_task_init
;; End of function 

	.section	.text.os_push_task,"ax",@progbits
	.p2align 1,0
.global	os_push_task
	.type	os_push_task,@function
/***********************
 * Function `os_push_task' 
 ***********************/
os_push_task:
.LFB6:
	.loc 2 31 0
.LVL1:
	push	r11
.LCFI0:
	push	r10
.LCFI1:
	push	r9
.LCFI2:
	mov	r15, r10
	.loc 2 32 0
	dint
	nop
	.loc 2 33 0
	mov	&os_current_task, r11
	cmp	#0, r11
	jne	.L6
.LVL2:
	.loc 2 34 0
	mov	#56, r15
	call	#malloc
	mov	r15, r13
	mov	r15, &os_current_task
	.loc 2 35 0
	mov	r15, 4(r13)
	.loc 2 36 0
	mov	r10, r14
	jmp	.L8
.L6:
.LBB2:
	.loc 2 39 0
	mov	4(r11), r9
.LVL3:
	.loc 2 40 0
	mov	#56, r15
	call	#malloc
.LVL4:
	mov	r15, 4(r11)
	.loc 2 41 0
	mov	r9, 4(r15)
	.loc 2 42 0
	mov	r10, r14
	mov	4(r11), r15
.LVL5:
.L8:
	call	#os_task_init
.LBE2:
	.loc 2 44 0
	eint
	.loc 2 45 0
	pop	r9
	pop	r10
.LVL6:
	pop	r11
	ret
.LFE6:
.Lfe5:
	.size	os_push_task,.Lfe5-os_push_task
;; End of function 

.global	os_current_task
	.section	.bss.os_current_task,"aw",@nobits
	.p2align 1,0
	.type	os_current_task,@object
	.size	os_current_task,2
os_current_task:
	.skip 2,0
	.section	.debug_frame,"",@progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -2
	.byte	0
	.byte	0xc
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x80
	.uleb128 0x1
	.p2align 1,0
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.2byte	.LFB2
	.2byte	.LFE2-.LFB2
	.p2align 1,0
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.2byte	.LFB3
	.2byte	.LFE3-.LFB3
	.p2align 1,0
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.2byte	.LFB4
	.2byte	.LFE4-.LFB4
	.p2align 1,0
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.2byte	.LFB5
	.2byte	.LFE5-.LFB5
	.p2align 1,0
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.2byte	.LFB6
	.2byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI0-.LFB6
	.byte	0xe
	.uleb128 0x4
	.byte	0x8b
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x6
	.byte	0x8a
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x4
	.p2align 1,0
.LEFDE8:
	.text
.Letext0:
	.file 3 "/home/doeringc/Documents/home/c/msp430/hardware/tools/msp430/bin/../lib/gcc/msp430/4.6.3/../../../../msp430/include/stdint.h"
	.file 4 "/home/doeringc/Documents/home/c/msp430/hardware/tools/msp430/bin/../lib/gcc/msp430/4.6.3/../../../../msp430/include/msp430g2553.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1ed
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x2
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x1
	.4byte	.LASF30
	.4byte	.LASF31
	.2byte	0
	.2byte	0
	.4byte	.Ldebug_ranges0+0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x3
	.byte	0x2b
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x3
	.byte	0x2c
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF10
	.uleb128 0x5
	.4byte	.LASF32
	.byte	0x38
	.byte	0x1
	.byte	0x2a
	.4byte	0xc5
	.uleb128 0x6
	.string	"sp"
	.byte	0x1
	.byte	0x2b
	.4byte	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x1
	.byte	0x2c
	.4byte	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0x2d
	.4byte	0xc5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0x2e
	.4byte	0xcb
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0
	.uleb128 0x8
	.byte	0x2
	.4byte	0x81
	.uleb128 0x9
	.4byte	0x41
	.4byte	0xdb
	.uleb128 0xa
	.4byte	0x5e
	.byte	0x31
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF33
	.byte	0x1
	.byte	0x37
	.byte	0x1
	.2byte	.LFB2
	.2byte	.LFE2
	.byte	0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0xc
	.byte	0x1
	.4byte	.LASF14
	.byte	0x2
	.byte	0x5
	.2byte	.LFB3
	.2byte	.LFE3
	.byte	0x2
	.byte	0x71
	.sleb128 2
	.uleb128 0xc
	.byte	0x1
	.4byte	.LASF15
	.byte	0x2
	.byte	0xc
	.2byte	.LFB4
	.2byte	.LFE4
	.byte	0x2
	.byte	0x71
	.sleb128 2
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF18
	.byte	0x2
	.byte	0x17
	.byte	0x1
	.2byte	.LFB5
	.2byte	.LFE5
	.byte	0x2
	.byte	0x71
	.sleb128 2
	.4byte	0x138
	.uleb128 0xe
	.4byte	.LASF16
	.byte	0x2
	.byte	0x17
	.4byte	0xc5
	.byte	0x1
	.byte	0x5f
	.uleb128 0xe
	.4byte	.LASF17
	.byte	0x2
	.byte	0x17
	.4byte	0x146
	.byte	0x1
	.byte	0x5e
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.4byte	0x144
	.uleb128 0x10
	.4byte	0x144
	.byte	0
	.uleb128 0x11
	.byte	0x2
	.uleb128 0x8
	.byte	0x2
	.4byte	0x138
	.uleb128 0x12
	.byte	0x1
	.4byte	.LASF19
	.byte	0x2
	.byte	0x1f
	.byte	0x1
	.2byte	.LFB6
	.2byte	.LFE6
	.4byte	.LLST0
	.4byte	0x186
	.uleb128 0x13
	.4byte	.LASF17
	.byte	0x2
	.byte	0x1f
	.4byte	0x146
	.4byte	.LLST1
	.uleb128 0x14
	.2byte	.LBB2
	.2byte	.LBE2
	.uleb128 0x15
	.string	"tmp"
	.byte	0x2
	.byte	0x27
	.4byte	0xc5
	.4byte	.LLST2
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x217
	.4byte	.LASF22
	.4byte	0x198
	.byte	0x1
	.byte	0x1
	.uleb128 0x17
	.4byte	0x5e
	.uleb128 0x16
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x219
	.4byte	.LASF23
	.4byte	0x198
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x221
	.4byte	.LASF25
	.4byte	0x198
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x38a
	.4byte	.LASF27
	.4byte	0x198
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF28
	.byte	0x2
	.byte	0x3
	.4byte	0xc5
	.byte	0x1
	.byte	0x3
	.byte	0x3
	.2byte	os_current_task
	.uleb128 0x19
	.string	"r1"
	.byte	0x1
	.byte	0x32
	.4byte	0x53
	.byte	0x1
	.byte	0x1
	.byte	0x51
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.2byte	.LFB6
	.2byte	.LCFI0
	.2byte	0x2
	.byte	0x71
	.sleb128 2
	.2byte	.LCFI0
	.2byte	.LCFI1
	.2byte	0x2
	.byte	0x71
	.sleb128 4
	.2byte	.LCFI1
	.2byte	.LCFI2
	.2byte	0x2
	.byte	0x71
	.sleb128 6
	.2byte	.LCFI2
	.2byte	.LFE6
	.2byte	0x2
	.byte	0x71
	.sleb128 8
	.2byte	0
	.2byte	0
.LLST1:
	.2byte	.LVL1
	.2byte	.LVL2
	.2byte	0x1
	.byte	0x5f
	.2byte	.LVL2
	.2byte	.LVL6
	.2byte	0x1
	.byte	0x5a
	.2byte	0
	.2byte	0
.LLST2:
	.2byte	.LVL3
	.2byte	.LVL4-1
	.2byte	0x2
	.byte	0x7b
	.sleb128 4
	.2byte	.LVL4-1
	.2byte	.LVL5
	.2byte	0x1
	.byte	0x59
	.2byte	0
	.2byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x20
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x2
	.byte	0
	.2byte	.LFB2
	.2byte	.LFE2-.LFB2
	.2byte	.LFB3
	.2byte	.LFE3-.LFB3
	.2byte	.LFB4
	.2byte	.LFE4-.LFB4
	.2byte	.LFB5
	.2byte	.LFE5-.LFB5
	.2byte	.LFB6
	.2byte	.LFE6-.LFB6
	.2byte	0
	.2byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.2byte	.LFB2
	.2byte	.LFE2
	.2byte	.LFB3
	.2byte	.LFE3
	.2byte	.LFB4
	.2byte	.LFE4
	.2byte	.LFB5
	.2byte	.LFE5
	.2byte	.LFB6
	.2byte	.LFE6
	.2byte	0
	.2byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF22:
	.string	"__TA0CTL"
.LASF28:
	.string	"os_current_task"
.LASF18:
	.string	"os_task_init"
.LASF21:
	.string	"TA0CCTL0"
.LASF33:
	.string	"Timer_A"
.LASF23:
	.string	"__TA0CCTL0"
.LASF31:
	.string	"/home/doeringc/Documents/home/c/msp430/msp430-base"
.LASF19:
	.string	"os_push_task"
.LASF17:
	.string	"func"
.LASF2:
	.string	"long long int"
.LASF27:
	.string	"__WDTCTL"
.LASF29:
	.string	"GNU C 4.6.3 20120301 (mspgcc LTS 20120406 unpatched)"
.LASF1:
	.string	"long int"
.LASF20:
	.string	"TA0CTL"
.LASF3:
	.string	"unsigned char"
.LASF0:
	.string	"signed char"
.LASF16:
	.string	"self"
.LASF8:
	.string	"long long unsigned int"
.LASF6:
	.string	"unsigned int"
.LASF5:
	.string	"uint16_t"
.LASF13:
	.string	"stack"
.LASF9:
	.string	"short unsigned int"
.LASF10:
	.string	"char"
.LASF24:
	.string	"TA0CCR0"
.LASF14:
	.string	"os_init_timer"
.LASF32:
	.string	"os_task"
.LASF15:
	.string	"os_init"
.LASF7:
	.string	"long unsigned int"
.LASF11:
	.string	"alive"
.LASF30:
	.string	"os.c"
.LASF26:
	.string	"WDTCTL"
.LASF25:
	.string	"__TA0CCR0"
.LASF4:
	.string	"uint8_t"
.LASF12:
	.string	"next"

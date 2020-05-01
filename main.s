	.file	"main.c"
	.arch msp430g2553
	.cpu 430
	.mpy none

	.text
.Ltext0:
	.section	.text.switch_on,"ax",@progbits
	.p2align 1,0
.global	switch_on
	.type	switch_on,@function
/***********************
 * Function `switch_on' 
 ***********************/
switch_on:
.LFB3:
	.file 1 "main.c"
	.loc 1 6 0
.L2:
	.loc 1 8 0 discriminator 1
	mov.b	#1, &__P1OUT
	jmp	.L2
.LFE3:
.Lfe1:
	.size	switch_on,.Lfe1-switch_on
;; End of function 

	.section	.text.switch_off,"ax",@progbits
	.p2align 1,0
.global	switch_off
	.type	switch_off,@function
/***********************
 * Function `switch_off' 
 ***********************/
switch_off:
.LFB4:
	.loc 1 12 0
.L4:
	.loc 1 14 0 discriminator 1
	mov.b	#0, &__P1OUT
	jmp	.L4
.LFE4:
.Lfe2:
	.size	switch_off,.Lfe2-switch_off
;; End of function 

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
	.file 2 "os.h"
	.loc 2 55 0
	.loc 2 56 0
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
	.loc 2 57 0
#NOAPP
	mov	&os_current_task, r15
	mov	r1, @r15
	.loc 2 60 0
	mov	4(r15), r15
.LVL0:
	mov	r15, &os_current_task
.LVL1:
	.loc 2 62 0
	mov	@r15, r1
	.loc 2 63 0
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
	.loc 2 64 0
 ;  64 "os.h" 1
	reti
 ;  0 "" 2
	.loc 2 65 0
#NOAPP
.LIRD0:
.LFE2:
.Lfe3:
	.size	Timer_A,.Lfe3-Timer_A
;; End of function 

	.section	.init9,"ax",@progbits
	.p2align 1,0
.global	main
	.type	main,@function
/***********************
 * Function `main' 
 ***********************/
main:
.LFB5:
	.loc 1 20 0
	.loc 1 23 0
	mov.b	#llo(-1), &__P1DIR
	.loc 1 24 0
	mov.b	#0, &__P1OUT
	.loc 1 27 0
	mov	#switch_on, r15
	call	#os_push_task
	.loc 1 28 0
	mov	#switch_off, r15
	call	#os_push_task
	.loc 1 31 0
	call	#os_init
	.loc 1 34 0
.LIRD1:
.LFE5:
.Lfe4:
	.size	main,.Lfe4-main
;; End of function 

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
	.2byte	.LFB3
	.2byte	.LFE3-.LFB3
	.p2align 1,0
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.2byte	.LFB4
	.2byte	.LFE4-.LFB4
	.p2align 1,0
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.2byte	.LFB2
	.2byte	.LFE2-.LFB2
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
	.text
.Letext0:
	.file 3 "/home/doeringc/Documents/home/c/msp430/hardware/tools/msp430/bin/../lib/gcc/msp430/4.6.3/../../../../msp430/include/stdint.h"
	.file 4 "/home/doeringc/Documents/home/c/msp430/hardware/tools/msp430/bin/../lib/gcc/msp430/4.6.3/../../../../msp430/include/msp430g2553.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x159
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x2
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x1
	.4byte	.LASF24
	.4byte	.LASF25
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
	.4byte	.LASF26
	.byte	0x38
	.byte	0x2
	.byte	0x2a
	.4byte	0xc5
	.uleb128 0x6
	.string	"sp"
	.byte	0x2
	.byte	0x2b
	.4byte	0x53
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x2
	.byte	0x2c
	.4byte	0x41
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x2
	.byte	0x2d
	.4byte	0xc5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x2
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
	.4byte	.LASF14
	.byte	0x1
	.byte	0x6
	.2byte	.LFB3
	.2byte	.LFE3
	.byte	0x2
	.byte	0x71
	.sleb128 2
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF15
	.byte	0x1
	.byte	0xc
	.2byte	.LFB4
	.2byte	.LFE4
	.byte	0x2
	.byte	0x71
	.sleb128 2
	.uleb128 0xc
	.byte	0x1
	.4byte	.LASF16
	.byte	0x2
	.byte	0x37
	.byte	0x1
	.2byte	.LFB2
	.2byte	.LFE2
	.byte	0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0xc
	.byte	0x1
	.4byte	.LASF17
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.2byte	.LFB5
	.2byte	.LFE5
	.byte	0x2
	.byte	0x71
	.sleb128 0
	.uleb128 0xd
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x1da
	.4byte	.LASF20
	.4byte	0x12b
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.4byte	0x4c
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x1dc
	.4byte	.LASF21
	.4byte	0x12b
	.byte	0x1
	.byte	0x1
	.uleb128 0xf
	.4byte	.LASF22
	.byte	0x2
	.byte	0x31
	.4byte	0xc5
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.string	"r1"
	.byte	0x2
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x2
	.byte	0
	.2byte	.LFB3
	.2byte	.LFE3-.LFB3
	.2byte	.LFB4
	.2byte	.LFE4-.LFB4
	.2byte	.LFB2
	.2byte	.LFE2-.LFB2
	.2byte	.LFB5
	.2byte	.LFE5-.LFB5
	.2byte	0
	.2byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.2byte	.LFB3
	.2byte	.LFE3
	.2byte	.LFB4
	.2byte	.LFE4
	.2byte	.LFB2
	.2byte	.LFE2
	.2byte	.LFB5
	.2byte	.LFE5
	.2byte	0
	.2byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF16:
	.string	"Timer_A"
.LASF1:
	.string	"long int"
.LASF13:
	.string	"stack"
.LASF21:
	.string	"__P1DIR"
.LASF26:
	.string	"os_task"
.LASF14:
	.string	"switch_on"
.LASF3:
	.string	"unsigned char"
.LASF7:
	.string	"long unsigned int"
.LASF20:
	.string	"__P1OUT"
.LASF9:
	.string	"short unsigned int"
.LASF22:
	.string	"os_current_task"
.LASF15:
	.string	"switch_off"
.LASF17:
	.string	"main"
.LASF19:
	.string	"P1DIR"
.LASF6:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF4:
	.string	"uint8_t"
.LASF18:
	.string	"P1OUT"
.LASF2:
	.string	"long long int"
.LASF24:
	.string	"main.c"
.LASF23:
	.string	"GNU C 4.6.3 20120301 (mspgcc LTS 20120406 unpatched)"
.LASF12:
	.string	"next"
.LASF5:
	.string	"uint16_t"
.LASF25:
	.string	"/home/doeringc/Documents/home/c/msp430/msp430-base"
.LASF10:
	.string	"char"
.LASF0:
	.string	"signed char"
.LASF11:
	.string	"alive"

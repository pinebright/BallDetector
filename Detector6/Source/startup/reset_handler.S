	.syntax unified
	.arch armv7-m
	
	.text
	.thumb
	.thumb_func
	.align 2
	.globl	Reset_Handler
	.type	Reset_Handler, %function
Reset_Handler:
/* Loop to copy data from read only memory to RAM. The ranges                 *
 * of copy from/to are specified by following symbols evaluated in            *
 * linker script.                                                             *
 * __etext: End of code section, i.e., begin of data sections to copy from.   *
 * __data_start__/__data_end__: RAM address range that data should be         *
 * copied to. Both must be aligned to 4 bytes boundary.                       */
	
	ldr	r1, =__etext
	ldr	r2, =__data_start__
	ldr	r3, =__data_end__
	
#if 1
/* Here are two copies of loop implemenations. First one favors code size
 * and the second one favors performance. Default uses the first one.
 * Change to "#if 0" to use the second one */
.LC0:
	cmp	 r2, r3
	ittt lt
	ldrlt r0, [r1], #4
	strlt r0, [r2], #4
	blt .LC0
#else
	subs r3, r2
	ble .LC1
.LC0:
	subs r3, #4
	ldr r0, [r1, r3]
	str r0, [r2, r3]
	bgt .LC0
.LC1:
#endif

#ifdef __STARTUP_CLEAR_BSS
/*	 This part of work usually is done in C library startup code. Otherwise,
 *	 define this macro to enable it in this startup.
 *
 *	 Loop to zero out BSS section, which uses following symbols
 *	 in linker script:
 *	  __bss_start__: start of BSS section. Must align to 4
 *	  __bss_end__: end of BSS section. Must align to 4
 */
	ldr r1, =__bss_start__
	ldr r2, =__bss_end__

	movs r0, 0
.LC2:
	cmp r1, r2
	itt lt
	strlt r0, [r1], #4
	blt .LC2
#endif /* __STARTUP_CLEAR_BSS */
	bl init
	bl _start
	.pool
	.size Reset_Handler, . - Reset_Handler
	
	.end
	
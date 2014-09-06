	.syntax unified
	.arch armv7-m
	
	.section .stack
	.align 3
#ifdef __STACK_SIZE
	.equ Stack_Size, __STACK_SIZE
#else
	.equ Stack_Size, 0x00000400
#endif
	.globl __StackTop
	.globl __StackLimit
__StackLimit:
	.space	Stack_Size
	.size __StackLimit, . - __StackLimit
__StackTop:
	.size __StackTop, . - __StackTop
	
	.end

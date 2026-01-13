bits 64

global ft_strcmp
	ft_strcmp:
		xor al, al;									initialised al
		xor rcx, rcx;								initialised rcx to 0
	
	.loop:
		mov al, byte [rdi + rcx];						we can't cmp a memory to memory that why we need to put in a register
		mov bl, byte [rsi + rcx];

		cmp	al, 0
		je	.end_function ; 							Jump if equal 0 to end_function
		cmp	bl, 0
		je	.end_function
		cmp al, bl
		jne	.end_function

		inc	rcx
		jmp	.loop

	.end_function: ;									return a 8bits memory = char
		movzx eax, al
		movzx ebx, bl

		sub eax, ebx
		ret

section .note.GNU-stack noalloc noexec nowrite progbits

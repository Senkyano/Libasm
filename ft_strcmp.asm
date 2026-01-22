bits 64

global ft_strcmp
	ft_strcmp:
		xor rax, rax;									initialised al
		xor rcx, rcx;								initialised rcx to 0
		test	rdi,	rdi
		jz		.first_null
		test	rsi,	rsi
		jz		.second_null
	
	.loop:
		movzx rax, byte [rdi + rcx];						we can't cmp a memory to memory that why we need to put in a register
		movzx r8, byte [rsi + rcx];

		test	rax,	rax
		jz		.done ; 							Jump if equal 0 to end_function
		cmp		rax, r8
		jne		.done

		inc	rcx
		jmp	.loop

	.done:
		sub rax, r8
		ret

	.first_null:
		test	rsi,	rsi
		jz		.done
		movzx	r8,		byte [rsi + rcx]
		jmp		.done
	.second_null:
		movzx	rax,	byte [rdi + rcx]
		jmp		.done

section .note.GNU-stack noalloc noexec nowrite progbits

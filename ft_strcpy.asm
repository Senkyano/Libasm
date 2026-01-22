bits 64

section .text
	global ft_strcpy

	ft_strcpy:
		xor		rcx,	rcx;					initialised index to 0
		test	rsi,	rsi
		jz		.done

	.loop_cpy:
		cmp	byte [rsi + rcx], 0;				Compare pointer index char if it not 0
		je .return;								if equal go in return
		mov al, [rsi + rcx];					copy in tmp
		mov [rdi + rcx], al;					at string dest cpy tmp
		inc rcx;								increment index
		jmp .loop_cpy

	.return:
		mov byte [rdi + rcx], 0;				set the last element at null
	.done:
		mov rax, rdi;							rax equal pointer of dest
		ret

section .note.GNU-stack noalloc noexec nowrite progbits

bits 64

section	.text
	global	ft_list_size

	ft_list_size:
		xor rax, rax
		test rdi, rdi
		jz	.done

	.loop_count:
		inc rax
		mov rdi, [rdi + 8]
		test rdi, rdi
		jnz .loop_count

	.done:
		ret

section .note.GNU-stack noalloc noexec nowrite progbits
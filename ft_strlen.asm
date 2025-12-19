
bits 64

; calculate the len of the string

section .text
	global ft_strlen

	; Function ft_strlen
	ft_strlen:
		cmp rdi, 0
		je .null_pointer

		xor rax, rax
	.loop:
		cmp byte [rdi + rax], 0
		je .done
		inc rax
		jmp .loop
	.done:
		ret
		.null_pointer:
			xor rax, rax
			ret

section .note.GNU-stack noalloc noexec nowrite progbits

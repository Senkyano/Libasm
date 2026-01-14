bits 64

section	.text
	global	ft_list_size

	ft_list_size:
		xor rax, rax

		test rdi, rdi
		jz	.done
		push	rbx;			head of list
		push	r12
		mov		rbx,	rdi
		mov		r12,	rdi

	.loop_count:
		inc		rax
		mov		rdi,	[rdi + 8]
		cmp		r12,	rdi
		jz		.no_cycle
		test	rdi,	rdi
		jz		.no_cycle

		test	rbx,	rbx
		jz		.no_cycle_continue
		mov		rbx,	[rbx + 8]
		test	rbx,	rbx
		jz		.no_cycle_continue
		mov		rbx,	[rbx + 8]
		test	rbx,	rbx
		jz		.no_cycle_continue
		cmp		rbx, rdi
		jz		.cycle_found

	.no_cycle_continue:

		jmp		.loop_count

	.no_cycle:
		pop	r12
		pop	rbx
	.done:
		ret

	.cycle_found:
		pop		rbx
		mov		rax, -1
		ret

section .note.GNU-stack noalloc noexec nowrite progbits
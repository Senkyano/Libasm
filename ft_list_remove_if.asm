bits 64

section .text
	global	ft_list_remove_if
	extern	free

	ft_list_remove_if:
		test	rdi,	rdi
		jz		.done
		test	rdx,	rdx
		jz		.done

		push	rbx
		push	r12
		push	r13
		push	r14
		push	r15

		mov		rbx,	rdi;	begin list
		mov		r12,	rsi;	data ref
		mov		r13,	rdx;	function cmp
		mov		r14,	rcx;	free_fct

	.loop_to_end:
		mov		r15,	[rbx]
		test	r15,	r15;	test la fin de node
		jz		.pop_done

		mov		rdi,	[r15];	data
		mov		rsi,	r12;	function call
		call	r13
		test	eax,	eax
		jnz		.skip_node

		mov		r8,		[r15 + 8]
		mov		[rbx],	r8

		test	r14,	r14
		jz		.no_free_funct

		mov		rdi,	[r15]
		call	r14

	.no_free_funct:
		mov		rdi,	r15
		call	free	wrt ..plt
		jmp		.loop_to_end

	.skip_node:
		lea		rbx,	[r15 + 8]
		jmp		.loop_to_end

	.pop_done:
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		rbx

	.done:
		ret

section .note.GNU-stack noalloc noexec nowrite progbits

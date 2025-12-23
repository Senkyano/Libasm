
bits 64

section .text
	global	ft_list_remove_if
	extern	free

	ft_list_remove_if:
		test	rdi,	rdi
		jz		.done
		test	rdx,	rdx
		jz		.done
		test	rcx,	rcx
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
		test	r15,	r15;	test la node
		jz		.pop_done

		mov		rdi,	[r15];	data
		mov		rsi,	r12;	function call
		call	r13
		test	eax,	eax
		jnz		.skip_node

	.skip_node:
		
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

bits 64

section .text
	global	ft_list_sort

	ft_list_sort:
		test	rdi,	rdi
		jz		.done
		test	rsi,	rsi
		jz		.done

		push	rbx;
		push	r12;
		push	r13
		push	r14
		push	r15

		mov		rbx,	rsi
		mov		r12,	rdi

		

	.pop_done:
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		rbx

	.done:
		ret
		

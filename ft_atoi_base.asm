bits 64

section .text
	global	ft_atoi_base
	extern	ft_strlen, __errno_location;

	ft_atoi_base:
		test	rdi,	rdi
		jz		.error
		test	rsi,	rsi
		jz		.error

		push	rbx
		push	r12
		push	r13
		push	r14
		push	r15

		mov		rbx,	rsi
		mov		r12,	rdi
		xor		rcx,	rcx
		xor		r8,		r8
	.check_base:
		movzx	rax,	byte [rbx + rcx]
		test	al,		al
		jz		.base_valid

		cmp		al,		0x2B
		je		.error_pop
		cmp		al,		0x2D
		je		.error_pop
		cmp		al, ' '
		je		.error_pop
		cmp		al, 9
		je		.error_pop
		cmp		al, 10
		je		.error_pop
		cmp		al, 11
		je		.error_pop
		cmp		al, 12
		je		.error_pop
		cmp		al, 13
		je		.error_pop

		inc		rcx
		mov		r8,		rcx

	.check_duplicate:
		movzx	r10,	byte [rbx + r8]
		test	r10,	r10
		jz		.check_base
		cmp		r10,	rax
		jz		.error_pop
		inc		r8
		jmp		.check_duplicate

	.base_valid:
		mov		rdi,	rbx
		call	ft_strlen wrt ..plt
		cmp		rax,	2
		jl		.error_pop
		mov		r14,	rax
		xor		rax,	rax
		xor		rcx,	rcx

	.skip_whitespace:
		movzx	r8,		byte [r12 + rcx]
		test	r8,		r8
		jz		.sign_check
		cmp		r8b,	0x20
		je		.ws_found
		cmp		r8b,	9
		jl		.sign_check
		cmp		r8b,	13
		jg		.sign_check

	.ws_found:
		inc		rcx
		jmp		.skip_whitespace

	.sign_check:
		xor		r15,	r15
		movzx	r10,	byte [r12 + rcx]
		cmp		r10,	0x2D
		jne		.check_plus
		mov		r15,	1
		inc		rcx
		jmp		.convert

	.check_plus:
		cmp		r10,	0x2B
		jne		.convert
		inc		rcx

	.convert:
		movzx	r10,	byte [r12 + rcx]
		test	r10,	r10
		jz		.add_sign_int
		xor		r8,		r8
	.search_in_base:
		movzx	r9,		byte [rbx + r8]
		test	r9,		r9
		jz		.add_sign_int
		cmp		r9,		r10
		jz		.add_to_int
		inc		r8
		jmp		.search_in_base
	.add_to_int:
		imul	rax,	r14
		add		rax,	r8
		inc		rcx
		jmp		.convert

	.add_sign_int:
		test	r15,	r15
		jz		.pop_register
		neg		rax
	.pop_register:
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		rbx
	.done:
		ret

	.error_pop:
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		rbx
	.error:
		xor		rax,	rax
		ret
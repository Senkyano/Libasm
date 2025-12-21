
bits 64

;	Faire le check de la base si il y a des doublons ou pas ?

;	rbx,	number int
;	r12,	string base
;	r13,	base length
;	r14,	index
;	r15,	bool negatif
;	r10,	start new_string
;	r9,		temp caractere

;	division
;		les restes vont dans rdx
;		les quotients vont dans rax

section .text
	global	ft_atoi_base
	extern	malloc, free, ft_strlen, __errno_location;		include external function

	ft_atoi_base:
		test	rsi, rsi;	test if base is null
		jz	.error

	.push_register:
		push	rbx;		saving non-volatil register
		push	r12;
		push	r13;
		push	r14;
		push	r15;

		mov		rbx,	rdi;		int
		mov		r12,	rsi;		base

		xor		rcx,	rcx
	
	.check_base_loop:
		movzx	rax, byte [r12 + rcx]
		test	al,		al
		jz		.base_valid

		cmp		al,	'+'
		je		.error_pop
		cmp		al, '-'
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

		xor		r8, r8

	.check_duplicate:

	.base_valid:
	;		calcul base length
		mov		rdi,	rsi
		call	ft_strlen
		cmp		rax, 2
		jl		.error_pop
		mov		r13,	rax;		base length

	;		gestion signe
		xor		r15,	r15;		init 0 = positif
		cmp		rbx,	2147483647
		jge		.int_max
		cmp		rbx,	0
		jge		.calc_len
		mov		r15,	1;			r15 = 1 = negatif

	;	negatif number
		mov		rax,	rbx
		neg		rax
		cmp		rax,	0
		jl		.int_min
		mov		rbx,	rax
		jmp		.calc_len

	.int_max:
		mov	rbx,	2147483647
		jmp		.calc_len

	.int_min:
		mov	rbx,	2147483648

	.calc_len:
		mov		rax,	rbx
		xor		rcx,	rcx
	.count:
		xor		rdx,	rdx
		div		r13
		inc		rcx
		test	rax,	rax
		jnz		.count

		lea		rdi,	[rcx + r15 + 1];	taille string + negatif + '\0'
		mov		r14,	rdi
		call	malloc	wrt ..plt
		test	rax, rax
		jz		.error_pop

		mov		r10,	rax
		dec		r14
		mov	byte [r10 + r14], 0;	'\0'
		mov		rax ,rbx

	.fill:
		dec		r14
		cmp		r14,	r15
		jl		.add_sign
		xor		rdx,	rdx
		div		r13
		movzx	r9,		byte [r12 + rdx]
		mov		[r10 + r14],	r9b
		test	rax, rax
		jnz		.fill

	.add_sign:
		test	r15,	r15
		jz	.done
		mov		byte [r10],		'-'

	.done:
		mov		rax,	r10;
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		pop		rbx
		ret

	.error_pop:
		pop		r15
		pop		r14;
		pop		r13;
		pop		r12;
		pop		rbx;

	.error:
		xor rax,rax
		ret

section .note.GNU-stack noexec nowrite progbits
;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_atoi_base.asm                                   :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/17 15:26:42 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/17 15:26:43 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

section .text
	global	ft_atoi_base
	extern	malloc, free, __errno_location, ft_strlen;		include external function

	ft_atoi_base:
		xor	rcx, rcx;						initialised compteur at 0
		cmp rsi, 0;							check if string is null
		je	.string_base_null

		cmp rdi, 2147483647;				only INT_MIN to INT_MAX
		jg	.overflow
		cmp rdi, -2147483648;
		jl	.overflow

		movsxd r11, edi;					Sign-extend edi (32-bit signed) → r11 (64-bit signed)
		mov r10, 0;							initialised at 0 to know positiviti
		mov rdi, rsi;						rdi stock the string base

		call ft_strlen
		cmp rax, 2
		jl .error_other;					error if the base isn't contains min 2 caracter
		mov r12, rax;						stock the len of base

		xor rcx, rcx
	.first_loop:
		cmp byte [rsi + rcx], 0
		je .continue
		mov al, byte [rsi + rcx]
		xor r8, r8
		inc rcx
	.second_loop:
		cmp byte [rsi + r8], 0
		je .first_loop
		cmp byte [rsi + r8], rax
		je .error_other
		inc r8
		jmp .second_loop

	.continue:
		cmp r11, 0
		jge .len_number

		neg r11
		mov r10, 1
		mov rcx, 1
		mov r13, r12
		sub 1, r13

	.len_number:
		xor rdx, rdx
		mov rax, r11
		cmp rax, r13
		jl .malloc_string

		div r12;							len of the base to divided working_number
		mov r11, rax;						quotion of division
		push rdx;							reste of division
		inc rcx
		jmp .len_number

	.malloc_string:
		div r12
		push rdx
		inc rcx
		xor rdx, rdx
		mov rdi, rcx
		call malloc

		test rax, rax
		je .malloc_fail

; 									error
	.malloc_fail:
		mov edi, 12;						ERROR Malloc not enough space
		jmp .calling_errno

	.string_base_null:
		mov edi, 101;						error null address
		jmp .calling_errno

	.overflow:
		mov edi, 132
		jmp .calling_errno

	.error_other:
		mov edi, 131
		jmp .calling_errno

	.calling_errno:
		call __errno_location
		mov [rax], edi
		xor rax, rax
		ret

section .note.GNU-stack noalloc noexec nowrite progbits
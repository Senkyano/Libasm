;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_write.asm                                       :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/11 00:39:41 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/11 00:39:44 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64
;					rdi				rsi				rdx 
;1	sys_write	unsigned int fd	const char *buf	size_t count
; tout est deja envoye dans les registre adequat suivant la norme de c

;	write in the fd

section .text ;				section excutable code
	global ft_write
	extern __errno_location	;			function extern

	ft_write:
		mov rax, 1
		syscall

		test rax, rax ;				test if system call has work
		jns .no_error

		neg rax
		mov rdi, rax ;				to not suppress data be side rax

		sub rsp, 8;					Align the stack call function c
		call __errno_location
		add rsp, 8;					restaure the stack

		mov [rax], edi; 			passer en 32 bits

		mov rax, -1; Error
		ret

	.no_error:; 					return if success
		ret

section .note.GNU-stack noalloc noexec nowrite progbits

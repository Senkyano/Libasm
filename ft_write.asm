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

section .text ;				section excutable code
	global ft_write
	extern errno	;			variable in libc

	ft_write:
		mov rax, 1
		syscall

		test rax, rax ;				test if system call has work
		jns .no_error

		neg rax
		mov rdi, rax ;				to not suppress data be side rax
		mov [rel errno], edi; 		passer en 32 bits

		mov rax, -1; Error
		ret

	.no_error:; 					return if success
		ret
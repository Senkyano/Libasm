;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_read.asm                                        :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/11 15:36:27 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/11 15:36:28 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

extern errno;					variable in libc

section .bss ;				data non initialised
	buffer resb 1024;			buffer tampon

section .text
	global	ft_read

	ft_read:
		cmp rdx, 0;				check if rdx size of octed need to read different of 0
		je .end_function

		cmp rdx, 1024;			if rdx higher than 1024
		jle .safe_len
		mov rdx, 1023;			set rdx to 1023 (leave 1 byte for \0)

	.safe_len:
		mov rax, 0 ;			system call 0 = read
		mov rsi, buffer;		rsi point to buffer tampon
		syscall

		cmp rax, 0;			test if result of rax equal or less than -1
		jl .error;			if rax less than 0 do no_error if not go to error

		mov byte [rsi + rax], 0;
		ret

	.error:
		neg eax;				errno = -eax
		mov edi, eax
		mov [rel errno], edi;
		mov rax, -1
		ret

	.end_function:
		xor rax, rax
		ret
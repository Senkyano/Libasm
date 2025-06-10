;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    main.asm                                           :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/11 00:54:24 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/11 00:55:00 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

section .data
	string db "Hello World42", 0


; main function
; TEST of write
section .text
	global _start;				point at the entry of program

	extern ft_write ;			declare a extern function

	_start:
		mov rdi, string
		call ft_write

		mov rax, 60; 			system call of exit
		xor rdi, rdi ;			exit code
		syscall
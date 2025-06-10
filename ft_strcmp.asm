;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_strcmp.asm                                      :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/10 16:24:33 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/10 16:24:34 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

section .text
	string1 db "mastermind", 0
	string2 db "masternind", 0

global section
	_start:
		mov rdi, string1
		mov rsi, string2
		call ft_strcmp


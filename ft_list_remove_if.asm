;# **************************************************************************** #
;#                                                                              #
;#                                                         :::      ::::::::    #
;#    ft_list_remove_if.asm                              :+:      :+:    :+:    #
;#                                                     +:+ +:+         +:+      #
;#    By: rihoy <rihoy@student.42.fr>                +#+  +:+       +#+         #
;#                                                 +#+#+#+#+#+   +#+            #
;#    Created: 2025/06/15 22:23:53 by rihoy             #+#    #+#              #
;#    Updated: 2025/06/15 22:23:54 by rihoy            ###   ########.fr        #
;#                                                                              #
;# **************************************************************************** #

bits 64

;| Registre ;| Usage                                                        |
;| -------- ;| ------------------------------------------------------------ |
;| `rax`    ;| if we need to remove and at the end we return rax 			|
													;to point first element |
;| `rdi`    ;| actual data                                                  |
;| `r9`     ;| function to call                                             |
;| `r8`     ;| first data of list                                           |

section .text
	global	ft_list_remove_if

	ft_list_remove_if:
		mov r8, rdi;				first element of list
		mov r9, rsi;				function to call

	.loop_condition:

		jmp	.loop_condition


bits 64

; return the front pointer
; first arg is the list
; structure need to be
; typedef struct	s_node
; {
;		void			*data; in the 8 first octets
;		struct s_node	*next; in address 8 octets (+8offset)
; }					t_node;

;	rbx = function
;	r12 = list
;

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
		

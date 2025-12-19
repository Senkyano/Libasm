
bits 64

; return the front pointer
; first arg is the list
; structure need to be
; typedef struct	s_node
; {
;		void			*data; in the 8 first octets
;		struct s_node	*next; in address 8 octets (+8offset)
; }					t_node;

section .text
	global	ft_list_sort

	ft_list_sort:
		

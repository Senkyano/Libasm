bits 64

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

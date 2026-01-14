bits 64

section .text
	global	ft_read
	extern __errno_location;					variable in libc

	ft_read:
		mov rax, 0 ;			system call 0 = read
		syscall

		test rax, rax;			test if result of rax equal or less than -1
		jl .error;			if rax less than 0 do no_error if not go to error

		mov byte [rsi + rax], 0;
		ret

	.error:
		neg eax;				errno = -eax
		mov edi, eax
		call __errno_location wrt ..plt
		mov [rax], edi;

		mov rax, -1
		ret

section .note.GNU-stack noalloc noexec nowrite progbits

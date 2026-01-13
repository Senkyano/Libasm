bits 64

section .text
	global	ft_read
	extern __errno_location;					variable in libc

	ft_read:
		cmp rdx, 0;				check if rdx size of octed need to read different of 0
		je .end_function

		cmp rdx, 1024;			if rdx higher than 1024
		jle .safe_len
		mov rdx, 1023;			set rdx to 1023 (leave 1 byte for \0)

	.safe_len:
		mov rax, 0 ;			system call 0 = read
		syscall

		test rax, rax;			test if result of rax equal or less than -1
		jl .error;			if rax less than 0 do no_error if not go to error

		mov byte [rsi + rax], 0;
		ret

	.error:
		neg eax;				errno = -eax
		mov edi, eax
		call __errno_location
		mov [rax], edi;

		mov rax, -1
		ret

	.end_function:
		xor rax, rax
		ret

section .note.GNU-stack noalloc noexec nowrite progbits

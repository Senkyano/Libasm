bits 64

section .text
	global	ft_list_push_front
	extern	malloc, __errno_location

	ft_list_push_front:
		test rdi, rdi
		jz	.done
		push rbx
		push r12
		mov	rbx, rdi;	Save rdi in rbx
		mov r12, rsi;	Save rsi in r12

;		Alloc the new node
		mov rdi, 16;		16 = data + next
		call malloc wrt ..plt
		test rax, rax
		jz	.error

		mov [rax], r12;		insert data
		mov	r13, [rbx];		new node first
		mov [rax + 8], r13
		mov [rbx], rax

	.error:
		pop r12
		pop	rbx
	.done:
		ret

section .note.GNU-stack noalloc noexec nowrite progbits

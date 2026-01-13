bits 64

section .text
    global ft_strdup
    extern malloc, __errno_location, ft_strlen

ft_strdup:
	cmp rdi, 0
	je .null_pointer

	push rbx				; Save RBX
	mov rbx, rdi			; Save de la string source dans RBX (registre préservé)

	; Calcul de la longueur
	call ft_strlen
	inc rax			   		; +1 pour le '\0'

	; Allocation mémoire
	mov rdi, rax			; taille pour malloc
	push rax			 	; Sauvegarde de la taille
	call malloc wrt ..plt 	; table linkage plt
	pop rcx			   		; Récupère la taille dans rcx

	test rax, rax
	je .error

	; Copie de la string
	mov rdi, rax				; destination (new string)
	mov rsi, rbx				; source (string originale)
	xor rdx, rdx				; index = 0
		
.cpy_loop:
	mov cl, byte [rsi + rdx]	; Lit un caractère de la source
	mov byte [rdi + rdx], cl	; Écrit dans la destination
	cmp cl, 0
	je .done
	inc rdx
	jmp .cpy_loop

.done:
	mov rax, rdi		 		; Retourne le pointeur de la nouvelle string
	pop rbx
	ret

.error:
	call __errno_location wrt ..plt
	mov dword [rax], 12   ; ENOMEM
	xor rax, rax
	pop rbx
	ret

.null_pointer:
	xor rax, rax
	ret

section .note.GNU-stack noalloc noexec nowrite progbits



section .bss
    input_str resb 100
    result_str resb 100

section .data
    msg_prompt db 'Enter a string: ', 0
    msg_result db 'Toggled string: ', 0

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_prompt
    mov edx, 16
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_str
    mov edx, 100
    int 0x80

    mov byte [input_str+eax-1], 0

    mov esi, input_str
    mov edi, result_str

toggle_loop:
    mov al, [esi]
    test al, al
    jz done

    cmp al, 'a'
    jb check_upper
    cmp al, 'z'
    ja check_upper
    sub al, 32
    jmp store_char

check_upper:
    cmp al, 'A'
    jb store_char
    cmp al, 'Z'
    ja store_char
    add al, 32

store_char:
    mov [edi], al
    inc esi
    inc edi
    jmp toggle_loop

done:
    mov byte [edi], 0

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_result
    mov edx, 17
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result_str
    mov edx, edi
    sub edx, result_str
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80


	



section .bss
    str1 resb 100
    str2 resb 100
    result resb 200

section .data
    msg_prompt1 db 'Enter the first string: ', 0
    msg_prompt2 db 'Enter the second string: ', 0
    msg_result db 'Concatenated string: ', 0

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_prompt1
    mov edx, 24
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, str1
    mov edx, 100
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_prompt2
    mov edx, 25
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, str2
    mov edx, 100
    int 0x80

    mov byte [str1+eax-1], 0
    mov byte [str2+eax-1], 0

    mov esi, str1
    mov edi, result

copy_str1:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    test al, al
    jnz copy_str1

    mov esi, str2

copy_str2:
    mov al, [esi]
    mov [edi], al
    inc esi
    inc edi
    test al, al
    jnz copy_str2

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_result
    mov edx, 20
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, edi
    sub edx, result
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80


	

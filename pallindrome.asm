section .bss
    input resb 100    
    reversed resb 100 

section .data
    msg1 db 'Enter a string: ', 0
    len1 equ $ - msg1
    msg2 db 'Palindrome: ', 0
    len2 equ $ - msg2
    msg3 db 'Not Palindrome: ',0
    len3 equ $ - msg3

section .text
    global _start

_start:
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_prompt
    mov edx, len1
    int 0x80

    
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 100
    int 0x80


    mov byte [input + eax - 1], 0  
    mov ecx, eax                  
    dec ecx                       

    
    mov esi, input
    mov edi, reversed
    add esi, ecx
    dec esi

reverse_loop:
    mov al, [esi]
    mov [edi], al
    dec esi
    inc edi
    loop reverse_loop

    
    mov byte [edi], 0

   
    mov esi,input
    mov edi,reversed

cmp:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne not_equ
    inc esi
    inc edi
    test al, al
    jz end_cmp
    test bl, bl
    jz not_equ
    jmp cmp

end_cmp:
    mov eax, 4
    mov ebx, 1
    lea ecx, [msg2]
    mov edx, len2
    int 0x80
    jmp exit

not_equ:
    mov eax, 4
    mov ebx, 1
    lea ecx, [msg3]
    mov edx, len3
    int 0x80

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80


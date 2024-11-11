section .data
    msg db "Enter the string:",0xa
    len equ $-msg
    space db " ",0xa
    slen equ $-space
    spc db " "
section .bss
    str1 resb 100
    count resb 1
    stlen resw 2
section .text
    global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,str1
    mov edx,100
    int 0x80

    mov byte[ecx+eax-1],0
    dec eax
    mov [stlen],eax  
  
    mov esi,str1
    mov edi,str1
compare:
    mov edx,[stlen]
    mov byte[count],0
    mov edi,str1
check:
    mov al,[esi]
    mov bl,[edi]
    cmp al,bl
    je inc_count
check2:
    test al,al
    jz exit
    inc edi
    dec edx
    jnz check
    jmp print
inc_count:
    inc byte[count]
    jmp check2
print:
    mov eax,4
    mov ebx,1
    mov ecx,esi
    mov edx,1
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,spc
    mov edx,1
    int 0x80

    mov eax,[count]
    add eax,'0'
    mov [count],al

    mov eax,4
    mov ebx,1
    mov ecx,count
    mov edx,1
    int 0x80
    
    mov eax,4
    mov ebx,1
    mov ecx,space
    mov edx,slen
    int 0x80
    
    inc esi
    jmp compare
exit:
    mov eax,1
    xor ebx,ebx
    int 0x80

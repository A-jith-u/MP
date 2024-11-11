section .data
	msg db "Enter the String:",0xa
	len equ $-msg
	msg1 db "Enter the charecter:",0xa
	len1 equ $-msg1
section .bss
	str1 resb 100
	char resb 1
	count resb 1
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
	
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,len
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,char
	mov edx,1
	int 0x80
	
	mov byte[count],0
	mov esi,str1
search:
	mov al,[esi]
	cmp al,[char]
	je inc_count
	inc esi
	test al,al
	jz exit
	jnz search
inc_count:
	inc byte[count]
	inc esi
	jmp search
exit:
	mov eax,[count]
	add eax,'0'
	mov [count],al
	
	mov eax,4
	mov ebx,1
	mov ecx,count
	mov edx,1
	int 0x80
	
	mov eax,1
	xor ebx,ebx
	int 0x80

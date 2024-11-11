section .data
	msg db "Enter the String:",0xa
	len equ $-msg
	msg1 db "Enter the Substring:",0xa
	len1 equ $-msg1
	msg2 db "Substring Present!",0xa
	len2 equ $-msg2
	msg3 db "Substring Absent",0xa
	len3 equ $-msg3
section .bss
	str1 resb 100
	subs resb 100
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
	mov esi,eax
	
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,len1
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,subs
	mov edx,100
	int 0x80
	mov byte[ecx+eax-1],0
	
	mov ecx,esi
	mov esi,str1
	mov edi,subs
search:
	mov al,[esi]
	mov bl,[edi]
	cmp al,bl
	je check
        mov edi,subs
	test al,al
	jz not_eq
	test bl,bl
	jz is_eq
	inc esi
	loop search
check:
	inc esi
	inc edi
	inc ecx
	jmp search
is_eq:
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 0x80
	jmp exit
not_eq:
	mov eax,4
	mov ebx,1
	mov ecx,msg3
	mov edx,len3
	int 0x80
exit:
	mov eax,1
	xor ebx,ebx
	int 0x80
	

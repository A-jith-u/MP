section .data
	msg db 'Enter the String:',0xa
	len equ $-msg
	msg1 db 'Enter the Key',0xa
	len1 equ $-msg1
	msg2 db 'Enter the Substring to replace:',0xa
	len2 equ $-msg2
section .bss
	str1 resb 100
	key resb 100
	subs resb 100
	str2 resb 100
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
	mov ecx,msg1
	mov edx,len1
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,key
	mov edx,100
	int 0x80
	mov byte[ecx+eax-1],0
	
	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,subs
	mov edx,100
	int 0x80
	mov byte[ecx+eax-1],0
	
	mov esi,str1
	mov edi,key
	mov ecx,0
	mov esp,str2
	mov ebp,subs
search:
	mov al,[esi]
	mov ah,[edi]
	cmp al,ah
	je check
search2:
	test al,al
	jz exit
	mov [esp],al
	inc esp
	inc esi
	test al,al
	jnz search
check:
	mov ecx,esi
check2:
	inc esi
	inc edi
	mov al,[esi]
	mov ah,[edi]
	test ah,ah
	jz replace
	cmp al,ah
	je check2
	mov esi,ecx
	mov edi,key
	mov al,[esi]
	jmp search2
replace:
	mov dl,[ebp]
	mov [esp],dl
	inc esp
	inc ebp
	test dl,dl
	jnz replace
	mov edi,key
	mov ebp,subs
	jmp search
exit:
	mov eax,4
	mov ebx,1
	mov ecx,str2
	mov edx,100
	int 0x80
	
	mov eax,1
	xor ebx,ebx
	int 0x80

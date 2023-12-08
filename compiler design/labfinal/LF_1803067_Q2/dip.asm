;start -1
.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
output_integer_msg_format byte "%d", 0Ah, 0
output_string_msg_format byte "%s", 0Ah, 0
input_integer_format byte "%d",0

number sdword ?

.code

main proc
	push ebp
	mov ebp, esp
	sub ebp, 100
	mov ebx, ebp
	add ebx, 4

;ld_int 8
	mov eax, 8
	mov dword ptr [ebx], eax
	add ebx, 4


;store 0
	mov eax, [ebx-4]
	mov dword ptr [ebp-0], eax

;ld_var 0
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 12
	mov eax, 12
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;sub -1
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	sub edx, eax
	mov eax, edx
	mov dword ptr [ebx], eax
	add ebx, 4


;add -1
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	add eax, edx
	mov dword ptr [ebx], eax
	add ebx, 4


;store 1
	mov eax, [ebx-4]
	mov dword ptr [ebp-4], eax

;print_int_value 1
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push [ebp+8]
	push [ebp+12]
	push ebp
	mov eax, [ebp-4]
	INVOKE printf, ADDR output_integer_msg_format, eax
	pop ebp
	pop [ebp+12]
	pop [ebp+8]
	pop [ebp+4]
	pop [ebp-0]
	pop [ebp-4]
	pop edx
	pop ecx
	pop ebx
	pop eax

;ld_var 1
	mov eax, [ebp-4]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 20
	mov eax, 20
	mov dword ptr [ebx], eax
	add ebx, 4


;eql 12
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	cmp edx, eax
	je LS12
	mov dword ptr [ebx], 0
	jmp LE12
	LS12: mov dword ptr [ebx], 1
	LE12: add ebx, 4



;if_start 10
	mov eax, [ebx-4]
	cmp eax, 0
	jle ELSE_START_LABEL_10


;ld_var 1
	mov eax, [ebp-4]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;add -1
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	add eax, edx
	mov dword ptr [ebx], eax
	add ebx, 4


;store 1
	mov eax, [ebx-4]
	mov dword ptr [ebp-4], eax

;else_start 10
	jmp ELSE_END_LABEL_10
ELSE_START_LABEL_10:


;else_end 10
ELSE_END_LABEL_10:


;ld_var 1
	mov eax, [ebp-4]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 19
	mov eax, 19
	mov dword ptr [ebx], eax
	add ebx, 4


;eql 22
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	cmp edx, eax
	je LS22
	mov dword ptr [ebx], 0
	jmp LE22
	LS22: mov dword ptr [ebx], 1
	LE22: add ebx, 4



;if_start 20
	mov eax, [ebx-4]
	cmp eax, 0
	jle ELSE_START_LABEL_20


;ld_var 1
	mov eax, [ebp-4]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;sub -1
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	sub edx, eax
	mov eax, edx
	mov dword ptr [ebx], eax
	add ebx, 4


;store 1
	mov eax, [ebx-4]
	mov dword ptr [ebp-4], eax

;else_start 20
	jmp ELSE_END_LABEL_20
ELSE_START_LABEL_20:


;else_end 20
ELSE_END_LABEL_20:


;print_int_value 1
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push [ebp+8]
	push [ebp+12]
	push [ebp+16]
	push [ebp+20]
	push [ebp+24]
	push [ebp+28]
	push [ebp+32]
	push [ebp+36]
	push [ebp+40]
	push ebp
	mov eax, [ebp-4]
	INVOKE printf, ADDR output_integer_msg_format, eax
	pop ebp
	pop [ebp+40]
	pop [ebp+36]
	pop [ebp+32]
	pop [ebp+28]
	pop [ebp+24]
	pop [ebp+20]
	pop [ebp+16]
	pop [ebp+12]
	pop [ebp+8]
	pop [ebp+4]
	pop [ebp-0]
	pop [ebp-4]
	pop edx
	pop ecx
	pop ebx
	pop eax

;halt -1
	add ebp, 100
	mov esp, ebp
	pop ebp
	ret
main endp
end

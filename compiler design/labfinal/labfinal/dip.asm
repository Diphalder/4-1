
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

;ld_int 0
	mov eax, 0
	mov dword ptr [ebx], eax
	add ebx, 4


;store 0
	mov eax, [ebx-4]
	mov dword ptr [ebp-0], eax

;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;store 1
	mov eax, [ebx-4]
	mov dword ptr [ebp-4], eax

;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;store 1
	mov eax, [ebx-4]
	mov dword ptr [ebp-4], eax

;LOOP_start 5
LOOP_START_LABEL_5:


;ld_var 1
	mov eax, [ebp-4]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 10
	mov eax, 10
	mov dword ptr [ebx], eax
	add ebx, 4


;lte 1
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	cmp edx, eax
	jle LS1
	mov dword ptr [ebx], 0
	jmp LE1
	LS1: mov dword ptr [ebx], 1
	LE1: add ebx, 4



;LOOP_end 5
	mov eax, [ebx-4]
	cmp eax, 0
	jle LOOP_END_LABEL_5


;ld_var 0
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_var 1
	mov eax, [ebp-4]
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


;store 0
	mov eax, [ebx-4]
	mov dword ptr [ebp-0], eax

;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_var 1
	mov eax, [ebp-4]
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

;(null) 5
	jmp LOOP_START_LABEL_5
LOOP_END_LABEL_5:


;ld_var 0
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;gt 23
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	cmp edx, eax
	jg LS23
	mov dword ptr [ebx], 0
	jmp LE23
	LS23: mov dword ptr [ebx], 1
	LE23: add ebx, 4



;else_start 21
	mov eax, [ebx-4]
	cmp eax, 0
	jle ELSE_START_LABEL_21


;print_int_value 0
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
	push ebp
	mov eax, [ebp-0]
	INVOKE printf, ADDR output_integer_msg_format, eax
	pop ebp
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

;else_end 21
	jmp ELSE_END_LABEL_21
ELSE_START_LABEL_21:


;while_label 21
ELSE_END_LABEL_21:


;ld_int 105
	mov eax, 105
	mov dword ptr [ebx], eax
	add ebx, 4


;store 0
	mov eax, [ebx-4]
	mov dword ptr [ebp-0], eax

;LOOP_start 30
LOOP_START_LABEL_30:


;ld_var 0
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 5
	mov eax, 5
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


;store 0
	mov eax, [ebx-4]
	mov dword ptr [ebp-0], eax

;print_int_value 0
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
	push [ebp+44]
	push ebp
	mov eax, [ebp-0]
	INVOKE printf, ADDR output_integer_msg_format, eax
	pop ebp
	pop [ebp+44]
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

;ld_var 0
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 100
	mov eax, 100
	mov dword ptr [ebx], eax
	add ebx, 4


;lt 38
	sub ebx, 4
	mov eax, [ebx]
	sub ebx, 4
	mov edx, [ebx]
	cmp edx, eax
	jl LS38
	mov dword ptr [ebx], 0
	jmp LE38
	LS38: mov dword ptr [ebx], 1
	LE38: add ebx, 4



;LOOP_end 30
	mov eax, [ebx-4]
	cmp eax, 0
	jle LOOP_END_LABEL_30


;(null) 30
	jmp LOOP_START_LABEL_30
LOOP_END_LABEL_30:


;halt -1
	add ebp, 100
	mov esp, ebp
	pop ebp
	ret
main endp
end

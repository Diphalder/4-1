; int main()
; {
;     int a = 10; int count = 0;
;     for(a=0; a<10; a++)
;     {
;         if(a==5) { count=count+1; }
;         else if(a >= 7) { count = a++; }
;         else { count = a--; }
;     }
;     Return 0;
; }

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

;ld_int 10, a
	mov eax, 10
	mov dword ptr [ebx], eax
	add ebx, 4


;store 0, a
	mov eax, [ebx-4]
	mov dword ptr [ebp-0], eax

;ld_int 1, count
	mov eax, 0
	mov dword ptr [ebx], eax
	add ebx, 4


;store 1, count
	mov eax, [ebx-4]
	mov dword ptr [ebp-4], eax

;ld_int 0, a
	mov eax, 0
	mov dword ptr [ebx], eax
	add ebx, 4


;store 0, a
	mov eax, [ebx-4]
	mov dword ptr [ebp-0], eax

;for_loop
FOR_LOOP_:


;ld_var 0, a
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 10
	mov eax, 10
	mov dword ptr [ebx], eax
	add ebx, 4


;jge 
	sub ebx, 4
	mov eax, [ebx] ; 10
	sub ebx, 4
	mov edx, [ebx] ; a
	cmp edx, eax
	jge FOR_LOOP_END


;print_int_value 2
	push eax
	push ebx
	push ecx
	push edx

	push [ebp-4]
	push [ebp-0]
	push [ebp+4]

	push ebp
	mov eax, [ebp-0]
	INVOKE printf, ADDR output_integer_msg_format, eax
	pop ebp

	pop [ebp+4]
	pop [ebp-0]
	pop [ebp-4]

	pop edx
	pop ecx
	pop ebx
	pop eax

IF_:
;ld_var 0, a
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 5
	mov eax, 5
	mov dword ptr [ebx], eax
	add ebx, 4

;jge 
	sub ebx, 4
	mov eax, [ebx] ; 5
	sub ebx, 4
	mov edx, [ebx] ; a
	cmp edx, eax
	jne ELIF_

 
;ld_var 1, count
	mov eax, [ebp-4]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;add -1
	sub ebx, 4
	mov eax, [ebx] ; 1
	sub ebx, 4
	mov edx, [ebx] ; count
	add eax, edx
	mov dword ptr [ebx], eax
	add ebx, 4


;store 1, count
	mov eax, [ebx-4]
	mov dword ptr [ebp-4], eax
	jmp END_

ELIF_:
;ld_var 0, a
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 7
	mov eax, 7
	mov dword ptr [ebx], eax
	add ebx, 4

;jge 
	sub ebx, 4
	mov eax, [ebx] ; 7
	sub ebx, 4
	mov edx, [ebx] ; a
	cmp edx, eax
	jl ELSE_

;ld_var 0, a
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;add -1
	sub ebx, 4
	mov eax, [ebx] ; 1
	sub ebx, 4
	mov edx, [ebx] ; n
	add eax, edx
	mov dword ptr [ebx], eax
	add ebx, 4

;store 1, count
	mov eax, [ebx-4]
	mov dword ptr [ebp-4], eax
	jmp END_

ELSE_:

;ld_var 0, a
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;add -1
	sub ebx, 4
	mov eax, [ebx] ; 1
	sub ebx, 4
	mov edx, [ebx] ; a
	sub edx, eax
	mov dword ptr [ebx], edx
	add ebx, 4

;store 1, count
	mov eax, [ebx-4]
	mov dword ptr [ebp-4], eax


END_:

;ld_var 0, a
	mov eax, [ebp-0]
	mov dword ptr [ebx], eax
	add ebx, 4


;ld_int 1
	mov eax, 1
	mov dword ptr [ebx], eax
	add ebx, 4


;add -1
	sub ebx, 4
	mov eax, [ebx] ; 1
	sub ebx, 4
	mov edx, [ebx] ; n
	add eax, edx
	mov dword ptr [ebx], eax
	add ebx, 4


;store 0
	mov eax, [ebx-4]
	mov dword ptr [ebp-0], eax

;print_int_value 2
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-4]
	push [ebp-0]
	push [ebp+4]

	push ebp
	mov eax, [ebp-4]
	INVOKE printf, ADDR output_integer_msg_format, eax
	pop ebp

	pop [ebp+4]
	pop [ebp-0]
	pop [ebp-4]
	pop edx
	pop ecx
	pop ebx
	pop eax

;while_end 13
	jmp FOR_LOOP_

FOR_LOOP_END:


;halt -1
	add ebp, 100
	mov esp, ebp
	pop ebp
	ret
main endp
end
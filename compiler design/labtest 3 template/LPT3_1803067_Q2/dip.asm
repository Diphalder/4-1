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
	sub ebp, 100  ; for variable stack 
	mov ebx, ebp
	add ebx, 4      ; for operation stack 

;ld_int 3
	mov eax, 3              
	mov dword ptr [ebx], eax ; push data into operation stack
	add ebx, 4


;store 0
	mov eax, [ebx-4]            ; read data from operation stack 
	mov dword ptr [ebp-0], eax  ; store data into variable stack

;while_label 3
WHILE_START_LABEL_3:


;ld_var 0
	mov eax, [ebp-0]        ; read data from varible stack 
	mov dword ptr [ebx], eax    ; push data into operation stack
	add ebx, 4


;ld_int 10
	mov eax, 10     
	mov dword ptr [ebx], eax  ; push data into operation stack
	add ebx, 4


;lt 6
	sub ebx, 4          
	mov eax, [ebx]          ; pop 1st data form our stack 
	sub ebx, 4
	mov edx, [ebx]          ; pop 2nd data form our stack 
	cmp edx, eax            ; operation
	jl LS6
	mov dword ptr [ebx], 0  ; store data into stack if LT
	jmp LE6
	LS6: 
        mov dword ptr [ebx], 1  ; store data into stack else
	LE6: 
        add ebx, 4



;while_start 3
	mov eax, [ebx-4]   ; read top data from operation stack
	cmp eax, 0          ; perform operation using the data
	jle WHILE_END_LABEL_3


;print_int_value 0
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-0]
	push [ebp+4]
	push [ebp+8]
	push [ebp+12]
	push ebp
	
    mov eax, [ebp-0]
	INVOKE printf, ADDR output_integer_msg_format, eax
	
    pop ebp
	pop [ebp+12]
	pop [ebp+8]
	pop [ebp+4]
	pop [ebp-0]
	pop edx
	pop ecx
	pop ebx
	pop eax

;ld_var 0
	mov eax, [ebp-0]            ; get data form variable stack 
	mov dword ptr [ebx], eax    ; store data into operation stack
	add ebx, 4


;ld_int 1
	mov eax, 1                  
	mov dword ptr [ebx], eax    ; push data into operation stack 
	add ebx, 4


;add -1
	sub ebx, 4
	mov eax, [ebx]          ; pop data from operation stack 
	sub ebx, 4
	mov edx, [ebx]          ; pop data from operation stack
	add eax, edx
	mov dword ptr [ebx], eax    ; push data into operation stack
	add ebx, 4


;store 0
	mov eax, [ebx-4]        ; read data from operation stack(don't pop) 
	mov dword ptr [ebp-0], eax  ; push data into variable stack

;while_end 3
	jmp WHILE_START_LABEL_3
WHILE_END_LABEL_3:


;halt -1
	add ebp, 100
	mov esp, ebp
	pop ebp
	ret
main endp
end

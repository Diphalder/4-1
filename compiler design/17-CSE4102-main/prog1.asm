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
input_integer_format byte "%d", 0
s1 db "Current = ", 0
s2 db "Resistance = ", 0
s3 db "Voltage = ",  0
number sdword ?
.code

main proc
	push ebp
	mov ebp, esp 
	sub ebp, 100  ; for variable stack 
	mov ebx, ebp
	add ebx, 4      ; for operation stack 

    ; Print "Current = ", read I
    ;print
	push eax
	push ebx
	push ecx
	push edx
    push [ebp-8]
    push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push [ebp+8]
	push [ebp+12]
	push ebp
    INVOKE printf, ADDR output_string_msg_format, ADDR s1
    pop ebp
	pop [ebp+12]
	pop [ebp+8]
	pop [ebp+4]
	pop [ebp-0]
    pop [ebp-4]
    pop [ebp-8]
	pop edx
	pop ecx
	pop ebx
	pop eax


    ;scan_int_value 0
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-8]
    push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push [ebp+8]
	push [ebp+12]
	push ebp
	INVOKE scanf, ADDR input_integer_format, ADDR number
	pop ebp
	pop [ebp+12]
	pop [ebp+8]
	pop [ebp+4]
	pop [ebp-0]
    pop [ebp-4]
    pop [ebp-8]
	mov eax, number
	mov dword ptr [ebp-0], eax  ;#####
	pop edx
	pop ecx
	pop ebx
	pop eax

    ; Print "Resistance = ", read R
      ;print
	push eax
	push ebx
	push ecx
	push edx
    push [ebp-8]
    push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push [ebp+8]
	push [ebp+12]
	push ebp
    INVOKE printf, ADDR output_string_msg_format, ADDR s2
    pop ebp
	pop [ebp+12]
	pop [ebp+8]
	pop [ebp+4]
	pop [ebp-0]
    pop [ebp-4]
    pop [ebp-8]
	pop edx
	pop ecx
	pop ebx
	pop eax

    ;scan_int_value 1
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-8]
    push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push [ebp+8]
	push [ebp+12]
	push ebp
	INVOKE scanf, ADDR input_integer_format, ADDR number
	pop ebp
	pop [ebp+12]
	pop [ebp+8]
	pop [ebp+4]
	pop [ebp-0]
    pop [ebp-4]
    pop [ebp-8]
	mov eax, number
	mov dword ptr [ebp-4], eax  ;#####
	pop edx
	pop ecx
	pop ebx
	pop eax


  

    ;ld_var 0
	mov eax, [ebp-0]        ;##### read data from varible stack 
	mov dword ptr [ebx], eax    ; push data into operation stack
	add ebx, 4

    ;ld_var 1
	mov eax, [ebp-4]        ;##### read data from varible stack 
	mov dword ptr [ebx], eax    ; push data into operation stack
	add ebx, 4


    ; Calculate V = I * R
    ;mul -1
	sub ebx, 4
	mov eax, [ebx]          ; pop data from operation stack 
	sub ebx, 4
	mov edx, [ebx]          ; pop data from operation stack
	imul eax, edx		;######
	mov dword ptr [ebx], eax    ; push data into operation stack
	add ebx, 4

;store 2
	mov eax, [ebx-4]            ; read data from operation stack 
	mov dword ptr [ebp-8], eax  ;###### store data into variable stack



    ; Print "Voltage = ", V
      ;print
	push eax
	push ebx
	push ecx
	push edx
    push [ebp-8]
    push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push [ebp+8]
	push [ebp+12]
	push ebp
    INVOKE printf, ADDR output_string_msg_format, ADDR s3
    pop ebp
	pop [ebp+12]
	pop [ebp+8]
	pop [ebp+4]
	pop [ebp-0]
    pop [ebp-4]
    pop [ebp-8]
	pop edx
	pop ecx
	pop ebx
	pop eax
    
    ;print_int_value 2
	push eax
	push ebx
	push ecx
	push edx
	push [ebp-8]
   	push [ebp-4]
	push [ebp-0]
	push [ebp+4]
	push [ebp+8]
	push [ebp+12]
	push ebp
	
    mov eax, [ebp-8]   ;#####
	INVOKE printf, ADDR output_integer_msg_format, eax
	
    pop ebp
	pop [ebp+12]
	pop [ebp+8]
	pop [ebp+4]
	pop [ebp-0]
   	pop [ebp-4]
   	pop [ebp-8]
	pop edx
	pop ecx
	pop ebx
	pop eax





;halt -1
	add ebp, 100
	mov esp, ebp
	pop ebp
	ret


    ret
main endp
end

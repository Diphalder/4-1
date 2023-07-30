;INVOKE printf, ADDR output_integer_msg_format, eax
;INVOKE scanf, ADDR input_integer_format, ADDR number
;s1 db "Current = ", 0 
;INVOKE printf, ADDR output_string_msg_format, ADDR s1

;##############   1803067 ######################

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

G sdword ?
T sdword ?
F sdword ?
.code

main proc
	mov eax ,60 
	mov G , eax

	mov eax ,70 
	mov T , eax

	mov eax , G
	add eax , 40
	sub eax , T

	mov F , eax 

	mov eax , T
	mov ebx , 0

	cmp eax , ebx
	JLE exit_if
	INVOKE printf, ADDR output_integer_msg_format, F
exit_if:

	ret
main endp
end

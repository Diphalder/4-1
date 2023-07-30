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
s3 db "Voltage = ", 0 
V sdword ?
I sdword ?
R sdword ?
.code

main proc
    ; Print "Current = ", read I
    INVOKE printf, ADDR output_string_msg_format, ADDR s1
    INVOKE scanf, ADDR input_integer_format, ADDR I

    ; Print "Resistance = ", read R
    INVOKE printf, ADDR output_string_msg_format, ADDR s2
    INVOKE scanf, ADDR input_integer_format, ADDR R

    ; Calculate V = I * R
    mov eax, I
    imul eax, R
    mov V, eax

    ; Print "Voltage = ", V
    INVOKE printf, ADDR output_string_msg_format, ADDR s3
    INVOKE printf, ADDR output_integer_msg_format, V


	mov edx , 0 
	mov eax , V 
	idiv R 
	INVOKE printf, ADDR output_integer_msg_format, eax





    ret
main endp
end

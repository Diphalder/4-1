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
n sdword ?
.code

main proc
INVOKE scanf, ADDR input_integer_format, ADDR n

while_ :
    mov eax , n
    cmp eax , 0
    JLE while_exit
    INVOKE printf, ADDR output_integer_msg_format, n
    mov edx,0
    mov eax, n
    mov ebx , 2
    idiv ebx
    mov n , eax
    jmp while_
while_exit:   
    ret
main endp
end

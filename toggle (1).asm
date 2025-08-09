
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
input db 'i am Sunehra'
result db 12 dup(?), '$'

.code
main:
mov ax,@data
mov ds,ax

mov si, offset input
mov bx, offset result
mov cx,12

start:
mov al,[si]
cmp al,'a'
jb check_upper
cmp al,'z'
jbe to_upper

check_upper:
cmp al,'A'
jb store
cmp al,'Z'
jbe to_lower
jmp store

to_upper:
and al,11011111b
jmp store

to_lower:
or al,00100000b
jmp store

store:
mov [bx],al
inc si
inc bx
loop start 


mov ah,09h
mov dx,offset result
int 21h  


mov ah, 4ch
    int 21h
end main
ret





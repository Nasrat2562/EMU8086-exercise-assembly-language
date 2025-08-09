
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data 
 input db "i am Fine aNd You?"
 result db 18 dup(?)
 
.code
main: mov ax,@data
mov ds,ax

mov si,offset input
mov bx, offset result
mov cx,18

start: mov al, [si] 
cmp al,'a'
jb over

cmp al,'z'
ja over

and al,11011111b

over: mov [bx],al
inc si
inc bx
loop start

mov ax, 4ch
int 21h
end main


ret





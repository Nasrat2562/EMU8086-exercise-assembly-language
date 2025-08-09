
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.data 
num dw 7865h , 6a68h, 786fh, 98b7h, 6754h
max1 dw 0
max2 dw 0
.code 
main: mov ax, @data
mov ds, ax     
mov si, offset num
mov cx, 5

start: mov ax, [si]
cmp ax,max1
ja next_max1

cmp ax, max2
ja next_max2

jmp continue

next_max1: mov bx, max1
mov max2, bx
mov max1,ax
jmp continue

next_max2: mov max2, ax

continue: add si,2
loop start

mov ax, 4ch
int 21h

end main




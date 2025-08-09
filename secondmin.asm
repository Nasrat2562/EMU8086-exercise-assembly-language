
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
num dw 6547h, 7658h, 8f76h, 564dh, 9876h
min1 dw 0ffffh
min2 dw 0ffffh

.code
 main: mov ax,@data
 mov ds, ax
 mov si, offset num
 mov cx, 5
 
 start: mov ax,[si]
 cmp ax, min1
 jb next_min1
 
 cmp ax,min2
 jb next_min2
 
 jmp continue
 
 next_min1: mov bx,min1
 mov min2, bx
 mov min1,ax 
 jmp continue
 
 next_min2: mov min2,ax
 
 continue: add si,2
           loop start
           
           mov ax, 4ch
           int 21h

ret





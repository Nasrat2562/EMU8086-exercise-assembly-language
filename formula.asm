
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 64h
.data
  x dd 8678h
  y dd 456729h
  result dd ?
  
.code
 main: mov ax, @data
 mov ds,ax
 
 mov si, offset x
 sub ax,ax
 sub dx,dx
 
 add ax,[si]
 adc dx, [si+2]
 
 mov si, offset y
 add ax, [si]
 adc dx, [si+2]
 
 mov bx, 54h
 
 mov cx, ax
 mov ax, dx
 mul bx
 
 push ax
 mov ax,cx
 mul bx
         
 mov cx,ax
 pop ax
 mov bx,3h
 div bx
 
 push ax
 mov ax, cx
 div bx
 
 mov [result], ax
 pop bx
 mov [result+2], bx
 

ret





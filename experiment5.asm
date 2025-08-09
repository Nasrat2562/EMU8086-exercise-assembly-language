
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
con equ 1eh
a equ 19h
b equ 1bh
c equ 1dh


mov al, 10000000b
out con, al
mov al, 11111111b
out a, al
mov al, 00000000b
out c,al

start: mov al, 01h
       out b,al
       call delay
       mov al, 02h
       out b,al  
       call delay
       mov al, 04h
       out b,al  
       call delay
       mov al, 08
       out b,al  
       call delay
       jmp start 
       
       delay: mov cx, 0ffffh
       wait: nop
             loop wait





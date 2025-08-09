con equ 1fh
c equ 1dh
b equ 1bh
a equ 19h

mov al, 10000000b
out con, al
mov al, 11111111b
out a, al
mov al, 00000000b
out c, al
start:
mov al, 01h
out b,al   
call delay
mov al, 02h
out b,al 
call delay
mov al, 04h
out b,al  
call delay
mov al,08h
out b,al  
call delay

jmp start

delay: 
  mov cx, 0ffffh
wait: 
nop
loop wait

ret

 



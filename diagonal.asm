con equ 1eh
a equ 18h
b equ 1ah
c equ 1ch

mov al,10000000b
out con,al
mov al,11111111b
out a,al
mov bl, 00000001b
mov al,bl
out c,al
mov cx,8

nex: mov al,bl
     not al
     out b,al
     mov al, 11111111b
     out c,al
     out b,al
     shl bl,1
     loop nex

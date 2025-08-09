con equ 1eh
a equ 18h
b equ 1ah
c equ 1ch

mov al, 10000000b
out con, al
mov al, 11110000b
out b, al
mov al, 00000000b
out c,al

start: mov al,11000000b
out a,al
mov al, 11111001b
out a,al
mov al, 10100100b
out a,al
jmp start
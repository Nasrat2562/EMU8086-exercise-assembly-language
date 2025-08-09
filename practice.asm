;control_reg 1e
;ppic 1c
;ppib 1a
;ppia 18

start :
mov al,10000000b
out 30,al
mov al,11111111b
out 24, al
main_loop:
mov cx,8
mov bl,00000001b
next_diag:
mov al,bl
out 28,al
mov al,bl
not al
out 26,al
mov al,11111111b
out 28,al
out 26,al
shl bl,1
loop next_diag
jmp main_loop
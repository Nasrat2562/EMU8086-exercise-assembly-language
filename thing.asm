
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov al, 10000000b
out 1Eh,al
mov al,11111111b
out 1Ch,al
mov al,11111111b
out 18h,al  
col: mov al,01111111b
out 1Ah,al
mov al,10111111b
out 1Ah,al
mov al,11011111b
out 1Ah,al 
mov al,11101111b
out 1Ah,al 
mov al,11110111b
out 1Ah,al
mov al,11111011b
out 1Ah,al
mov al,11111101b
out 1Ah,al 
mov al,11111110b
out 1Ah,al  

jmp  col    ;EA 0C 10 00 00
ret

ret





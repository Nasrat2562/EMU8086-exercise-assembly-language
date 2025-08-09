

.model small
.stack 64h
.data 
  con equ 1fh
  c equ 1dh
  b equ 1bh
  a equ 19h
.code
 main: mov ax, @data
       mov ds,ax
       
       mov al, 10000000b
       out con, al
       mov al, 11111111b
       out a,al
       mov al, 00000000b
       out b, al
                  
 level: mov al,11000000b
 out c,al
 mov al,11111001b
 out c,al
 mov al, 10100100b
 out c,al
 mov al,10110000b
 out c,al
 jmp level
 
 mov ax, 4ch
 int 21h
 end main
        





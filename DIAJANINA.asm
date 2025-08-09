con equ 1eh
a equ 18h
b equ 1ah
c equ 1ch

start: mov al, 10000000b
       out con,al
       
       mov al, 11111111b
       out a, al
       
     main_loop: mov cx,8
                mov bl,00000001b
             
          next: mov al,bl
                out c,al
                
                mov al,bl
                not al
                out b,al
                
                mov al,11111111b
                out c, al
                out b,al
                
                shl bl,1
                loop main_loop
                
                jmp next  
           


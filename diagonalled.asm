mov al, 10000000b
out 1eh,al
mov al, 11111111b
out 18h, al  
mov cx,8
mov bl, 00000001b
mov al,bl
out 1ch,al

next: mov al,bl
      not al
      
      mov al, 11111111b
      out 1ch,al
      out 1ah, al
      shl bl,1
      loop next




.data 
a db 46,37,77,94,64,59
b db 2,4,8,16,32,64
c db ?
d db ?

.code
main: mov ax,@data
      mov ds, ax
      
      mov si, offset a
      mov bx, offset c
      mov di, offset d
      mov cl, 1
      mov ch,6
      
      repeat: mov ax,0
              mov al,[si]
              shl ax,cl
              
              mov [bx],al
              
              mov al,[si]
              shr ax,cl
              
              mov [di],al
              
              inc si
              inc cl
             
              inc bx
              inc di 
               dec ch
              jnz repeat
              
              
              mov ax, 4ch
              int 21h
              end main



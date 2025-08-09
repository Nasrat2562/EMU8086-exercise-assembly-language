.data 
x db 15,24,17,12,14,23,11,22,16,12
y db 12,23,28,19,15,19,25,18,26,21

z db ?
.code  
main:
mov ax, @data
mov ds,ax

mov si, offset x
mov di, offset y
mov bl, 0  
mov cl,10

start: mov al, [si]
       sub al,[di]
       
       add bl, al
       inc si
       inc di
       loop start 
       
       

       mov ax, 4ch
       int 21h
       end main
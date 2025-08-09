.model small
.stack 64h
.data
 input db 10, ?, 10 dup(?)
 yx db 40,12
 
.code
   main: mov ax,@data
         mov ds,ax
         
         mov bh,0
         mov ah, 0Ah
         mov dx, offset input
         int 21h
          
         mov cx,0
         mov di,dx
         mov cl, [di+1]
         add di,2
         
         
         mov dx,0
         mov si,offset yx
         
   repeat: mov bh,0
           mov dx,[si]
           mov ah,02h
           int 10h
           
           
           mov dl,[di]
           mov ah,02h
           int 21h 
           
           inc di
           add [si],0101h
           
           loop repeat
           
           mov ax,4ch
           int 21h
           end main            

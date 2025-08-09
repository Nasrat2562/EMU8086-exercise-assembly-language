.data
number dd 12359bh, 657486h, 89f67h, 6754Dh
sum dd 0 
average dd 0

.code
main: mov ax, @data
mov ds, ax

mov si, offset number
mov ax,0
mov dx,0 
mov cx,4

clc

addition: add ax,[si]
          adc dx,[si+2]
             
          add si,4
          
          loop addition  
             
   mov [sum],ax
   mov [sum+2],dx 
   
   mov ax, dx
   mov dx,0
   mov bx,4
   div bx
   
   push ax
   push dx
   
   mov ax, [sum]
   pop dx
   div bx
   
   pop dx
   
   mov [average],ax     
   mov [average+2],dx
   
   mov ax, 4ch
   int 21h   
   end main   
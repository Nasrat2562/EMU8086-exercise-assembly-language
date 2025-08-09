.model
.stack 64h
.data
x db 3
y db 4
z db 6
q db ?
r db ?
.code
main: mov ax,@data
mov ds,ax
mov al,x
add al,y
mul z

mov   bl,3
   div bl
   mov q,al
   mov r,ah
   mov ah,4ch
   int 21h
   end main




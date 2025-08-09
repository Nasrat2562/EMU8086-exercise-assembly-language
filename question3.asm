.data
input db 10, ?, 10 dup(?)
yx db 40,12

.code
main: mov ax, @data
mov ds, ax

mov ah, 0ah
mov dx, offset input
int 21h


mov cx,0
mov di, dx
mov cl, [di+1]
add di,2

mov si, offset yx

start: mov bh,0
mov dx,[si]
mov ah, 02h
int 10h

mov dl, [di]
mov ah, 02h
int 21h

inc byte ptr [si+1]

inc di

loop start

mov ax, 4ch
int 21h
end main

 





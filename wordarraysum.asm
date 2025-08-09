.model small
.stack 64h
.data
dat dw 2fdh,6d6ah,17cah,5134h 
sum dw ?
.code
main: 
    mov ax,@data
    mov ds,ax

    mov cx,4
    mov di,offset dat
    xor bx,bx            ; sum = 0

aloop: 
    add bx,[di]
    add di,2 
    dec cx
   jnz aloop

    mov sum,bx           ; store the sum

    mov ax,4c00h
    int 21h
end main





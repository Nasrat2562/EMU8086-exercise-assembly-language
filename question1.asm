.data 
sum dw ?
current dw 1
end dw 112
incr dw 3

.code
main: mov ax,@data
mov ds, ax

mov si, [current]
mov bx, 0
mov cx, [end] 
mov di, [incr]

start: add bx,si
       add si,di
       cmp si,cx
       jle start
       
       mov [sum], bx
       mov ax, 4ch
       int 21h
       end main
       
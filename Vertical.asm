.model small
.stack 100h
.data
message db 'vertical Text Test' , '$'
.code
main:
mov ax,@data
mov ds,ax
mov si,offset message
mov cx,0
mov bl,40
print_loop:
mov al,[si]
cmp al,'$'
je done
mov ah,02h
mov bh,0
mov dh,cl
mov dl,bl
int 10h
mov dl,al
mov ah,02h
int 21h
inc si
inc cx
cmp cx,25
jl print_loop
done:
mov ah,01h
int 21h
mov ah,4ch
int 21h
end main




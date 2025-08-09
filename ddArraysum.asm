.model small
.stack 64h
.data
dat dd 12345678h, 89abcdefh, 00010002h, 00030004h
sum_low dw ?
sum_high dw ?
.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 4            
    mov si, offset dat
    xor ax, ax
    xor dx, dx          
    xor bx, bx
    xor di, di

aloop:
    mov ax, [si]          
    mov bx, [si+2]       
    add dx, bx           
    adc di, 0            
    add bx, dx             
    add ax, sum_low       
    adc dx, 0             
    add sum_low, ax
    adc sum_high, dx
    add si, 4             
    loop aloop

   

    mov ax, 4c00h
    int 21h
end main






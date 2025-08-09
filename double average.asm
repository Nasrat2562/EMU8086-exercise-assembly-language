.model stack
.stack 64h
.data
 a dd 768342h, 767635h, 5468998h, 6757575h
 result dd ?
 average dd ?
 count dw 4
 
 .code
 main: mov ax, @data
 mov ds,ax
 
 mov si, offset a
 mov cx, [count]  
 sub ax,ax  
 sub dx,dx
 
 summm: add ax,[si]
 adc dx,[si+2]  
 add si,4
 loop summm
 
 mov [result],ax
 mov [result+2],dx
 
 mov bx,[count]
 mov cx,ax
 mov ax,dx
 sub dx,dx
 
 div bx
 
 push ax
 
 mov ax,cx
 div bx
 
 mov [average],ax
 pop bx
 mov [average+2],ax
 
 mov ax, 4ch
 int 21h
 end main
 
 
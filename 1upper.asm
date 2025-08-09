
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
input db "Its Good"
result db 8 dup(?)
.code
main: mov ax, @data
mov ds,ax
          
      mov si, offset input
      mov bx, offset result
      mov cx,4
first: mov al, [si]
       cmp al,'I'
       je over  
       and al, 11011111b
       jmp over  
       
lower: mov al,[si]
       cmp al,'Z'
       ja over
       
       cmp al,'A'
       jb over
       
       and al, 00100000b
over: mov [bx],al
      inc si
      inc bx
      loop lower
      
      
      mov cx, 4
upper: mov al,[si]
       cmp al,'a'
       jb over2
       
       cmp al,'z'
       ja over2
       
       and al,11011111b
over2: mov [bx],al
       inc si
       inc bx
       loop upper  
       
       mov ax, 4ch
       int 21h         
       

ret






; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

clear macro
    mov ax,0600h
    mov bh,07
    mov cx,0000
    mov dx,184fh
    int 10h
endm
;.................................
cursor macro col,row
    mov ah,02
    mov bh,00
    mov dl,col
    mov bh,row
    int 10h
endm      
;.................................
disp macro mes
    mov ah,09
    mov dx,offset mes
    int 21h
endm
;.................................

.model small
.stack 64h
.data
     mes1 db 'There is a message for you'
          db 'To read it enter R','$'
     mes2 db 'Hi! This lab is about '
          db 'BIOS and DOS Interrupts','$'
     mes3 db 'No more message for you','$'
     
.code
 main: mov ax,@data
       mov ds,ax
       clear
       cursor 05,08
       disp mes1
       mov ah,07
       int 21h
       cmp al,'R'
       jz next
       cmp AL,'r'
       jz next
       cursor 05,09
       disp mes3
       jmp exit
   next: cursor 05,09
       disp mes2
       exit: mov ah,4ch
       int 21h
       end main
            

ret





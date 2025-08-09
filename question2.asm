
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
   input dw 19ach, 93ffh, 699eh, 55abh, 99ffh
   max1 dw 0
   max2 dw 0
   
.code
main: mov ax, @data
mov ds, ax

mov si, offset input
mov cx, 5

start: mov ax, [si]
       cmp ax, max1
       ja store1
       
       cmp ax,max2
       ja store2
       
       jmp over
       
  store1: mov bx, max1
          mov max2,bx
          mov max1, ax
          jmp over     
  store2: mov max2, ax
  over: inc si
        inc si
        loop start
        
        mov ax, 4ch
        int 21h
        end main 

ret





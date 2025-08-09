
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
 input db 'Bangladesh University of Professionals'
 result db 37 dup(?) 
 changed db 0
 unchanged db 0
 
 .code 
  main: mov ax,@data
  mov ds, ax
  
  mov si,offset input  
  mov di,offset result
  mov cx, 37
  
  start: mov al,[si]
         cmp al,'z'
         ja count
         
         cmp al,'a'
         jb count 
         
         inc [changed]
         and al,11011111b
         jmp over
          
 count: inc [unchanged]
         
   over: mov [di],al
         inc si
         inc di
         loop start
         mov ax,4ch
         int 21h       

ret






; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 64h
.data
  A db 46,37,77,94,64,59
  B db 2,4,8,16,32,64
  
  D db ?
  
  
.code
main: mov ax, @data
      mov ds, ax
      
      mov si, offset A
      mov ch,6
      mov cl,1
      
  start: mov ax,0 
         mov al, [si] 
        
         SHR al,cl
         
         inc si 
         inc cl   
         mov [D], al
         
         loop start
         
         mov ax, 4ch
         int 21h
         end main     
        

ret





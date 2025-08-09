
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
 input db 'i am A Student of Bangladesh University of PROFESSIONALS'
 result db 57 dup(?)
 
 .code
 main: mov ax, @data
 mov ds, ax
 mov si, offset input
 mov bx, offset result
 
 mov cx, 57
 
 start: mov al, [si]
        cmp al,'z'
        ja store
        
        cmp al,'a'
        ja upper
        
        cmp al,'A'
        jb store
        
        cmp al,'Z'
        jb lower
        
 upper: and al,11011111b
        jmp store
        
 lower: or al, 00100000b
        jmp store
        
 store: mov [bx], al
        inc si
        inc bx
        loop start
        
        
        mov ax, 4ch
        int 21h                     

ret





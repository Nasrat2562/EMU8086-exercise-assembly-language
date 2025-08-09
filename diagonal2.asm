
con equ 1Eh       ; Control register
a equ 18h         ; Port A = Row control (active LOW)
c equ 1Ch         ; Port C = Column data (HIGH = ON)

; Initialize 8255 PPI (Mode 0: All ports output)
mov al, 10000000b 
out con, al

; Disable all rows initially
mov al, 11111111b
out a, al

start:
    ; === ROW 1 (Light ONLY Column 1) ===
    mov al, 11111110b  ; Activate Row 1 (LOW on bit 0)
    out a, al
    mov al, 00000001b  ; Column 1 (HIGH) - ONLY this LED on
    out c, al
    call delay
    mov al, 00000000b  ; Clear columns
    out c, al

    ; === ROW 2 (Light ONLY Column 2) ===
    mov al, 11111101b  ; Activate Row 2 (LOW on bit 1)
    out a, al
    mov al, 00000010b  ; Column 2 (HIGH) - ONLY this LED on
    out c, al
    call delay
    mov al, 00000000b
    out c, al

    ; === ROW 3 (Light ONLY Column 3) ===
    mov al, 11111011b  
    out a, al
    mov al, 00000100b  ; Column 3 (HIGH)
    out c, al
    call delay
    mov al, 00000000b
    out c, al

    ; === ROW 4 (Light ONLY Column 4) ===
    mov al, 11110111b  
    out a, al
    mov al, 00001000b  ; Column 4 (HIGH)
    out c, al
    call delay
    mov al, 00000000b
    out c, al

    ; === ROW 5 (Light ONLY Column 5) ===
    mov al, 11101111b  
    out a, al
    mov al, 00010000b  ; Column 5 (HIGH)
    out c, al
    call delay
    mov al, 00000000b
    out c, al

    ; === ROW 6 (Light ONLY Column 6) ===
    mov al, 11011111b  
    out a, al
    mov al, 00100000b  ; Column 6 (HIGH)
    out c, al
    call delay
    mov al, 00000000b
    out c, al

    ; === ROW 7 (Light ONLY Column 7) ===
    mov al, 10111111b  
    out a, al
    mov al, 01000000b  ; Column 7 (HIGH)
    out c, al
    call delay
    mov al, 00000000b
    out c, al

    ; === ROW 8 (Light ONLY Column 8) ===
    mov al, 01111111b  
    out a, al
    mov al, 10000000b  ; Column 8 (HIGH)
    out c, al
    call delay
    mov al, 00000000b
    out c, al

    jmp start        ; Loop forever

delay:              ; Delay subroutine
    push cx
    mov cx, 0FFFFh
delay_loop:
    loop delay_loop
    pop cx
    ret



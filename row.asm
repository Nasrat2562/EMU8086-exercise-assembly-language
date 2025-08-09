con equ 1Eh       ; Control register (if needed)
a equ 18h         ; Row control (active LOW)
b equ 1Ah         ; (Unused in this setup)
c equ 1Ch         ; Column control (active HIGH)

; Initialize all rows OFF (HIGH) and columns OFF (LOW)
mov al, 11111111b 
out a, al         ; Disable all rows (inactive)
mov al, 00000000b 
out c, al         ; Disable all columns

start:
    ; === ROW 1 ===
    mov al, 11111110b  ; Activate Row 1 (LOW)
    out a, al
    mov al, 00000001b  ; Turn on Column 1 (HIGH)
    out c, al
    call delay
    mov al, 00000000b  ; Turn off all columns
    out c, al

    ; === ROW 2 ===
    mov al, 11111101b  ; Activate Row 2 (LOW)
    out a, al
    mov al, 00000010b  ; Turn on Column 2 (HIGH)
    out c, al
    call delay
    mov al, 00000000b  ; Turn off all columns
    out c, al

    ; === ROW 3 ===
    mov al, 11111011b  ; Activate Row 3 (LOW)
    out a, al
    mov al, 00000100b  ; Turn on Column 3 (HIGH)
    out c, al
    call delay
    mov al, 00000000b  ; Turn off all columns
    out c, al

    ; === ROW 4 ===
    mov al, 11110111b  ; Activate Row 4 (LOW)
    out a, al
    mov al, 00001000b  ; Turn on Column 4 (HIGH)
    out c, al
    call delay
    mov al, 00000000b  ; Turn off all columns
    out c, al

    ; === ROW 5 ===
    mov al, 11101111b  ; Activate Row 5 (LOW)
    out a, al
    mov al, 00010000b  ; Turn on Column 5 (HIGH)
    out c, al
    call delay
    mov al, 00000000b  ; Turn off all columns
    out c, al

    ; === ROW 6 ===
    mov al, 11011111b  ; Activate Row 6 (LOW)
    out a, al
    mov al, 00100000b  ; Turn on Column 6 (HIGH)
    out c, al
    call delay
    mov al, 00000000b  ; Turn off all columns
    out c, al

    ; === ROW 7 ===
    mov al, 10111111b  ; Activate Row 7 (LOW)
    out a, al
    mov al, 01000000b  ; Turn on Column 7 (HIGH)
    out c, al
    call delay
    mov al, 00000000b  ; Turn off all columns
    out c, al

    ; === ROW 8 ===
    mov al, 01111111b  ; Activate Row 8 (LOW)
    out a, al
    mov al, 10000000b  ; Turn on Column 8 (HIGH)
    out c, al
    call delay
    mov al, 00000000b  ; Turn off all columns
    out c, al

    jmp start           ; Loop forever

delay:                 ; Simple delay subroutine
    push cx
    mov cx, 0FFFFh
delay_loop:
    loop delay_loop
    pop cx
    ret
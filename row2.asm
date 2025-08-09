con equ 1Eh       ; Control register
a equ 18h         ; Port A = Row control (active LOW)
c equ 1Ch         ; Port C = Column data (HIGH = ON)

; Initialize
mov al, 10000000b ; Set 8255 PPI mode (all ports output)
out con, al

; Light ONLY Row 3 (for example)
mov al, 11111011b  ; Activate ONLY Row 3 (bit 2 = LOW)
out a, al
mov al, 11111111b  ; Turn ON ALL columns in Row 3 (adjust pattern as needed)
out c, al

; (Optional: Add delay if you want to blink the row)
call delay

; To turn off the row later:
mov al, 11111111b  ; Deactivate all rows
out a, al
mov al, 00000000b  ; Turn off all columns
out c, al

delay:             ; Delay subroutine
    push cx
    mov cx, 0FFFFh
delay_loop:
    loop delay_loop
    pop cx
    ret
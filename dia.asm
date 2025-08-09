org 100h

.data
buffer db 10 dup(0)    ; to store up to 10 digits
len db 0

.code
start:

    mov si, 0           ; index for buffer
    mov cx, 0           ; character count

read_loop:
    mov ah, 1           ; read character from keyboard (waits for key)
    int 21h
    cmp al, 13          ; check for Enter key
    je done_input

    mov buffer[si], al  ; store digit
    inc si
    inc cx
    jmp read_loop

done_input:
    mov len, cl         ; save total digits entered

    ; calculate starting row and column (centered diagonally)
    mov dh, 12          ; row (middle of 25-line screen)
    mov dl, 40          ; column (middle of 80-column screen)
    sub dl, cl          ; adjust left based on number length

    ; video memory segment
    mov ax, 0B800h
    mov es, ax

    mov si, 0           ; reset index for buffer

print_loop:
    mov al, buffer[si]  ; get character
    call print_char_diag

    inc dh              ; next row
    inc dl              ; next column
    inc si
    dec cx
    jnz print_loop

    ; wait for a key press before exiting
    mov ah, 1
    int 21h

    ret

; ------------------------------------------
; print_char_diag: prints AL at row DH, col DL
; ------------------------------------------
print_char_diag:
    push ax
    push bx
    push dx
    push di

    ; calculate offset: (row * 160) + (col * 2)
    mov ah, 0
    mov bh, 0
    mov bl, dh
    mov al, 160
    mul bl              ; AX = row * 160

    mov bx, ax          ; save row offset

    mov ah, 0
    mov al, dl
    mov cl, 2
    mul cl              ; AX = col * 2

    add ax, bx          ; AX = final offset
    mov di, ax

    mov ah, 0Eh         ; attribute (light yellow on black)
    mov es:[di], al     ; character
    mov es:[di+1], ah   ; attribute

    pop di
    pop dx
    pop bx
    pop ax
    ret

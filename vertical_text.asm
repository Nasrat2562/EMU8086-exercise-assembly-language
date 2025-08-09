org 100h

.model small
.stack 100h

.data
msg db '88056','$'   ; Message to display vertically

.code
main:
    mov ax, @data
    mov ds, ax

    mov si, offset msg    ; SI points to message
    mov dh, 0             ; Start at row 0
    mov bl, 40            ; Save column in BL (fixed column)

next_char:
    mov al, [si]
    cmp al, '$'
    je done

    ; Set cursor position using BL for column
    mov ah, 02h
    mov dl, bl           ; DL = column (constant)
    int 10h

    ; Print character
    mov ah, 02h
    mov dl, al           ; DL = character to print
    int 21h

    inc dh              ; Next row
    inc si              ; Next character
    jmp next_char

done:
    mov ah, 4ch
    int 21h
end main

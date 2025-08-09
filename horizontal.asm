.model small
.stack 100h
.data
message db 'horizontal Text Test', '$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov si, offset message
    mov cx, 0           ; length counter

count_len:
    mov di, si
    add di, cx
    mov al, [di]
    cmp al, '$'
    je length_done
    inc cx
    jmp count_len

length_done:
    ; CX = message length

    ; Calculate starting column = (80 - length) / 2
    mov ax, 80
    sub ax, cx
    shr ax, 1
    mov bl, al          ; starting column

    ; Set cursor position to row 12 (vertical center), column bl
    mov dh, 12
    mov dl, bl
    mov bh, 0
    mov ah, 02h         ; Set cursor position
    int 10h

    ; Print the string horizontally
    mov si, offset message

print_loop:
    mov al, [si]
    cmp al, '$'
    je done

    mov ah, 0Eh         ; Teletype output (prints char & advances cursor)
    int 10h

    inc si
    jmp print_loop

done:
    ; wait for key press
    mov ah, 00h
    int 16h

    ; terminate program
    mov ah, 4Ch
    int 21h
end main





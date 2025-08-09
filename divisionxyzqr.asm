.MODEL SMALL

.DATA
X DB 3
Y DB 4
Z DB 6
Q DB ?
R DB ?

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, X         ; AL = X (3)
    ADD AL, Y         ; AL = AL + Y (3 + 4 = 7)

    MOV BL, Z         ; BL = Z (6)
    MUL BL            ; AX = AL * BL (7 * 6 = 42), result in AX

    MOV BL, 3         ; divisor = 3
    DIV BL            ; AX / BL, quotient in AL, remainder in AH

    MOV Q, AL         ; store quotient (14)
    MOV R, AH         ; store remainder (0)

    MOV AH, 4Ch       ; terminate program
    INT 21h

END MAIN





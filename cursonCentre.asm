
 .MODEL SMALL
.STACK 100H

; ---------------- Macro Definitions ----------------
CURSOR_CENTER MACRO
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 12      ; Row 12 (center vertically)
    MOV DL, 39      ; Column 39 (center horizontally)
    INT 10H
ENDM

.DATA
; (no data needed for now)

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    CURSOR_CENTER       ; Set cursor to center

    ; Optional: output a character to see it visually
    MOV AH, 02H
    MOV DL, '*'
    INT 21H             ; Display '*' at current cursor pos

    MOV AH, 4CH
    INT 21H
END MAIN

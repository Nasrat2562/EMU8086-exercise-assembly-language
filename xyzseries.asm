.MODEL SMALL
.STACK 100h
.DATA
x1 DW 3
x2 DW 6
x3 DW 9
numerator DW ?
denominator DW ?
result DW ?

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Calculate x1 * x2
    MOV AX, x1
    MUL x2          ; AX = x1*x2

    MOV BX, AX      ; BX = x1*x2

    ; Calculate x2 * x3
    MOV AX, x2
    MUL x3
    ADD BX, AX      ; BX = x1*x2 + x2*x3

    ; Calculate x3 * x1
    MOV AX, x3
    MUL x1
    ADD BX, AX      ; BX = total numerator

    MOV numerator, BX

    ; Calculate x1 + x2 + x3
    MOV AX, x1
    ADD AX, x2
    ADD AX, x3
    MOV denominator, AX

    ; Final division
    MOV AX, numerator
    MOV BX, denominator
    DIV BL          ; Result = AX / BL (8-bit division)
    MOV result, AX  ; Store only result

    ; Exit
    MOV AH, 4CH
    INT 21H
END MAIN



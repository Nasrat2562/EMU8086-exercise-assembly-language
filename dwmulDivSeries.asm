.MODEL SMALL
.STACK 64
.DATA

A DW 46, 37, 77, 94, 64, 59     ; words, 6 elements
C DW 6 DUP(?)
D DB 6 DUP(?)

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV CH, 6
    MOV CL, 1

    MOV SI, OFFSET A   ; pointer to word array
    MOV BX, OFFSET C   ; pointer to word array
    MOV DI, OFFSET D   ; pointer to byte array

BACK:
    MOV AX, [SI]      ; load word from A
    SHL AX, CL        ; multiply by 2^CL
    MOV [BX], AX      ; save word result in C

    MOV AL, [SI]      ; load low byte of word for division result
    SHR AL, CL        ; divide low byte by 2^CL (approx)
    MOV [DI], AL      ; save byte result in D

    ADD SI, 2         ; move to next word element
    ADD BX, 2         ; move to next word in C
    INC DI            ; move to next byte in D

    INC CL
    DEC CH
    JNZ BACK

    MOV AH, 4CH
    INT 21H
END MAIN




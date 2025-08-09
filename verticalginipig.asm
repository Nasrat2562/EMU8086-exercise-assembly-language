; Vertical Display of "Vertical Text Test" with accurate center
.MODEL SMALL
.STACK 100H

; ---------- Macros ----------
CURSOR MACRO ROW, COL
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, ROW
    MOV DL, COL
    INT 10H
ENDM

PRINTCHAR MACRO CHAR
    MOV AH, 02H
    MOV DL, CHAR
    INT 21H
ENDM

CLSCREEN MACRO
    MOV AX, 0600H
    MOV BH, 07H
    MOV CX, 0000H
    MOV DX, 184FH
    INT 10H
ENDM

.DATA
    VERTICAL_MSG DB 'Vertical Text Test', '$'
    LENGTH DB ?

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    CLSCREEN

    ;---------------------------
    ; Count actual characters before '$'
    ;---------------------------
    MOV SI, OFFSET VERTICAL_MSG
    XOR CX, CX          ; CX = 0

COUNT_LOOP:
    MOV AL, [SI]
    CMP AL, '$'
    JE DONE_COUNT
    INC CX              ; count++
    INC SI
    JMP COUNT_LOOP

DONE_COUNT:
    MOV LENGTH, CL      ; Save character count

    ;-----------------------------------------
    ; Compute starting row: (25 - LENGTH) / 2
    ;-----------------------------------------
    MOV AL, 25
    SUB AL, LENGTH
    SHR AL, 1            ; Divide by 2
    MOV DH, AL           ; Starting row = DH
    MOV DL, 40           ; Center column

    ;-------------------------------
    ; Re-load SI to start of message
    ;-------------------------------
    MOV SI, OFFSET VERTICAL_MSG
    MOV CH, 0
    MOV CL, LENGTH

PRINT_LOOP:
    MOV AL, [SI]
    CURSOR DH, DL
    PRINTCHAR AL
    INC SI
    INC DH
    LOOP PRINT_LOOP

END_PROGRAM:
    MOV AH, 4CH
    INT 21H
END MAIN



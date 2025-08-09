; ========== Program 1: Grade Message Based on Number Input ==========
.MODEL SMALL
.STACK 100H

CURSOR MACRO ROW, COL
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, ROW
    MOV DL, COL
    INT 10H
ENDM

CLSCREEN MACRO
    MOV AX, 0600H
    MOV BH, 07H
    MOV CX, 0000H
    MOV DX, 184FH
    INT 10H
ENDM

PRINTSTR MACRO STR
    MOV AH, 09H
    MOV DX, OFFSET STR
    INT 21H
ENDM

.DATA
    MSG_FAIL DB 'fail$'
    MSG_SATIS DB 'satisfactory$'
    MSG_GOOD DB 'good$'
    MSG_VGOOD DB 'very good$'
    MSG_EXCEL DB 'excellent$'
    MSG_PROMPT DB 'Enter a number (or letter to quit): $'
    BUFFER DB 5,?,5 DUP(?)

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

READ_INPUT:
    CLSCREEN
    CURSOR 10, 25
    PRINTSTR MSG_PROMPT
    CURSOR 12, 30
    MOV AH, 0AH
    MOV DX, OFFSET BUFFER
    INT 21H

    MOV AL, BUFFER+2
    CMP AL, '0'
    JB EXIT
    CMP AL, '9'
    JA EXIT

    MOV AL, BUFFER+2
    SUB AL, '0'
    MOV BL, 10
    MUL BL
    MOV BL, BUFFER+3
    SUB BL, '0'
    ADD AL, BL
    MOV BL, AL

    CMP AL, 50
    JB SHOW_FAIL
    CMP AL, 60
    JB SHOW_SATIS
    CMP AL, 70
    JB SHOW_GOOD
    CMP AL, 80
    JB SHOW_VGOOD
    CMP AL, 99
    JB SHOW_EXCEL
    JMP READ_INPUT

SHOW_FAIL:
    CLSCREEN
    CURSOR 12, 30
    PRINTSTR MSG_FAIL
    JMP WAIT_KEY
SHOW_SATIS:
    CLSCREEN
    CURSOR 12, 30
    PRINTSTR MSG_SATIS
    JMP WAIT_KEY
SHOW_GOOD:
    CLSCREEN
    CURSOR 12, 30
    PRINTSTR MSG_GOOD
    JMP WAIT_KEY
SHOW_VGOOD:
    CLSCREEN
    CURSOR 12, 30
    PRINTSTR MSG_VGOOD
    JMP WAIT_KEY
SHOW_EXCEL:
    CLSCREEN
    CURSOR 12, 30
    PRINTSTR MSG_EXCEL
    JMP WAIT_KEY

WAIT_KEY:
    MOV AH, 00H
    INT 16H
    JMP READ_INPUT

EXIT:
    MOV AH, 4CH
    INT 21H
END MAIN
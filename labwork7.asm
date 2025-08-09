.MODEL SMALL
.STACK 100H

.DATA
MIXED  DB 'iN gOd We TrUsT'
RESULT DB 15 DUP('?')

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET MIXED
    MOV DI, OFFSET RESULT
    MOV CX, 15

CONVERT:
    MOV AL, [SI]
    CMP AL, 'a'
    JB SKIP
    CMP AL, 'z'
    JA SKIP
    AND AL, 11011111B

SKIP:
    MOV [DI], AL
    INC SI
    INC DI
    LOOP CONVERT

    MOV AH, 4CH
    INT 21H
END MAIN





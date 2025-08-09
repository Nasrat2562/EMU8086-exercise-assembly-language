
org 100h

.MODEL SMALL
.DATA
GRADES  DB 19H, 93H, 69H, 55H, 99H
LOWEST  DB ?
.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET GRADES
    MOV AL, [SI]
    MOV CX, 4

NEXT:
    INC SI
    CMP [SI], AL
    JAE SKIP
    MOV AL, [SI]
SKIP:
    LOOP NEXT

    MOV LOWEST, AL

    MOV AH, 4CH
    INT 21H
END MAIN


ret





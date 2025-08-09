
.MODEL SMALL
.STACK 100H

.DATA
SENTENCE    DB "Bangladesh University of Professionals was established in 2013.", '$'
RESULT      DB 100 DUP('?')
CHANGED     DB 0
UNCHANGED   DB 0

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET SENTENCE
    MOV DI, OFFSET RESULT

NEXT_CHAR:
    MOV AL, [SI]
    CMP AL, '.'         
    JE END_PROCESS

    CMP AL, 'a'
    JB NOT_LOWER
    CMP AL, 'z'
    JA NOT_LOWER

    AND AL, 11011111B    
    INC CHANGED
    JMP STORE_CHAR

NOT_LOWER:
    INC UNCHANGED

STORE_CHAR:
    MOV [DI], AL
    INC SI
    INC DI
    JMP NEXT_CHAR

END_PROCESS:
   
    MOV [DI], AL

   
    MOV AH, 4CH
    INT 21H
END MAIN





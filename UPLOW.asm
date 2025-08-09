.MODEL SMALL
.STACK 100H

.DATA
MIXED  DB 'AlBeRt EiNsTeIn'     
RESULT DB 15 DUP('?')           

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET MIXED        
    MOV DI, OFFSET RESULT      

    MOV CX, 7                  
LOWER_LOOP:
    MOV AL, [SI]
    CMP AL, 'A'
    JE STORE1
    CMP AL, 'B'
    JB STORE1
    CMP AL,'Z'
    JA STORE1
    OR AL, 00100000B           
STORE1:
    MOV [DI], AL
    INC SI
    INC DI
    LOOP LOWER_LOOP

    MOV CX, 8                   
UPPER_LOOP:
    MOV AL, [SI]
    CMP AL, 'a'
    JB STORE2
    CMP AL, 'z'
    JA STORE2
    AND AL, 11011111B          
STORE2:
    MOV [DI], AL
    INC SI
    INC DI
    LOOP UPPER_LOOP

DONE:
    MOV AH, 4CH
    INT 21H
END MAIN






.MODEL SMALL
.STACK 100H
.DATA
    inputStr     DB "Bangladesh University of Professionals was established in 2013$", 0
    changedCount DB 0
    sameCount    DB 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    LEA SI, inputStr
    MOV BL, 0
    MOV BH, 0

next:
    MOV AL, [SI]
    CMP AL, '$'
    JE done
    CMP AL, 'a'
    JL skip
    CMP AL, 'z'
    JG skip
    SUB AL, 32
    MOV [SI], AL
    INC BL
    JMP nextstep

skip:
    INC BH

nextstep:
    INC SI
    JMP next

done:
    MOV changedCount, BL
    MOV sameCount, BH
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

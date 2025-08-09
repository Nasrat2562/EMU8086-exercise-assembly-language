
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
    inputStr     DB "AlBeRt EiNsTeIn$", 0
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
    JE end
    CMP AL, 'a'
    JL nochange
    CMP AL, 'z'
    JG nochange
    INC BL
    JMP cont
nochange:
    INC BH
cont:
    INC SI
    JMP next
end:
    MOV changedCount, BL
    MOV sameCount, BH
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN


ret





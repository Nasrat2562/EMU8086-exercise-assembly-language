
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

CODE SEGMENT
ASSUME CS:CODE, DS:CODE
ORG 1000H
MOV AX, 1027H
MOV BX, 5A27H
MOV CX, 54A5H
OR AX, BX
XOR AX, CX
NOT AX
TEST CX, BX
AND CX, AX
HLT
CODE ENDS
END

ret





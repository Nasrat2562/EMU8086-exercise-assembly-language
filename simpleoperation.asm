
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AX, 0001H
ADD AX, 6789H
STC
ADC AX, 0488H
;
SUB AX, 156FH
STC
SBB AX, 080FH
;
MOV AX, 00FEH
INC AL
DEC AL
CBW
NEG AL
;
MOV AL, 0AH
MOV BL, 11H
MUL BL
;
MOV AX, 12ABH
MOV BX, 1234H
IMUL BX
;
MOV AX, 00F0H
MOV BL, 10H
DIV BL
;
MOV AX, -205
MOV BL, 4
IDIV BL
;
HLT

ret





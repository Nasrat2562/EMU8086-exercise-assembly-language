
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.MODEL SMALL
.STACK 64
.DATA
A DB 46, 37, 77, 94, 64, 59
B DB 2, 4, 8, 16, 32, 64
C DW 6 DUP(?)
D DB 6 DUP(?)
.CODE
MAIN: MOV AX,@DATA
MOV DS,AX
MOV CH,6
MOV CL,1
MOV SI, OFFSET A
MOV BX, OFFSET C
MOV DI, OFFSET D
BACK: MOV AH,00
MOV AL,[SI]
SHL AX,CL
MOV [BX],AX ; save the multiplication
MOV AL,[SI]
SHR AL,CL
MOV [DI],AL ; save the division (ignore remainder)
INC SI
INC BX
INC BX
INC DI
INC CL
DEC CH
JNZ BACK
MOV AH,4CH
INT 21H
END MAIN
ret





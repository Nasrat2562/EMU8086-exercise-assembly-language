; ----------------------------------------------------------------------------------
CLEAR MACRO
MOV AX,0600H
MOV BH,07
MOV CX,0000
MOV DX,184FH
INT 10H
ENDM
; ----------------------------------------------------------------------------------
CURSOR MACRO Col, Row
MOV AH,02
MOV BH,00
MOV DL,Col
MOV DH,Row
INT 10H
ENDM
; ----------------------------------------------------------------------------------
DISP MACRO MES
MOV AH,09
MOV DX,OFFSET MES
INT 21H
ENDM
; ----------------------------------------------------------------------------------

.MODEL SMALL
.STACK 64H
.DATA
MES1 DB 'There is a message for you'
DB ' To read it enter R','$'
MES2 DB 'Hi! This lab is about '
DB ' BIOS and DOS Interrupts' ,'$'

MES3 DB ' No more message for you','$'
.CODE
MAIN: MOV AX,@DATA
MOV DS, AX
CLEAR
CURSOR 05,08
DISP MES1
MOV AH, 07
INT 21H
CMP AL,'R'
JZ NEXT
CMP AL, 'r'
JZ NEXT
CURSOR 05,09
DISP MES3
JMP EXIT
NEXT: CURSOR 05,09
DISP MES2
EXIT: MOV AH, 4CH
INT 21H
END MAIN

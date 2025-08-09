
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JPIPC_C EQU 1FH
JPIPC   EQU 1DH
JPIPB   EQU 1BH
JPIPA   EQU 19H

MOV AL, 10000000B     ; Configure control register: All ports output (Mode 0)
OUT JPIPC_C, AL

MOV AL, 11110000B     ; Example row control (may differ per trainer)
OUT JPIPB, AL

MOV AL, 00000000B     ; Clear Port C
OUT JPIPC, AL

LEVEL:

; Show 0
MOV AL, 11000000B
OUT JPIPA, AL
CALL DELAY

; Show 1
MOV AL, 11111001B
OUT JPIPA, AL
CALL DELAY

; Show 2
MOV AL, 10100100B
OUT JPIPA, AL
CALL DELAY

; Show 3
MOV AL, 10110000B
OUT JPIPA, AL
CALL DELAY

; Show 4
MOV AL, 10011001B
OUT JPIPA, AL
CALL DELAY

; Show 5
MOV AL, 10010010B
OUT JPIPA, AL
CALL DELAY

; Show 6
MOV AL, 10000010B
OUT JPIPA, AL
CALL DELAY

; Show 7
MOV AL, 11111000B
OUT JPIPA, AL
CALL DELAY

; Show 8
MOV AL, 10000000B
OUT JPIPA, AL
CALL DELAY

; Show 9
MOV AL, 10010000B
OUT JPIPA, AL
CALL DELAY

; Show A
MOV AL, 10001000B
OUT JPIPA, AL
CALL DELAY

; Show b
MOV AL, 10000011B
OUT JPIPA, AL
CALL DELAY

; Show C
MOV AL, 11000110B
OUT JPIPA, AL
CALL DELAY

; Show d
MOV AL, 10100001B
OUT JPIPA, AL
CALL DELAY

; Show E
MOV AL, 10000110B
OUT JPIPA, AL
CALL DELAY

; Show F
MOV AL, 10001110B
OUT JPIPA, AL
CALL DELAY

JMP LEVEL             ; Repeat forever

; Simple delay loop (adjust for your trainer’s speed)
DELAY:
    MOV CX, 0FFFFh    ; Outer loop
WAIT1:
    MOV DX, 0FFFFh    ; Inner loop
WAIT2:
    NOP
    DEC DX
    JNZ WAIT2
    DEC CX
    JNZ WAIT1
    RET
nv

ret






; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JPIPC_C EQU 1FH
JPIPC   EQU 1DH
JPIPB   EQU 1BH
JPIPA   EQU 19H

; Initial Configuration
MOV AL, 10000000B
OUT JPIPC_C, AL

MOV AL, 11110000B
OUT JPIPB, AL

MOV AL, 00000000B
OUT JPIPC, AL

LEVEL:
    MOV AL, 11000000B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 11111001B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10100100B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10110000B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10011001B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10010010B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10000010B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 11111000B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10000000B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10010000B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10001000B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10000011B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 11000110B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10100001B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10000110B
    OUT JPIPA, AL
    CALL DELAY

    MOV AL, 10001110B
    OUT JPIPA, AL
    CALL DELAY

    JMP LEVEL

; -------------------------
; Delay Subroutine
; -------------------------
DELAY:
    MOV CX, 0FFFFH
DELAY_LOOP:
    NOP
    LOOP DELAY_LOOP
    RET


ret





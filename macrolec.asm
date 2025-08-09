; Comprehensive Assembly Program with BIOS INT 10H, DOS INT 21H, INT 16H, and MACROS
; Uses screen control, cursor, string/char input-output, and macros for reusability
; Author: Labonno Oishy
; Target: 8086 Emulator / DOSBox

.MODEL SMALL
.STACK 100H
.DATA

; String and input buffers
MSG1 DB 'Welcome to BIOS & DOS INT demo!','$'
MSG2 DB 'Enter your name:','$'
NAME_BUF DB 20,?,20 DUP(?)
OUTPUT1 DB 'Hello, $'

; Output for key check
KEY_MSG DB 'You pressed: $'

; ------------------- MACRO DEFINITIONS -------------------
CLSCREEN MACRO
    MOV AX, 0600H
    MOV BH, 07
    MOV CX, 0000H
    MOV DX, 184FH
    INT 10H
ENDM

DISPSCREEN MACRO STR
    MOV AH, 09H
    MOV DX, OFFSET STR
    INT 21H
ENDM

CURSOR MACRO ROW, COL
    MOV BH, 00
    MOV AH, 02H
    MOV DH, ROW
    MOV DL, COL
    INT 10H
ENDM 
CURSOR_CENTER MACRO
    MOV AH, 02H
    MOV BH, 00H
    MOV DH, 12
    MOV DL, 39
    INT 10H
ENDM


INPUTSTR MACRO BUFFER
    MOV AH, 0AH
    MOV DX, OFFSET BUFFER
    INT 21H
ENDM

DISPLAYCHAR MACRO CHAR
    MOV AH, 02H
    MOV DL, CHAR
    INT 21H
ENDM

WAIT_KEY MACRO
    MOV AH, 00H
    INT 16H
ENDM

; Macro to check keypress and get key
KEYPRESS MACRO
    MOV AH, 01H
    INT 16H
    JZ NO_KEY
    MOV AH, 00H
    INT 16H
NO_KEY:
ENDM

; ------------------- CODE SEGMENT -------------------
.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    ; Clear screen and print welcome
    CLSCREEN
    CURSOR 2, 10
    DISPSCREEN MSG1
      
    CURSOR_CENTER


    ; Prompt for name
    CURSOR 4, 10
    DISPSCREEN MSG2
    CURSOR 5, 10
    INPUTSTR NAME_BUF

    ; Say Hello + name (partial as input is raw)
    CURSOR 7, 10
    DISPSCREEN OUTPUT1

    ; Show entered characters manually (as 0AH doesn't auto print)
    MOV SI, OFFSET NAME_BUF + 2  ; actual string starts here
    MOV CL, NAME_BUF[1]         ; number of characters entered
    JCXZ SKIP_NAME
PRINT_NAME:
    MOV DL, [SI]
    MOV AH, 02H
    INT 21H
    INC SI
    LOOP PRINT_NAME
SKIP_NAME:

    ; Wait for keypress and show which key
    CURSOR 10, 10
    DISPSCREEN KEY_MSG
    MOV AH, 00H
    INT 16H         ; wait and get key
    MOV DL, AL      ; ASCII
    MOV AH, 02H
    INT 21H

    ; Get cursor position demo
    MOV AH, 03H
    MOV BH, 00
    INT 10H
    ; Now DH = row, DL = col (current cursor pos)

    ; Exit program
    MOV AH, 4CH
    INT 21H
END MAIN

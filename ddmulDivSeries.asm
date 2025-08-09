.MODEL SMALL
.STACK 64
.DATA

A DD 100000h, 200000h, 300000h, 400000h, 500000h, 600000h
C DD 6 DUP(0)
D DB 6 DUP(?)

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET A        ; pointer to input
    MOV DI, OFFSET C        ; pointer to output (C)
    MOV BP, OFFSET D        ; pointer to output (D)

    MOV BX, 0               ; loop index (0–5)
    MOV CL, 1               ; initial shift count

MAIN_LOOP:
    ; Exit after 6 items
    CMP BX, 6
    JGE END_PROGRAM

    ; Load 32-bit A[BX]
    MOV AX, [SI]
    MOV DX, [SI+2]

    ; Store shift count in AL
    MOV AL, CL

    ; Shift left AX:DX by AL
    MOV CH, AL              ; use CH as temp shift counter
SHIFT_LEFT:
    CMP CH, 0
    JE SL_DONE
    SHL DX, 1
    RCL AX, 1
    DEC CH
    JMP SHIFT_LEFT
SL_DONE:

    ; Store result in C[BX]
    MOV [DI], AX
    MOV [DI+2], DX

    ; Reload original value from A[BX]
    MOV AX, [SI]
    MOV DX, [SI+2]

    ; Shift right AX:DX by CL (original shift count)
    MOV CH, CL
SHIFT_RIGHT:
    CMP CH, 0
    JE SR_DONE
    SHR AX, 1
    RCR DX, 1
    DEC CH
    JMP SHIFT_RIGHT
SR_DONE:

    ; Store AL (low byte of result) in D[BX]
    MOV [BP], AL

    ; Move to next element
    ADD SI, 4      ; next A element
    ADD DI, 4      ; next C element
    INC BP         ; next D element
    INC BX         ; next loop index
    INC CL         ; increase shift count

    JMP MAIN_LOOP

END_PROGRAM:
    MOV AH, 4CH
    INT 21H
END MAIN




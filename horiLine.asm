.MODEL SMALL

.DATA
INPT DB 6,?,6 DUP(?)   ; input buffer
YX DB 40,12            ; X=40 (col), Y=12 (row)

.CODE
MOV AX, @DATA
MOV DS, AX
      
MOV AH, 0Ah
MOV DX, OFFSET INPT
INT 21h             ; buffered input from user

XOR CX, CX
MOV DI, DX
MOV CL, [DI+1]      ; length of input
ADD DI, 2           ; point DI to first char of input
MOV SI, OFFSET YX   ; pointer to X,Y coords

RP: 
    XOR BH, BH
    MOV DX, [SI]     ; get current X and Y

    MOV AH, 2       ; set cursor position
    INT 10h

    MOV DL, [DI]    ; char to print
    MOV AH, 2       ; DOS print char function
    INT 21h

    INC BYTE PTR [SI]    ; increment X coordinate only (low byte of YX)
    ; Y (high byte) stays fixed

    INC DI          ; next char
    LOOP RP

    MOV AH, 4Ch
    INT 21h





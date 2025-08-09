.MODEL SMALL
.STACK 100h
.DATA
X DB 15, 24, 17, 12, 14, 23, 11, 22, 16, 12
Y DB 12, 23, 28, 19, 15, 19, 25, 18, 26, 21
Z DW 0         ; Final result: sum of abs differences

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 10         ; Loop counter for 10 elements
    MOV SI, 0          ; Index

    XOR AX, AX         ; Clear AX
    XOR BX, BX         ; BX will store Z (total)

NEXT:
    ; Load X[i] into AL
    MOV AL, X[SI]
    ; Load Y[i] into DL
    MOV DL, Y[SI]

    ; Compare AL and DL to determine which is bigger
    CMP AL, DL
    JAE NO_SWAP        ; If AL >= DL, skip swap

    ; Swap AL and DL to avoid negative result
    XCHG AL, DL

NO_SWAP:
    SUB AL, DL         ; AL = |X[i] - Y[i]|
    ADD BL, AL         ; Add to total in BL

    INC SI
    LOOP NEXT

    ; Store final result in Z
    MOV Z, BX

    ; Exit
    MOV AH, 4CH
    INT 21H
END MAIN



    .MODEL SMALL

    .DATA
    INPT DB 6,?,6 DUP(?)
    YX DB 40,12

    .CODE
    MOV AX, @DATA
    MOV DS, AX
      
    MOV AH, 0Ah
    MOV DX, OFFSET INPT
    INT 21h            

    XOR CX, CX
    MOV DI, DX
    MOV CL, [DI+1]
    ADD DI, 2
    MOV SI, OFFSET YX              

RP: XOR BH, BH
    MOV DX, [SI]
    MOV AH, 2
    INT 10h
    ADD [SI], 0101h

    MOV DL, [DI]
    MOV AH, 2h
    INT 21h
    INC DI

    LOOP RP

    MOV AH, 4Ch
    INT 21h

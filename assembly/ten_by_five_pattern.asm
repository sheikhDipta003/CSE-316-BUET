.MODEL SMALL
.STACK 100H
.DATA
    row1 DB '**********',0DH,0AH
    row2 DB '**********',0DH,0AH
    row3 DB '**********',0DH,0AH
    row4 DB '**********',0DH,0AH
    row5 DB '**********',0DH,0AH,'$'
.CODE
MAIN PROC
    ;intialize data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ;display the rows
    LEA DX, row1
    MOV AH, 9
    INT 21H
    
    ;return to DOS
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
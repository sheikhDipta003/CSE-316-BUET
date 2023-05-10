.MODEL SMALL
.STACK 100H
.DATA
    in_prompt DB 'ENTER A HEX DIGIT: $'
    newline DB 0DH,0AH,'$'
    out_prompt DB 'IN DECIMAL IT IS '
    result DB ?,'$'
.CODE
MAIN PROC
   ;initialize data segment
   MOV AX, @DATA
   MOV DS, AX
   
   ;prompt user
   LEA DX, in_prompt
   MOV AH, 9
   INT 21H
   
   ;take the digit
   MOV AH, 1
   INT 21H
   
   ;convert to decimal
   ;result = (AL - 'A'> + 10
   SUB AL, 'A'
   ADD AL, 10
   MOV result, AL   
   
   ;return to DOS
   MOV AH, 4CH
   INT 21H
   
   
   ;print newline
   LEA DX, newline
   MOV AH, 9
   INT 21H
   
   ;show result
   LEA DX, out_prompt
   MOV AH, 9
   INT 21H
   
   
   
MAIN ENDP
END MAIN
.MODEL SMALL
.STACK 100H
.DATA
    newline DB 0DH,0AH,'$'
    char DB ?
.CODE
MAIN PROC 
   ;init data segment
   MOV AX, @DATA
   MOV DS, AX
     
   ;read a char
   MOV AH, 1
   INT 21H
   MOV char, AL
   
   ;print newline
   LEA DX, newline
   MOV AH, 9
   INT 21H
   
   ;print the character 10 times
   MOV CX, 10
   MOV AH, 2
   MOV DL, char
   TOP:
        INT 21H
        LOOP TOP
    
MAIN ENDP
END MAIN
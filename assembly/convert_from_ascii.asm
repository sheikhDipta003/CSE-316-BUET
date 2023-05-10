.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
  MOV AH, 1
  INT 21H
  
  ;convert to decimal digit
  MOV DL, AL
  SUB DL, 30h
  
  ;convert to corresponding ACII
  MOV AH, 2
  ADD DL, 30h
  INT 21H
    
MAIN ENDP
END MAIN
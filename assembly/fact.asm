;computes n!, where n is taken as input fronm user
.MODEL SMALL
.STACK 100H
.DATA  
    prompt DB ': $'
    N DW ?
.CODE
MAIN PROC
   ;init data segment
   MOV AX, @DATA
   MOV DS, AX
   
   ;take input
   MOV AH, 9
   LEA DX, prompt
   INT 21H
   
   MOV AH, 1
   INT 21H 
   SUB AL, 30h  ;convert into decimal from ascii
   XOR AH, AH   ;clear high byte
   MOV CX, AX 
   MOV AX, 1    ;holda the product
   

   ;while(n > 0){
   ;    fact *= n;
   ;    n--;
   ;}
   TOP:
      imul CX
      LOOP TOP
       
   
    
MAIN ENDP
END MAIN
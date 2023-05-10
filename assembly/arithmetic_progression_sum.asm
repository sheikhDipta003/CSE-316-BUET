.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    
    MOV CX, 10      ;initialize counter
    MOV AX, 1       ;initial term
    MOV DX, 1       ;current sum
    
    TOP:
        ADD AX, 1   ;term = term + interval
        ADD DX, AX  ;sum = sum + term
        
        LOOP TOP     
      
MAIN ENDP
END MAIN
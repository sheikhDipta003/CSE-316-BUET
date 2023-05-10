;exchange 10th and 25th element in a word array W
.MODEL SMALL
.STACK 100H
.DATA
    W DW 10, 20, 30, 40, 50
.CODE
MAIN PROC
    ;init data segment
    MOV AX, @DATA
    MOV DS, AX
    
    ;offset addr of 10th elem = W + (10-1)*2
    ;offset addr of 25th elem = W + (25-1)*2
    MOV AX, W+18
    XCHG W+48, AX
    MOV W+18, AX
    
MAIN ENDP
END MAIN
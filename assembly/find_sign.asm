;If AX contains a negative number, put -1 In BX; if AX 
;contains 0, put O In BX; if AX contains a positive number, put 1 In BX
MOV AX, -10
CMP AX, 0
JL put_neg_1
JE put_zero
JG put_pos_1

put_neg_1:
    MOV BX, -1
put_zero:
    MOV BX, 0
put_pos_1:
    MOV BX, 1
 


    
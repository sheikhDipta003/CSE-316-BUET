.MODEL SMALL

.STACK 100H
.DATA
IS_NEG DB ?
CR EQU 0DH
LF EQU 0AH
NEWLINE DB CR, LF , '$'
w dw 10 dup ($)
.CODE
outdec proc
    push ax
    push bx
    push cx
    push dx
    cmp ax, 0
    jge print_pos 
    push ax      
    mov dl, '-'
    mov ah, 2
    int 21h   
    pop ax
    neg ax
print_pos:
    xor cx, cx
    mov bx, 10
    repeat2:
        xor dx, dx 
        div bx
        push dx
        inc cx
        cmp ax, 0
        jne repeat2
    mov ah, 2
    print_loop:
        pop dx
        add dx, 30h
        int 21h
        LOOP print_loop
    lea dx, NEWLINE
    mov ah, 9
    int 21h
    pop dx
    pop cx
    pop bx
    pop ax
    ret
outdec endp

main PROC
MOV AX, @DATA
MOV DS, AX
PUSH BP
MOV BP,SP
SUB SP,68

; w[0]=-2;
MOV WORD PTR [bp-26],2
NEG WORD PTR [bp-26]
MOV CX,[bp-26]
MOV WORD PTR [bp-24],0
MOV BX,[bp-24]
ADD BX,BX
MOV w[BX],CX
; x[0]=w[0];
MOV WORD PTR [bp-30],0
MOV BX,[bp-30]
ADD BX,BX
MOV CX,w[BX]
MOV WORD PTR [bp-28],0
MOV SI,[bp-28]
ADD SI,SI
MOV WORD PTR [bp-22+SI],CX
; i=x[0];
MOV WORD PTR [bp-32],0
MOV SI,[bp-32]
ADD SI,SI
MOV CX,[bp-22+SI]
MOV WORD PTR [bp-2],CX

; println(i);
MOV AX,[bp-2]
CALL outdec
; x[1]=w[0]++;
MOV WORD PTR [bp-36],0
MOV BX,[bp-36]
ADD BX,BX
MOV AX,w[BX]
MOV WORD PTR [bp-38],AX
INC w[BX]
MOV CX,[bp-38]
MOV WORD PTR [bp-34],1
MOV SI,[bp-34]
ADD SI,SI
MOV WORD PTR [bp-22+SI],CX
; i=x[1];
MOV WORD PTR [bp-40],1
MOV SI,[bp-40]
ADD SI,SI
MOV CX,[bp-22+SI]
MOV WORD PTR [bp-2],CX

; println(i);
MOV AX,[bp-2]
CALL outdec
; i=w[0];
MOV WORD PTR [bp-42],0
MOV BX,[bp-42]
ADD BX,BX
MOV CX,w[BX]
MOV WORD PTR [bp-2],CX

; println(i);
MOV AX,[bp-2]
CALL outdec
; i=i+0;

MOV AX,[bp-2]
MOV WORD PTR [bp-46],AX
MOV WORD PTR [bp-44],0
MOV AX,[bp-46]
ADD AX,[bp-44]
MOV WORD PTR [bp-44],AX
MOV CX,[bp-44]
MOV WORD PTR [bp-2],CX
; i=i-0;

MOV AX,[bp-2]
MOV WORD PTR [bp-50],AX
MOV WORD PTR [bp-48],0
MOV AX,[bp-50]
SUB AX,[bp-48]
MOV WORD PTR [bp-48],AX
MOV CX,[bp-48]
MOV WORD PTR [bp-2],CX
; i=i*1;

MOV CX,[bp-2]
MOV WORD PTR [bp-54],CX
MOV WORD PTR [bp-52],1
MOV CX,[bp-54]
MOV AX,CX
IMUL WORD PTR [bp-52]
MOV WORD PTR [bp-52],AX
MOV CX,[bp-52]
MOV WORD PTR [bp-2],CX

; println(i);
MOV AX,[bp-2]
CALL outdec
; if((i>0&&i<10)||(i<0&&i>-10))i=100;else i=200;

MOV WORD PTR [bp-56],0
MOV AX,[bp-2]
CMP AX,[bp-56]
JG L0
MOV WORD PTR [bp-56],0
JMP L1
L0:
MOV WORD PTR [bp-56],1
L1:


MOV WORD PTR [bp-58],10
MOV AX,[bp-2]
CMP AX,[bp-58]
JL L2
MOV WORD PTR [bp-58],0
JMP L3
L2:
MOV WORD PTR [bp-58],1
L3:

CMP [bp-56],0
JE L4
CMP [bp-58],0
JE L4
MOV WORD PTR [bp-56],1
JMP L5
L4:
MOV WORD PTR [bp-56],0
L5:


MOV WORD PTR [bp-60],0
MOV AX,[bp-2]
CMP AX,[bp-60]
JL L6
MOV WORD PTR [bp-60],0
JMP L7
L6:
MOV WORD PTR [bp-60],1
L7:


MOV WORD PTR [bp-62],10
NEG WORD PTR [bp-62]
MOV AX,[bp-2]
CMP AX,[bp-62]
JG L8
MOV WORD PTR [bp-62],0
JMP L9
L8:
MOV WORD PTR [bp-62],1
L9:

CMP [bp-60],0
JE L10
CMP [bp-62],0
JE L10
MOV WORD PTR [bp-60],1
JMP L11
L10:
MOV WORD PTR [bp-60],0
L11:

CMP [bp-56],0
JNE L12
CMP [bp-60],0
JNE L12
MOV WORD PTR [bp-56],0
JMP L13
L12:
MOV WORD PTR [bp-56],1
L13:

CMP [bp-56],0
JE L14
; i=100;
MOV WORD PTR [bp-64],100
MOV CX,[bp-64]
MOV WORD PTR [bp-2],CX
JMP L15
L14:
; i=200;
MOV WORD PTR [bp-66],200
MOV CX,[bp-66]
MOV WORD PTR [bp-2],CX
L15:


; println(i);
MOV AX,[bp-2]
CALL outdec
; return 0;
MOV WORD PTR [bp-68],0
MOV AX,[bp-68]
JMP L_main

L_main:
ADD SP,68
POP BP

;DOS EXIT
MOV AH,4ch
INT 21h
main ENDP
END MAIN


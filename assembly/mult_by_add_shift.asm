;calculates A x B, A,B > 0 and binary
.model small
.stack 100h
.data
.code
main proc
  call multiply
  
  ;exit from dos
  mov ah, 4ch
  int 21h
   
main endp  

;procedure to perform A x B, AX = A, BX = B, DX = product
multiply proc    
 ;save the original values of AX and BX
 push ax
 push bx
 
 ;init dx
 xor dx, dx

repeat:
 ;if bx is even
 test bx, 1
 jz _shift
 
 ;else
 add dx, ax
 
 _shift:
    shl ax, 1
    shr bx, 1
              
 ;repeat until BX = 0
 jnz repeat

;free stack memory 
pop bx
pop ax
 
ret
multiply endp 

end main
;replace the number in AX by its absolute value
MOV AX, -1
CMP AX, 0
JL _negate

_negate:
    NEG AX
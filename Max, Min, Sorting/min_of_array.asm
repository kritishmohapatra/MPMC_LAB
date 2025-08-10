LXI H, 4300H     ; HL points to 4300H (starting address)
MOV C, M         ; Load count into C (C = [4300H])

INX H            ; HL = 4301H (first data)
MOV A, M         ; Assume first element as minimum → A = M
DCR C            ; Count reduced by 1

LOOP: INX H      ; HL points to next element
CMP M            ; Compare A with M (A - M)
JC SKIP         ; If A ≤ M, skip
MOV A, M         ; Else A > M → update A to new minimum

SKIP: DCR C      ; Decrease count
JNZ LOOP         ; If count ≠ 0, repeat loop

STA 4306H        ; Store minimum value at 4306H
HLT              ; End

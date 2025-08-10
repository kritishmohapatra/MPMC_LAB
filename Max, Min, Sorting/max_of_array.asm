LXI H, 4300H       ; HL points to start address 4300H
MOV C, M           ; Load count (number of elements) into register C

INX H              ; HL = 4301H (points to first number)
MOV A, M           ; Assume first number is the minimum → A = M
DCR C              ; Decrement count since one element is already considered

LOOP: INX H        ; HL = HL + 1 → point to next number
CMP M              ; Compare A - M
JNC SKIP           ; If A> M → skip update (A is already greater or equal)
MOV A, M           ; Else A <M → update A with new maximum value

SKIP: DCR C        ; Decrease counter
JNZ LOOP           ; If count ≠ 0, repeat loop

STA 4306H          ; Store final minimum value at memory location 4306H
HLT                ; End program

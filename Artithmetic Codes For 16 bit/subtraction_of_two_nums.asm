LXI H, 1234H    ; Load HL with 1234H (minuend)
LXI D, 0102H    ; Load DE with 0102H (subtrahend)

MOV A, L        ; Move lower byte of HL to A
SUB E           ; Subtract lower byte of DE (L - E)
MOV L, A        ; Store result back in L

MOV A, H        ; Move higher byte of HL to A
SBB D           ; Subtract H - D - CY (with borrow)
MOV H, A        ; Store result back in H

HLT             ; Halt

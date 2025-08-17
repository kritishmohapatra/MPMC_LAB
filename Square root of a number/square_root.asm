;======================================================
; Program : Square Root using repeated subtraction of odd numbers
; Logic   : 1 + 3 + 5 + ... + (2n-1) = n^2
; Input   : Number N at memory location 4050H
; Output  : √N at memory location 4051H
; Registers:
;   B → Odd number counter (1,3,5,7,…)
;   C → Root counter (1,2,3,…)
;======================================================

        LDA 4050H        ; Load N from memory (4050H) into Accumulator A
        MVI B, 01H       ; B = 1 (first odd number)
        MVI C, 01H       ; C = 1 (root counter starts at 1)

LOOP:   SUB B            ; A = A - B (subtract odd number)
        JZ  STORE        ; If A = 0 → result found → jump to STORE
        INR B            ; B = B + 1
        INR B            ; B = B + 1 again → total increment = +2 (next odd number)
        INR C            ; C = C + 1 (increment root counter)
        JMP LOOP         ; Repeat loop

STORE:  MOV A, C         ; Move root counter into A
        STA 4051H        ; Store result at memory location 4051H
        HLT              ; Halt program

; Program to process value from 4050H and store result in 4051H

        LDA 4050H        ; Load value from memory location 4050H into Accumulator
        MOV B, A         ; Copy value into register B (working register)
        MVI C, 00H       ; Initialize C = 0 (counter/result)
        MVI D, 01H       ; Initialize D = 1 (decrement/step value)

LOOP:   MOV A, B         ; Copy B into A for subtraction
        SUB D            ; Subtract D from A
        JC CARRY         ; If result < 0 → Carry flag set → Jump to CARRY
        MOV B, A         ; Update B with result of subtraction
        INR C            ; Increment counter C
        INR D            ; Increment D by 1
        INR D            ; Increment D by another 1 (total +2)
        JMP LOOP         ; Repeat the loop

CARRY:  MOV A, B         ; Move remaining value in B to A
        ADD B            ; Double the remaining value (A = A + B)
        CMP D            ; Compare doubled value with D
        JC END           ; If doubled value < D → Jump to END
        INR C            ; Otherwise increment counter

END:    MOV A, C         ; Move final counter value to A
        STA 4051H        ; Store result into memory location 4051H
        HLT              ; Halt program execution

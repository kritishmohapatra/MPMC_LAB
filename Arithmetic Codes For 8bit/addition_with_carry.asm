        MVI     C, 00H        ; Initialize C to 0 (for carry)
        MVI     A, 8AH        ; Load A with 8AH
        MVI     B, 0F1H       ; Load B with F1H
        ADD     B             ; A = A + B
        JNC     NEXT          ; If no carry, jump to NEXT
        INR     C             ; If carry, increment C

NEXT:   STA     4150H         ; Store A (lower byte of result) to 4150H
        MOV     A, C          ; Move carry from C to A
        STA     4151H         ; Store carry to 4151H
        HLT                   ; Stop execution

MVI A, 02H       ; Dividend
MVI B, 09H       ; Divisor
MVI D, 00H       ; Quotient
MVI C, 00H       ; Borrow flag (initially 0)

CMP B            ; Compare A and B → sets Carry if A < B
JC BORROW        ; If Carry set → jump to BORROW handler

LOOP: SUB B
      INR D
      CMP B
      JNC LOOP     ; Jump while A ≥ B (No Carry)
      
      MVI C, 00H   ; No borrow occurred
      JMP END

BORROW:
      MVI C, 01H   ; Set borrow flag

END:
      STA 4153H    ; Store remainder (A)
      MOV A, D
      STA 4154H    ; Store quotient
      MOV A, C
      STA 4155H    ; Store borrow flag (0 = no borrow, 1 = borrow)
      HLT

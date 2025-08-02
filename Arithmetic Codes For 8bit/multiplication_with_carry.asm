MVI A, 00H      ; A = 0 (result low byte)
MVI C, 00H      ; C = 0 (carry counter / high byte)
MVI B, 04H      ; B = multiplicand
MVI D, 02H      ; D = multiplier

LOOP: ADD B     ; A = A + B
      JNC NEXT  ; If no carry, skip
      INR C     ; Carry occurred, increment high byte

NEXT: DCR D     ; Decrease multiplier
      JNZ LOOP  ; Repeat if D ≠ 0

STA 4153H       ; Store low byte of result
MOV A, C
STA 4154H       ; Store high byte (if result > FFH)
HLT

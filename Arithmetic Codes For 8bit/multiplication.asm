MVI C,04H     ; Multiplicand = 04H
MVI B,03H     ; Multiplier = 03H
MVI A,00H     ; Result = 00H

LOOP: ADD C   ; A = A + C
      DCR B   ; B--
      JNZ LOOP
STA 8500H     ; Store result at 8500H
HLT




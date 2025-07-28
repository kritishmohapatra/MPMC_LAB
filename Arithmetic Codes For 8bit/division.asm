MVI A, 08H     ; Load dividend into A
MVI B, 02H     ; Load divisor into B
MVI C, 00H     ; Quotient = 0

LOOP: CMP B    ; Compare A with B
       JC END  ; If A < B, jump to END
       SUB B   ; A = A - B
       INR C   ; C = C + 1 (Quotient++)
       JMP LOOP

END:  STA 8500H ; Store remainder in 8500H (A)
       MOV A, C ; Move quotient to A
       STA 8501H ; Store quotient in 8501H
       HLT

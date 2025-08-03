MVI A, 10H      ; Load 10H (16 decimal) into register A
MVI B, 0E6H     ; Load E6H (230 decimal) into register B
MVI C, 00H      ; Initialize register C to 00H (will store borrow info)

SUB B           ; A = A - B → 10H - E6H → Result in A (2's complement form if negative)
JNC END         ; Jump to END if no borrow (i.e., Carry flag not set)
INR C           ; If borrow occurred (CY=1), increment C to indicate borrow

END: STA 4150H  ; Store the result of A - B at memory location 4150H
     MOV A, C   ; Move borrow info from C to A
     STA 4151H  ; Store the borrow flag value (00H or 01H) at 4151H
     HLT        ; Halt the program

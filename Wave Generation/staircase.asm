; ===== Main Program =====
MVI A, 80H        ; Load A = 80H (DAC reference value)
OUT 03            ; Send A to DAC control port

LXI H, 2050H      ; HL points to start of waveform data
MVI C, 14H        ; Loop counter = 20 samples

MAIN_LOOP: MOV A, M      ; Load sample from memory into A
           OUT 00       
           OUT 01        ; Output to DAC port 01 ; Output to DAC port 00

           PUSH H        ; Save HL
           PUSH B        ; Save BC

           LXI D, 0020H  ; DE = 0020H (delay counter)
           CALL DELAY    ; Call delay routine

           POP B         ; Restore BC
           POP H         ; Restore HL

           INX H         ; Next data point
           DCR C         ; Decrement sample counter
           JNZ MAIN_LOOP ; If not zero, repeat

           JMP RESET     ; If finished, reset HL and counter

RESET:     LXI H, 2050H  ; Reset HL back to start of data table
           MVI C, 14H    ; Reload counter
           JMP MAIN_LOOP ; Repeat waveform continuously


; ===== Delay Subroutine =====
DELAY:     DCX D         ; DE = DE - 1
           MOV A, E      ; Copy E into A
           ORA D         ; A = D OR E
           JNZ DELAY     ; If not zero, loop again
           RET           ; Return when DE = 0000H



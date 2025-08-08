LXI  H, 4300H      ; HL register pair me starting address load karo
MOV  B, M          ; B = number of elements (M = memory[4300H])
DCR  B             ; B = total passes = n - 1

OUTER: MOV  C, B   ; C = inner loop counter (remaining comparisons in current pass)
        LXI  H, 4301H ; HL ko first element address par set karo (array start)

NEXT:   MOV  A, M  ; A = current element
        INX  H     ; HL = address of next element
        CMP  M     ; Compare A with next element (A - M)
        JC   NOSWAP ; If A < M, jump to NOSWAP (already in correct order)

        ; ---- Swap logic ----
        MOV  D, M  ; D = next element (store temporarily)
        MOV  M, A  ; M (next element) = A (current element)
        DCX  H     ; HL = address of previous element
        MOV  M, D  ; previous element = D (old next element)
        INX  H     ; HL = address of next element again
        ; ---------------------

NOSWAP: DCR  C     ; inner loop counter = inner loop counter - 1
        JNZ  NEXT  ; agar C != 0 to inner loop repeat karo

        DCR  B     ; outer loop counter = outer loop counter - 1
        JNZ  OUTER ; agar B != 0 to outer loop repeat karo

HLT                 ; Program halt (sorting done)

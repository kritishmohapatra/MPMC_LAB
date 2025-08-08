LXI  H, 4300H      ; HL = starting address (4300H)
MOV  B, M          ; B = number of elements (n)
DCR  B             ; B = n - 1 passes required for bubble sort

OUTER: MOV  C, B   ; C = inner loop counter (comparisons in current pass)
        LXI  H, 4301H ; HL points to first element in array

NEXT:   MOV  A, M  ; A = current element
        INX  H     ; HL = address of next element
        CMP  M     ; Compare A with next element (A - M)
        JNC  NOSWAP ; If A >= M → already in descending order → no swap

        ; ---- Swap logic ----
        MOV  D, M  ; D = next element (store temporarily)
        MOV  M, A  ; Put A (bigger value) in next element position
        DCX  H     ; HL = address of previous element
        MOV  M, D  ; Put D (smaller value) in previous position
        INX  H     ; HL = address of next element again
        ; ---------------------

NOSWAP: DCR  C     ; Decrement inner loop counter
        JNZ  NEXT  ; If more comparisons remain in this pass, repeat

        DCR  B     ; Decrement outer loop counter
        JNZ  OUTER ; If more passes remain, repeat

HLT                 ; Sorting complete

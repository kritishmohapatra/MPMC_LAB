MVI A, 25H    ; Load 25H into Accumulator A
MVI B, 13H    ; Load 13H into Register B
ADD B         ; A = A + B → A = 25H + 13H = 38H
STA 8500H     ; Store result from A to memory 8500H
HLT           ; Stop execution


MVI A, 80H; control word
OUT 03 ;cw
MVI A, 00H
LOOP:OUT 00 ;a
     OUT 01; b
     INR A
     JMP LOOP
     
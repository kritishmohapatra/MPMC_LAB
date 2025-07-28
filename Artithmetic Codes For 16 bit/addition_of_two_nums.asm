LXI H, 2501H     ; Load first 16-bit number into HL
LXI D, 1302H     ; Load second 16-bit number into DE
DAD D            ; HL = HL + DE (result in HL)
SHLD 8500H       ; Store result from HL to 8500H (low) and 8501H (high)
HLT              ; Stop execution

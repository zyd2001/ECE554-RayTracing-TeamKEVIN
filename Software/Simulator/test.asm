    movi r1 1
    la r2 Transfer
L1: st r1 r2 0
    addi r2 r2 1
    addi r1 r1 1
    subi r3 r1 2
    bnz r3 L1
    finish
Transfer:
    .space 256
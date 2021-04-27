    movi r1 0
    la r2 Transfer
L1: st r1 r2 0
    addi r2 r2 4
    addi r1 r1 1
    subi r3 r1 63
    bnz r3 L1
    la r2 Transfer
    launch r2 
    la r2 Transfer
    movi r5 0
L2: st r1 r2 0
    addi r2 r2 4
    addi r5 r5 1
    addi r1 r1 1
    subi r3 r5 63
    bnz r3 L2
    la r2 Transfer
    launch r2 
    finish
Transfer:
    .space 256


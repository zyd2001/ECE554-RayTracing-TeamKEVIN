start:
    ii_addi r1 r1 5
    ii_addi r2 r2 5
    cmp_i r1 r2
    bge right1
wrong1:
    fin
right1:
    ii_addi r1 r1 1
    cmp_i r1 r2
    ble wrong2
right2:
    ii_subi r1 r1 2
    cmp_i r1 r2
    bl right3
wrong2:
    fin
right3:
    bne right4
wrong3:
    fin
right4:
    ii_addi r1 r1 1
    cmp_i r1 r2
    bne wrong5
right5:
    ii_addi r1 r1 10
    cmp_i r1 r2
    bge right
wrong5:
    fin
right:
    fin

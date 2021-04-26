start:
    s_write_high r1 0
    s_write_low r1 0
    s_write_high r2 0
    s_write_low r2 1
    ii_addi r1 r1 1
    cmp_i r1 r2
    bne wrong1
    ii_subi r1 r1 1
    s_write_low r2 1
    cmp_i r1 r2
    bne wrong2
    s_write_low r1 8
    s_write_low r2 2
    ii_divi r1 r1 4
    cmp_i r1 r2
    bne wrong3
    ii_muli r1 r1 4
    s_write_low r2 8
    cmp_i r1 r2
    bne wrong4
    ii_add r1 r1 r2
    s_write_low r2 16
    cmp_i r1 r2
    bne wrong5
    ii_sub r1 r1 r2
    s_write_low r2 0
    cmp_i r1 r2
    bne wrong6
    s_write_low r1 4
    s_write_low r2 5
    ii_mul r1 r1 r2
    s_write_low r2 20
    cmp_i r1 r2
    bne wrong7
    s_write_low r2 5
    ii_div r1 r1 r2
    s_write_low r2 4
    cmp_i r1 r2
    bne wrong8
right:
    fin
wrong1:
    fin
wrong2:
    fin
wrong3:
    fin
wrong4:
    fin
wrong5:
    fin
wrong6:
    fin
wrong7:
    fin
wrong8:
    fin
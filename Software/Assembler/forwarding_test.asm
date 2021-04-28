start:
    s_write_high r1 0
    s_write_low r1 20
    s_write_high r2 0
    s_write_low r2 32
    s_write_high r3 0
    s_write_low r3 5
    s_store_4byte r2 r1 0
    s_store_4byte r3 r2 0
    s_load_4byte r4 r1 0
    s_load_4byte r5 r4 0
    cmp_i r3 r5
    bne wrong1
    s_load_4byte r6 r4 0
    ii_addi r6 r6 2
    s_write_low r7 7
    cmp_i r6 r7
    bne wrong2
    fin
wrong1:
    fin
wrong2:
    fin
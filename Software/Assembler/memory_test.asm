start:
    s_write_high r1 0
    s_write_low r1 20
    s_write_high r2 0
    s_write_low r2 5
    s_store_4byte r2 r1 0
    s_load_4byte r3 r1 0
    cmp_i r2 r3
    bne wrong
    fin
wrong:
    fin
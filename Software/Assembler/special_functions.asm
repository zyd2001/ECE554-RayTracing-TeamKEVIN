start:
    s_write_high r1 0
    s_write_low r1 1
    s_write_high r2 0
    s_write_low r2 2
    s_write_high r3 0
    s_write_low r3 3
    s_write_high r4 0
    s_write_low r4 4
    v_get_from_s r1 r1 0
    v_get_from_s r1 r2 1
    v_get_from_s r1 r3 2
    v_get_from_s r1 r4 3
    s_write_low r1 0
    s_write_low r2 0
    s_write_low r3 0
    s_write_low r4 0
    s_get_from_v r1 r1 0
    s_get_from_v r2 r1 1
    s_get_from_v r3 r1 2
    s_get_from_v r4 r1 3
    s_write_high r5 0
    s_write_low r5 1
    cmp_i r1 r5
    bne wrong1
    s_write_low r5 2
    cmp_i r2 r5
    bne wrong1
    s_write_low r5 3
    cmp_i r3 r5
    bne wrong1
    s_write_low r5 4
    cmp_i r4 r5
    bne wrong1
    v_reduce r8 r1
    s_write_high r9 0
    s_write_low r9 10
    cmp_i r8 r9
    bne wrong2
    fin
wrong1:
    fin
wrong2:
    fin

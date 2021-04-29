DON'T USE TEST RIGHT NOW, USES CMP_V WHICH NO LONGER EXISTS
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
    v_get_from_s r2 r1 3
    v_get_from_s r2 r2 2
    v_get_from_s r2 r3 1
    v_get_from_s r2 r4 0
    vv_add r3 r1 r2
    s_write_low r1 5
    s_write_low r2 5
    s_write_low r3 5
    s_write_low r4 5
    v_get_from_s r4 r1 0
    v_get_from_s r4 r2 1
    v_get_from_s r4 r3 2
    v_get_from_s r4 r4 3
    cmp_v r3 r4
    bne wrong1
    vv_sub r1 r3 r1
    cmp_v r1 r2
    bne wrong2
    vv_mul r5 r3 r3
    s_write_low r1 25
    s_write_low r2 25
    s_write_low r3 25
    s_write_low r4 25
    v_get_from_s r4 r1 0
    v_get_from_s r4 r2 1
    v_get_from_s r4 r3 2
    v_get_from_s r4 r4 3
    cmp_v r5 r4
    bne wrong3
    vv_div r6 r5 r3
    cmp_v r6 r3
    bne wrong4
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
    
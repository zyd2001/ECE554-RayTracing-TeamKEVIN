start:
    fin
    ii_add r29 r31 r1
    s_get_from_v r7 r14 0
    ii_addi r7 r7 64
    v_get_from_s r14 r7 0
    s_get_from_v r7 r15 0
    ii_addi r7 r7 1024
    v_get_from_s r15 r7 0
    trace
    s_store_4byte r31 r29 0
    v_store_16byte r15 r29 0
    fin
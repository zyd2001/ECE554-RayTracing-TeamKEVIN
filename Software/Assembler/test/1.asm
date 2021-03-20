test:
    vf_div r15 r2 r16
    jmp L2
    ii_sub  r2 r3 r15
L1:
    bne L1
    ii_sub r2 r2 r2
L2: bne L2
    not r1 r2
    bge test
    s_load_label r1 L2
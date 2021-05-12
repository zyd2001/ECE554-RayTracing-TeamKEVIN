main:
        s_write_low R3 65520
        s_write_high R3 0
        s_write_low R1 660
        s_write_high R1 0
        @ v_get_from_s R1 R1 0
        @ v_get_from_s R1 R1 1
        @ v_get_from_s R1 R1 2
        @ v_get_from_s R1 R1 3
        @ v_store_16byte R1 R3 0
        s_store_4byte R1 R3 0
        Fin
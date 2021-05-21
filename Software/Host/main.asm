	s_mov R28 R29
	s_mov R2 R28
main:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0


	s_write_low R3 65520
	s_write_high R3 0
	ii_add R5 R2 R3

	s_write_low R2 0
	s_write_high R2 8192
	s_load_4byte R2 R2 0
	ii_div R4 R1 R2


	s_write_low R2 0
	s_write_high R2 8192
	s_load_4byte R2 R2 0

	s_push R30
	
	jmp_link mod
	
	s_pop R30

	s_mov R3 R1
	s_write_low R6 0
	s_write_high R6 8192
	s_load_4byte R6 R6 4
	s_itof R6 R6
	s_write_low R1 0
	s_write_high R1 8192
	s_load_4byte R1 R1 0
	s_itof R1 R1
	ff_div R6 R6 R1

	s_write_low R1 0
	s_write_high R1 16256
	s_itof R2 R4
	s_write_low R4 0
	s_write_high R4 16128
	ff_add R2 R2 R4
	s_write_low R4 0
	s_write_high R4 8192
	s_load_4byte R4 R4 4
	s_itof R4 R4
	ff_div R2 R2 R4
	s_write_low R4 0
	s_write_high R4 16384
	ff_mul R2 R2 R4
	ff_sub R1 R1 R2
	ff_mul R1 R1 R6

	s_write_low R2 0
	s_write_high R2 16384
	s_itof R4 R3
	s_write_low R3 0
	s_write_high R3 16128
	ff_add R4 R4 R3
	s_write_low R3 0
	s_write_high R3 8192
	s_load_4byte R3 R3 0
	s_itof R3 R3
	ff_div R4 R4 R3
	ff_mul R2 R2 R4
	s_write_low R3 0
	s_write_high R3 16256
	ff_sub R2 R2 R3

	s_write_low R3 0
	s_write_high R3 8192
	s_load_4byte R3 R3 12
	ff_mul R1 R1 R3

	s_write_low R3 0
	s_write_high R3 8192
	s_load_4byte R3 R3 12
	ff_mul R2 R2 R3

	s_write_low R4 0
	s_write_high R4 8192
	s_load_4byte R3 R4 16
	v_get_from_s_d R1 R3 0
	s_load_4byte R3 R4 20
	v_get_from_s R1 R3 1
	s_load_4byte R3 R4 24
	v_get_from_s R1 R3 2
	s_load_4byte R3 R4 28
	v_get_from_s R1 R3 3
	s_write_low R4 0
	s_write_high R4 8192
	s_load_4byte R3 R4 32
	v_get_from_s_d R2 R3 0
	s_load_4byte R3 R4 36
	v_get_from_s R2 R3 1
	s_load_4byte R3 R4 40
	v_get_from_s R2 R3 2
	s_load_4byte R3 R4 44
	v_get_from_s R2 R3 3
	vv_sub R1 R1 R2

	s_push R30
	
	s_push R1
	jmp_link normalize
	
	s_pop R1
	s_pop R30

	v_mov R4 R1
	s_write_low R4 0
	s_write_high R4 8192
	s_load_4byte R3 R4 48
	v_get_from_s_d R1 R3 0
	s_load_4byte R3 R4 52
	v_get_from_s R1 R3 1
	s_load_4byte R3 R4 56
	v_get_from_s R1 R3 2
	s_load_4byte R3 R4 60
	v_get_from_s R1 R3 3

	v_mov R2 R4
	s_push R30
	
	s_push R5
	s_push R2
	s_push R1
	jmp_link cross
	
	s_pop R1
	s_pop R2
	s_pop R5
	s_pop R30

	v_mov R3 R1
	v_mov R1 R4
	v_mov R2 R3
	s_push R30
	
	s_push R5
	s_push R2
	s_push R1
	jmp_link cross
	
	s_pop R1
	s_pop R2
	s_pop R5
	s_pop R30


	vv_sub R2 R0 R4
	vf_mul R3 R3 R2
	vv_add R2 R2 R3
	vf_mul R1 R1 R1
	vv_add R2 R2 R1

	s_setzero R1
	
	
	v_get_from_s R2 R1 3
	v_mov R1 R2
	s_push R30
	
	jmp_link normalize
	
	s_pop R30

	v_mov R2 R1
	s_write_low R2 0
	s_write_high R2 8192
	s_load_4byte R1 R2 16
	v_get_from_s_d R14 R1 0
	s_load_4byte R1 R2 20
	v_get_from_s R14 R1 1
	s_load_4byte R1 R2 24
	v_get_from_s R14 R1 2
	s_load_4byte R1 R2 28
	v_get_from_s R14 R1 3

	v_mov R15 R2
	
	v_push R2
	s_push R5
	s_push R30
	s_push R28
	Trace	

	s_pop R28
	s_pop R30
	s_pop R5
	v_pop R2
	v_mov R3 R14
	s_get_from_v R27 R14 3
	v_get_from_s R3 R27 3
	v_mov R4 R15
	v_mov R1 R4
	s_push R30
	
	v_push R2
	jmp_link normalize

	v_pop R2
	s_pop R30

	v_mov R4 R1
	
	
	s_get_from_v R2 R3 3
	s_setzero R1
	cmp_i R2 R1
	be L0
	s_write_low R2 0
	s_write_high R2 8192
	s_load_4byte R1 R2 16
	v_get_from_s_d R1 R1 0
	s_load_4byte R1 R2 20
	v_get_from_s R1 R1 1
	s_load_4byte R1 R2 24
	v_get_from_s R1 R1 2
	s_load_4byte R1 R2 28
	v_get_from_s R1 R1 3




	
	
	s_get_from_v R1 R3 3

	s_push R30
	
	s_push R5
	jmp_link hit_shader
	
	
	s_pop R5
	s_pop R30

	s_setzero R1
	ii_muli R1 R1 16
	ii_add R1 R1 R5
	v_store_16byte R1 R1 0
	jmp L1
L0:	s_write_low R2 0
	s_write_high R2 8192
	s_load_4byte R1 R2 16
	v_get_from_s_d R1 R1 0
	s_load_4byte R1 R2 20
	v_get_from_s R1 R1 1
	s_load_4byte R1 R2 24
	v_get_from_s R1 R1 2
	s_load_4byte R1 R2 28
	v_get_from_s R1 R1 3




	s_push R30
	
	jmp_link miss_shader
	
	s_pop R30

	s_setzero R1
	ii_muli R1 R1 16
	ii_add R1 R1 R5
	v_store_16byte R1 R1 0
L1:	Fin
miss_shader:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0
	

	
	
	s_setzero R1

	
	
	s_get_from_v R2 R2 1

	s_push R30
	
	jmp_link max
	
	s_pop R30


	s_write_low R3 0
	s_write_high R3 8192
	s_load_4byte R2 R3 80
	v_get_from_s_d R2 R2 0
	s_load_4byte R2 R3 84
	v_get_from_s R2 R2 1
	s_load_4byte R2 R3 88
	v_get_from_s R2 R2 2
	s_load_4byte R2 R3 92
	v_get_from_s R2 R2 3
	vf_mul R2 R2 R1
	s_write_low R3 0
	s_write_high R3 8192
	s_load_4byte R2 R3 64
	v_get_from_s_d R1 R2 0
	s_load_4byte R2 R3 68
	v_get_from_s R1 R2 1
	s_load_4byte R2 R3 72
	v_get_from_s R1 R2 2
	s_load_4byte R2 R3 76
	v_get_from_s R1 R2 3
	s_write_low R2 0
	s_write_high R2 16256
	ff_sub R2 R2 R1
	vf_mul R1 R1 R2
	vv_add R2 R2 R1
	v_mov R1 R2
	s_mov R29 R28
	s_pop R28
	ret
hit_shader:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0
	
	v_mov R11 R2
	v_mov R10 R3
	v_mov R9 R4

	s_setzero R2
	v_get_from_s_d R8 R2 0
	s_setzero R2
	v_get_from_s R8 R2 1
	s_setzero R2
	v_get_from_s R8 R2 2
	s_setzero R2
	v_get_from_s R8 R2 3

	s_write_low R2 0
	s_write_high R2 8192
	s_load_4byte R2 R2 116
	s_write_low R3 1
	s_write_high R3 0
	ii_sub R3 R1 R3
	s_write_low R1 32
	s_write_high R1 0
	ii_mul R3 R3 R1
	ii_add R2 R2 R3

	s_setzero R1
	ii_muli R1 R1 4
	ii_add R1 R1 R2
	s_load_4byte R1 R1 0
	v_get_from_s_d R7 R1 0
	s_write_low R1 1
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R2
	s_load_4byte R1 R1 0
	v_get_from_s R7 R1 1
	s_write_low R1 2
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R2
	s_load_4byte R1 R1 0
	v_get_from_s R7 R1 2
	s_write_low R1 3
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R2
	s_load_4byte R1 R1 0
	v_get_from_s R7 R1 3

	s_write_low R1 4
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R2
	s_load_4byte R9 R1 0

	s_write_low R1 5
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R2
	s_load_4byte R8 R1 0

	s_write_low R7 0
	s_write_high R7 8192
	s_load_4byte R7 R7 112

	s_setzero R1
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s_d R6 R1 0
	s_write_low R1 1
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R6 R1 1
	s_write_low R1 2
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R6 R1 2
	s_write_low R1 3
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R6 R1 3

	s_write_low R1 4
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s_d R5 R1 0
	s_write_low R1 5
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R5 R1 1
	s_write_low R1 6
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R5 R1 2
	s_write_low R1 7
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R5 R1 3

	
	
	s_get_from_v R2 R6 3
	s_setzero R1
	s_itof R1 R1
	cmp_f R2 R1
	ble L3
L4:	
	
	s_get_from_v R6 R6 3

	s_setzero R1
	
	
	v_get_from_s R6 R1 3
	vv_sub R4 R6 R10

	vv_mul_ele R1 R4 R4
	v_reduce R5 R1
	s_sqrt R5 R5

	v_mov R1 R4
	s_push R30
	
	jmp_link normalize
	
	s_pop R30
	v_mov R4 R1

	v_mov R1 R9
	v_mov R2 R4
	s_push R30
	
	jmp_link dot
	
	s_pop R30

	s_mov R4 R1
	s_mov R1 R4
	s_setzero R2

	s_write_low R3 0
	s_write_high R3 16256

	s_push R30
	
	jmp_link clamp
	
	s_pop R30

	s_mov R4 R1
	s_setzero R1
	s_itof R1 R1
	cmp_f R4 R1
	bg L5
	jmp L14
L5:	s_write_low R1 46871
	s_write_high R1 14545
	vf_mul R1 R9 R1
	vv_add R14 R10 R1

	v_mov R15 R4
	
	v_push R11
	v_push R10
	v_push R9
	v_push R8
	v_push R7
	v_push R6
	v_push R5
	v_push R4
	s_push R9
	s_push R8
	s_push R7
	s_push R6
	s_push R5
	s_push R4
	s_push R30
	s_push R28
	Trace
	
	s_pop R28
	s_pop R30
	s_pop R4
	s_pop R5
	s_pop R6
	s_pop R7
	s_pop R8
	s_pop R9
	v_pop R4
	v_pop R5
	v_pop R6
	v_pop R7
	v_pop R8
	v_pop R9
	v_pop R10
	v_pop R11
	v_mov R3 R14
	s_get_from_v R27 R14 3
        v_get_from_s R3 R27 3

	v_mov R1 R15
	s_push R30
	
	jmp_link normalize
	
	s_pop R30
	
	
	
	
	s_get_from_v R3 R3 3

	s_setzero R1
	
	
	v_get_from_s R3 R1 3
	s_setzero R1
	cmp_i R3 R1
	bne L7
	jmp L10
L7:	v_mov R1 R3
	v_mov R2 R10
	s_push R30
	
	jmp_link distance
	
	s_pop R30
	s_mov R10 R1
	v_mov R1 R3
	v_mov R2 R6
	s_push R30
	
	jmp_link distance
	
	s_pop R30

	ff_add R10 R10 R1
	ff_sub R10 R10 R5

	s_write_low R1 0
	s_write_high R1 8192
	s_load_4byte R1 R1 8
	cmp_f R10 R1
	ii_addi R2 R0 1
	bg L11
	s_setzero R2
L11:	s_write_low R1 0
	s_write_high R1 8192
	s_load_4byte R1 R1 8
	ff_sub R1 R0 R1
	cmp_f R10 R1
	ii_addi R1 R0 1
	bl L12
	s_setzero R1
L12:	or R2 R2 R1
	cmp_i R2 R0
	bne L9
	jmp L10
L9:	s_setzero R3

L10:	s_setzero R1
	cmp_i R3 R1
	be L13
	jmp L14
L13:	ff_mul R1 R6 R6
	ff_mul R3 R5 R5
	ff_mul R2 R6 R6
	ff_add R3 R3 R2
	ff_div R1 R1 R3

	vf_mul R5 R5 R1
	vf_mul R5 R5 R4

	vv_sub R1 R4 R11

	s_push R30
	
	jmp_link normalize
	
	s_pop R30
	v_mov R4 R1

	v_mov R1 R9
	vv_sub R2 R0 R11

	s_push R30
	
	jmp_link dot
	
	s_pop R30

	s_mov R3 R1
	v_mov R1 R9
	v_mov R2 R4
	s_push R30
	
	jmp_link dot
	
	s_pop R30

	s_mov R2 R1
	vv_sub R1 R0 R11

	v_mov R2 R4
	s_push R30
	
	jmp_link dot
	
	s_pop R30
	
	
	s_write_low R1 55050
	s_write_high R1 15651
	v_get_from_s_d R1 R1 0
	s_write_low R1 55050
	s_write_high R1 15651
	v_get_from_s R1 R1 1
	s_write_low R1 55050
	s_write_high R1 15651
	v_get_from_s R1 R1 2
	s_write_low R1 0
	s_write_high R1 16256
	v_get_from_s R1 R1 3

	vf_mul R2 R7 R8
	s_write_low R1 0
	s_write_high R1 16256
	ff_sub R1 R1 R8
	vf_mul R1 R1 R1
	vv_add R2 R2 R1

	s_write_low R1 0
	s_write_high R1 16256
	ff_sub R1 R1 R8
	vf_mul R3 R7 R1

	vv_sub R1 R0 R2
	s_write_low R1 0
	s_write_high R1 16256
	vf_add R1 R1 R1
	vv_mul_ele R1 R1 R3
	vv_mul_ele R1 R1 R5
	vv_add R1 R8 R1
	v_mov R8 R1
	s_mov R1 R2
	s_mov R2 R9
	s_push R30
	
	s_push R3
	jmp_link NormalDist
	
	s_pop R3
	s_pop R30

	s_mov R5 R1
	s_mov R1 R3
	s_mov R2 R4
	s_mov R3 R9
	s_push R30
	
	s_push R5
	jmp_link HammonSmith
	
	s_pop R5
	s_pop R30


	vf_mul R1 R2 R5
	vf_mul R1 R1 R1

	vv_mul_ele R1 R1 R5
	vv_add R1 R8 R1
	v_mov R8 R1
L14:	s_write_low R1 32
	s_write_high R1 0
	ii_add R7 R7 R1

	s_setzero R1
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s_d R6 R1 0
	s_write_low R1 1
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R6 R1 1
	s_write_low R1 2
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R6 R1 2
	s_write_low R1 3
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R6 R1 3

	s_write_low R1 4
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s_d R5 R1 0
	s_write_low R1 5
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R5 R1 1
	s_write_low R1 6
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R5 R1 2
	s_write_low R1 7
	s_write_high R1 0
	ii_muli R1 R1 4
	ii_add R1 R1 R7
	s_load_4byte R1 R1 0
	v_get_from_s R5 R1 3

	
	
	s_get_from_v R2 R6 3
	s_setzero R1
	s_itof R1 R1
	cmp_f R2 R1
	bg L4
L3:	v_mov R1 R9
	vv_sub R2 R0 R11

	s_push R30
	
	jmp_link dot
	
	s_pop R30



	s_write_low R2 0
	s_write_high R2 16128

	s_write_low R3 0
	s_write_high R3 16256

	s_push R30
	
	jmp_link clamp
	
	s_pop R30


	s_write_low R3 0
	s_write_high R3 8192
	s_load_4byte R2 R3 96
	v_get_from_s_d R1 R2 0
	s_load_4byte R2 R3 100
	v_get_from_s R1 R2 1
	s_load_4byte R2 R3 104
	v_get_from_s R1 R2 2
	s_load_4byte R2 R3 108
	v_get_from_s R1 R2 3
	vv_mul_ele R1 R1 R7
	vf_mul R1 R1 R1
	vv_add R1 R8 R1
	v_mov R8 R1
	v_mov R1 R8
	s_setzero R1

	s_write_low R2 0
	s_write_high R2 16256

	s_push R30
	
	jmp_link clampv
	
	s_pop R30
	v_mov R4 R1
	v_mov R8 R4
	v_mov R1 R8
	s_mov R29 R28
	s_pop R28
	ret
mod:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0


	ii_div R3 R1 R2

	ii_mul R3 R3 R2

	ii_sub R1 R1 R3

	s_mov R29 R28
	s_pop R28
	ret
NormalDist:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0


	ff_mul R2 R2 R2

	ff_mul R1 R1 R1
	s_write_low R3 0
	s_write_high R3 16256
	ff_sub R3 R2 R3
	ff_mul R1 R1 R3
	s_write_low R3 0
	s_write_high R3 16256
	ff_add R1 R1 R3

	ff_mul R1 R1 R1

	ff_div R1 R2 R1

	s_mov R29 R28
	s_pop R28
	ret
HammonSmith:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0
	s_mov R4 R1

	s_mov R1 R3
	s_setzero R3
	cmp_f R2 R3
	bl L15
	jmp L16
L15:	ff_sub R2 R0 R2

L16:	s_setzero R3
	cmp_f R4 R3
	bl L17
	jmp L18
L17:	ff_sub R4 R0 R4

L18:	s_write_low R3 0
	s_write_high R3 16384
	ff_mul R3 R3 R4
	ff_mul R3 R3 R2
	s_write_low R5 0
	s_write_high R5 16256
	ff_sub R5 R5 R1
	ff_mul R3 R3 R5
	ff_add R2 R2 R4
	ff_mul R1 R1 R2
	ff_add R3 R3 R1

	s_write_low R1 0
	s_write_high R1 16128
	ff_div R1 R1 R3

	s_mov R29 R28
	s_pop R28
	ret
distance:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0


	vv_sub R1 R1 R2

	vv_mul_ele R1 R1 R1
	v_reduce R1 R1
	s_sqrt R1 R1

	s_mov R29 R28
	s_pop R28
	ret
max:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0


	cmp_f R1 R2
	bg L19
	s_mov R1 R2
	s_mov R29 R28
	s_pop R28
	ret
	jmp L20
L19:
	s_mov R29 R28
	s_pop R28
	ret
L20:
	s_mov R29 R28
	s_pop R28
	ret
normalize:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0

	vv_mul_ele R2 R1 R1
	v_reduce R1 R2
	s_sqrt R1 R1

	vf_div R1 R1 R1

	s_mov R29 R28
	s_pop R28
	ret
dot:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0


	vv_mul_ele R1 R1 R2
	v_reduce R1 R1

	s_mov R29 R28
	s_pop R28
	ret
cross:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0


	
	s_get_from_v R7 R1 0

	
	
	s_get_from_v R6 R1 1

	
	
	s_get_from_v R2 R1 2

	
	s_get_from_v R5 R2 0

	
	
	s_get_from_v R4 R2 1

	
	
	s_get_from_v R1 R2 2

	ff_mul R3 R6 R1
	ff_mul R8 R2 R4
	ff_sub R3 R3 R8

	ff_mul R2 R2 R5
	ff_mul R1 R7 R1
	ff_sub R2 R2 R1

	ff_mul R1 R7 R4
	ff_mul R4 R6 R5
	ff_sub R1 R1 R4

	v_get_from_s_d R1 R3 0
	v_get_from_s R1 R2 1
	v_get_from_s R1 R1 2
	s_setzero R1
	s_itof R1 R1
	v_get_from_s R1 R1 3

	s_mov R29 R28
	s_pop R28
	ret
clamp:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0



	cmp_f R1 R2
	bl L21
	cmp_f R1 R3
	bg L23
	jmp L24
L23:	s_mov R1 R3
L24:	jmp L22
L21:	s_mov R1 R2
L22:
	s_mov R29 R28
	s_pop R28
	ret
clampv:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0



	
	s_get_from_v R3 R1 0
	cmp_f R3 R1
	bl L25
	
	s_get_from_v R3 R1 0
	cmp_f R3 R2
	bg L27
	jmp L28
L27:	
	v_get_from_s R1 R2 0
L28:	jmp L26
L25:	
	v_get_from_s R1 R1 0
L26:	
	
	s_get_from_v R3 R1 1
	cmp_f R3 R1
	bl L29
	
	
	s_get_from_v R3 R1 1
	cmp_f R3 R2
	bg L31
	jmp L32
L31:	
	
	v_get_from_s R1 R2 1
L32:	jmp L30
L29:	
	
	v_get_from_s R1 R1 1
L30:	
	
	s_get_from_v R3 R1 2
	cmp_f R3 R1
	bl L33
	
	
	s_get_from_v R3 R1 2
	cmp_f R3 R2
	bg L35
	jmp L36
L35:	
	
	v_get_from_s R1 R2 2
L36:	jmp L34
L33:	
	
	v_get_from_s R1 R1 2
L34:	
	
	s_get_from_v R3 R1 3
	cmp_f R3 R1
	bl L37
	
	
	s_get_from_v R1 R1 3
	cmp_f R1 R2
	bg L39
	jmp L40
L39:	
	
	v_get_from_s R1 R2 3
L40:	jmp L38
L37:	
	
	v_get_from_s R1 R1 3
L38:
	s_mov R29 R28
	s_pop R28
	ret

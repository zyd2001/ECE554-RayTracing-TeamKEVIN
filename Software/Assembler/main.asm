	s_mov R28 R29
	s_mov R2 R28
main:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0
	s_mov R4 R1

	s_write_low R1 65520
	s_write_high R1 0
	ii_add R6 R2 R1

	s_write_low R5 320
	s_write_high R5 0

	s_write_low R3 180
	s_write_high R3 0

	s_write_low R2 0
	s_write_high R2 16256

	s_setzero R1
	v_get_from_s_d R3 R1 0
	s_setzero R1
	v_get_from_s R3 R1 1
	s_write_low R1 0
	s_write_high R1 16576
	v_get_from_s R3 R1 2
	s_setzero R1
	v_get_from_s R3 R1 3

	s_setzero R1
	v_get_from_s_d R1 R1 0
	s_setzero R1
	v_get_from_s R1 R1 1
	s_write_low R1 0
	s_write_high R1 49024
	v_get_from_s R1 R1 2
	s_setzero R1
	v_get_from_s R1 R1 3

	s_setzero R1
	v_get_from_s_d R2 R1 0
	s_write_low R1 0
	s_write_high R1 16256
	v_get_from_s R2 R1 1
	s_setzero R1
	v_get_from_s R2 R1 2
	s_write_low R1 0
	s_write_high R1 16256
	v_get_from_s R2 R1 3

	ii_div R1 R4 R5

	ii_mod R8 R4 R5

	s_itof R7 R3
	s_itof R4 R5
	ff_div R7 R7 R4

	s_write_low R4 0
	s_write_high R4 16256
	s_itof R1 R1
	s_write_low R9 0
	s_write_high R9 16128
	ff_add R1 R1 R9
	s_itof R3 R3
	ff_div R1 R1 R3
	s_write_low R3 0
	s_write_high R3 16384
	ff_mul R1 R1 R3
	ff_sub R4 R4 R1
	ff_mul R4 R4 R7

	s_write_low R1 0
	s_write_high R1 16384
	s_itof R7 R8
	s_write_low R3 0
	s_write_high R3 16128
	ff_add R7 R7 R3
	s_itof R3 R5
	ff_div R7 R7 R3
	ff_mul R1 R1 R7
	s_write_low R3 0
	s_write_high R3 16256
	ff_sub R1 R1 R3

	ff_mul R4 R4 R2

	ff_mul R1 R1 R2

	vv_sub R1 R3 R1

	s_push R30
	
	v_push R2
	s_push R1
	jmp_link normalize
	
	s_pop R1
	v_pop R2
	s_pop R30

	v_mov R5 R1
	v_mov R1 R2
	v_mov R2 R5
	s_push R30
	
	s_push R6
	s_push R4
	s_push R1
	jmp_link cross
	
	s_pop R1
	s_pop R4
	s_pop R6
	s_pop R30

	v_mov R4 R1
	v_mov R1 R5
	v_mov R2 R4
	s_push R30
	
	s_push R6
	s_push R4
	s_push R1
	jmp_link cross
	
	s_pop R1
	s_pop R4
	s_pop R6
	s_pop R30


	vv_sub R2 R0 R5
	vf_mul R4 R4 R1
	vv_add R2 R2 R4
	vf_mul R1 R1 R4
	vv_add R2 R2 R1

	s_setzero R1
	
	
	v_get_from_s R2 R1 3
	v_mov R1 R2
	s_push R30
	
	jmp_link normalize
	
	s_pop R30

	v_mov R2 R1
	v_mov R14 R3
	v_mov R15 R2
	
	v_push R3
	v_push R2
	s_push R6
	Trace
	
	s_pop R6
	v_pop R2
	v_pop R3


	
	
	s_get_from_v R2 R14 3
	s_setzero R1
	cmp_i R2 R1
	be L0
	v_mov R1 R3

	v_mov R3 R14
	v_mov R4 R15
	
	
	s_get_from_v R1 R14 3

	s_push R30
	
	jmp_link hit_shader
	
	s_pop R30

	s_setzero R1
	ii_muli R1 R1 16
	ii_add R6 R1 R6
	v_store_16byte R1 R6 0
	jmp L1
L0:	v_mov R1 R3

	v_mov R3 R14
	v_mov R4 R15
	s_push R30
	
	jmp_link miss_shader
	
	s_pop R30

	s_setzero R1
	ii_muli R1 R1 16
	ii_add R6 R1 R6
	v_store_16byte R1 R6 0
L1:	Fin
hit_shader:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0
	

	
	v_mov R1 R4
	
	s_setzero R1
	v_get_from_s_d R3 R1 0
	s_setzero R1
	v_get_from_s R3 R1 1
	s_setzero R1
	v_get_from_s R3 R1 2
	s_setzero R1
	v_get_from_s R3 R1 3

	s_write_low R1 52429
	s_write_high R1 16204
	v_get_from_s_d R4 R1 0
	s_write_low R1 52429
	s_write_high R1 16204
	v_get_from_s R4 R1 1
	s_write_low R1 52429
	s_write_high R1 16204
	v_get_from_s R4 R1 2
	s_write_low R1 0
	s_write_high R1 16256
	v_get_from_s R4 R1 3

	s_setzero R1
	v_get_from_s_d R5 R1 0
	s_write_low R1 0
	s_write_high R1 16256
	v_get_from_s R5 R1 1
	s_write_low R1 0
	s_write_high R1 16256
	v_get_from_s R5 R1 2
	s_write_low R1 0
	s_write_high R1 16256
	v_get_from_s R5 R1 3

	
	
	
	
	
	

	vv_sub R2 R0 R2

	s_push R30
	
	jmp_link dot
	
	s_pop R30


	vv_mul_ele R1 R4 R5
	vf_mul R1 R1 R1
	vv_add R1 R3 R1

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
	s_itof R3 R3
	cmp_f R2 R3
	bl L2
	jmp L3
L2:	ff_sub R2 R0 R2

L3:	s_setzero R3
	s_itof R3 R3
	cmp_f R4 R3
	bl L4
	jmp L5
L4:	ff_sub R4 R0 R4

L5:	s_write_low R3 2
	s_write_high R3 0
	s_itof R3 R3
	ff_mul R3 R3 R4
	ff_mul R3 R3 R2
	s_write_low R5 1
	s_write_high R5 0
	s_itof R5 R5
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


	vv_sub R3 R1 R2
	vv_sub R1 R1 R2
	vv_mul_ele R3 R3 R1
	v_reduce R1 R3
	s_sqrt R1 R1

	s_mov R29 R28
	s_pop R28
	ret
miss_shader:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0
	
	v_mov R1 R2
	
	
	s_write_low R1 36700
	s_write_high R1 16194
	v_get_from_s_d R3 R1 0
	s_write_low R1 55050
	s_write_high R1 16195
	v_get_from_s R3 R1 1
	s_write_low R1 46662
	s_write_high R1 16211
	v_get_from_s R3 R1 2
	s_write_low R1 0
	s_write_high R1 16256
	v_get_from_s R3 R1 3

	s_write_low R1 44564
	s_write_high R1 16135
	v_get_from_s_d R2 R1 0
	s_write_low R1 55575
	s_write_high R1 16206
	v_get_from_s R2 R1 1
	s_write_low R1 34079
	s_write_high R1 16235
	v_get_from_s R2 R1 2
	s_write_low R1 0
	s_write_high R1 16256
	v_get_from_s R2 R1 3

	s_setzero R1

	
	
	s_get_from_v R2 R1 1

	s_push R30
	
	jmp_link max
	
	s_pop R30


	vf_mul R1 R2 R1
	s_write_low R2 0
	s_write_high R2 16256
	ff_sub R2 R2 R1
	vf_mul R2 R3 R2
	vv_add R1 R1 R2

	s_mov R29 R28
	s_pop R28
	ret
max:	s_push R28
	s_mov R28 R29
	ii_addi R29 R29 0


	cmp_f R1 R2
	bg L6
	s_mov R1 R2
	s_mov R29 R28
	s_pop R28
	ret
	jmp L7
L6:
	s_mov R29 R28
	s_pop R28
	ret
L7:
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

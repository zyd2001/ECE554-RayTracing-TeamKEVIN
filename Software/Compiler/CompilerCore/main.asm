	s_mov RS29 RS28
	s_mov RS2 RS28
main:	s_push RS28
	s_mov RS28 RS29
	ii_addi RS29 RS29 0


	s_write_low RS3 65520
	s_write_high RS3 0
	ii_add RS5 RS2 RS3

	s_write_low RS2 0
	s_write_high RS2 8192
	s_load_4byte RS2 RS2 0
	ii_div RS2 RS1 RS2

	s_write_low RS3 0
	s_write_high RS3 8192
	s_load_4byte RS3 RS3 0
	ii_mod RS3 RS1 RS3

	s_write_low RS6 0
	s_write_high RS6 8192
	s_load_4byte RS6 RS6 4
	s_itof RS6 RS6
	s_write_low RS1 0
	s_write_high RS1 8192
	s_load_4byte RS1 RS1 0
	s_itof RS1 RS1
	ff_div RS6 RS6 RS1

	s_write_low RS1 1
	s_write_high RS1 0
	s_itof RS2 RS2
	s_write_low RS4 0
	s_write_high RS4 16128
	ff_add RS2 RS2 RS4
	s_write_low RS4 0
	s_write_high RS4 8192
	s_load_4byte RS4 RS4 4
	s_itof RS4 RS4
	ff_div RS2 RS2 RS4
	s_write_low RS4 2
	s_write_high RS4 0
	s_itof RS4 RS4
	ff_mul RS2 RS2 RS4
	s_itof RS1 RS1
	ff_sub RS1 RS1 RS2
	ff_mul RS1 RS1 RS6

	s_write_low RS2 2
	s_write_high RS2 0
	s_itof RS4 RS3
	s_write_low RS3 0
	s_write_high RS3 16128
	ff_add RS4 RS4 RS3
	s_write_low RS3 0
	s_write_high RS3 8192
	s_load_4byte RS3 RS3 0
	s_itof RS3 RS3
	ff_div RS4 RS4 RS3
	s_itof RS2 RS2
	ff_mul RS2 RS2 RS4
	s_write_low RS3 1
	s_write_high RS3 0
	s_itof RS3 RS3
	ff_sub RS2 RS2 RS3

	s_write_low RS3 0
	s_write_high RS3 8192
	s_load_4byte RS3 RS3 12
	ff_mul RS1 RS1 RS3

	s_write_low RS3 0
	s_write_high RS3 8192
	s_load_4byte RS3 RS3 12
	ff_mul RS2 RS2 RS3

	s_write_low RS3 0
	s_write_high RS3 8192
	v_load_16byte RV1 RS3 16
	s_write_low RS3 0
	s_write_high RS3 8192
	v_load_16byte RV2 RS3 32
	vv_sub RV1 RV1 RV2

	s_push RS30
	
	s_push RS1
	jmp_link normalize
	
	s_pop RS1
	s_pop RS30

	v_mov RV3 RV1
	s_write_low RS3 0
	s_write_high RS3 8192
	v_load_16byte RV1 RS3 48

	v_mov RV2 RV3
	s_push RS30
	
	s_push RS5
	s_push RS2
	s_push RS1
	jmp_link cross
	
	s_pop RS1
	s_pop RS2
	s_pop RS5
	s_pop RS30

	v_mov RV2 RV1
	v_mov RV1 RV3

	s_push RS30
	
	s_push RS5
	s_push RS2
	s_push RS1
	jmp_link cross
	
	s_pop RS1
	s_pop RS2
	s_pop RS5
	s_pop RS30


	vv_sub RV3 RV0 RV3
	vf_mul RV2 RV2 RS2
	vv_add RV3 RV3 RV2
	vf_mul RV1 RV1 RS1
	vv_add RV3 RV3 RV1
	s_write_low RS3 0
	s_write_high RS3 8192
	v_load_16byte RV1 RS3 16
	vv_add RV3 RV3 RV1

	s_setzero RS3
	
	
	v_get_from_s RV3 RS3 3
	v_mov RV1 RV3
	s_push RS30
	
	s_push RS1
	jmp_link normalize
	
	s_pop RS1
	s_pop RS30

	v_mov RV3 RV1
	v_get_from_s_d RV1 RS2 0
	v_get_from_s RV1 RS1 1
	s_write_low RS1 0
	s_write_high RS1 49024
	v_get_from_s RV1 RS1 2
	s_setzero RS1
	s_itof RS1 RS1
	v_get_from_s RV1 RS1 3

	v_mov RV14 RV1
	v_mov RV15 RV3
	
	v_push RV3
	v_push RV1
	s_push RS5
	Trace
	
	s_pop RS5
	v_pop RV1
	v_pop RV3


	
	
	s_get_from_v RS2 RV14 3
	s_setzero RS1
	cmp_i RS2 RS1
	be L0

	v_mov RV2 RV3
	v_mov RV3 RV14
	v_mov RV4 RV15
	
	
	s_get_from_v RS1 RV14 3

	s_push RS30
	
	s_push RS5
	jmp_link hit_shader
	
	s_pop RS5
	s_pop RS30

	s_setzero RS1
	ii_muli RS1 RS1 16
	ii_add RS5 RS1 RS5
	v_store_16byte RV1 RS5 0
	jmp L1
L0:
	v_mov RV2 RV3
	v_mov RV3 RV14
	v_mov RV4 RV15
	s_push RS30
	
	jmp_link miss_shader
	
	s_pop RS30

	s_setzero RS1
	ii_muli RS1 RS1 16
	ii_add RS5 RS1 RS5
	v_store_16byte RV1 RS5 0
L1:	Fin
hit_shader:	s_push RS28
	s_mov RS28 RS29
	ii_addi RS29 RS29 16

	v_store_16byte RV1 RS28 0
	v_mov RV13 RV2
	v_mov RV12 RV3
	v_mov RV11 RV4
	
	s_setzero RS1
	v_get_from_s_d RV10 RS1 0
	s_setzero RS1
	v_get_from_s RV10 RS1 1
	s_setzero RS1
	v_get_from_s RV10 RS1 2
	s_setzero RS1
	v_get_from_s RV10 RS1 3

	s_write_low RS1 52429
	s_write_high RS1 16204
	v_get_from_s_d RV9 RS1 0
	s_write_low RS1 52429
	s_write_high RS1 16204
	v_get_from_s RV9 RS1 1
	s_write_low RS1 52429
	s_write_high RS1 16204
	v_get_from_s RV9 RS1 2
	s_write_low RS1 0
	s_write_high RS1 16256
	v_get_from_s RV9 RS1 3

	s_write_low RS10 0
	s_write_high RS10 8192
	s_load_4byte RS10 RS10 96

	s_setzero RS1
	ii_muli RS1 RS1 16
	ii_add RS10 RS1 RS10
	v_load_16byte RV1 RS10 0
	v_mov RV8 RV1
	s_write_low RS1 0
	s_write_high RS1 16256
	v_get_from_s_d RV7 RS1 0
	s_write_low RS1 0
	s_write_high RS1 16256
	v_get_from_s RV7 RS1 1
	s_write_low RS1 0
	s_write_high RS1 16256
	v_get_from_s RV7 RS1 2
	s_write_low RS1 0
	s_write_high RS1 16256
	v_get_from_s RV7 RS1 3

	s_setzero RS1
	v_get_from_s_d RV6 RS1 0
	s_write_low RS1 0
	s_write_high RS1 16256
	v_get_from_s RV6 RS1 1
	s_write_low RS1 0
	s_write_high RS1 16256
	v_get_from_s RV6 RS1 2
	s_write_low RS1 0
	s_write_high RS1 16256
	v_get_from_s RV6 RS1 3

	s_write_low RS9 1
	s_write_high RS9 0

	s_write_low RS8 1
	s_write_high RS8 0

	
	
	s_get_from_v RS2 RV8 3
	s_setzero RS1
	cmp_f RS2 RS1
	ii_addi RS2 RS0 1
	bg L5
	s_setzero RS2
L5:	s_write_low RS1 512
	s_write_high RS1 16384
	cmp_i RS10 RS1
	ii_addi RS1 RS0 1
	bl L6
	s_setzero RS1
L6:	and RS2 RS2 RS1
	cmp_i RS2 RS0
	be L3
L4:	s_write_low RS1 1
	s_write_high RS1 0
	ii_muli RS1 RS1 16
	ii_add RS10 RS1 RS10
	v_load_16byte RV1 RS10 0
	v_mov RV5 RV1
	s_write_low RS1 32
	s_write_high RS1 0
	ii_add RS10 RS10 RS1

	
	
	s_get_from_v RS7 RV8 3

	s_setzero RS1
	
	
	v_get_from_s RV8 RS1 3
	vv_sub RV3 RV8 RV12

	vv_mul_ele RV1 RV3 RV3
	v_reduce RS6 RV1
	s_sqrt RS6 RS6

	v_mov RV4 RV8
	s_setzero RS1
	ii_muli RS1 RS1 16
	ii_add RS10 RS1 RS10
	v_load_16byte RV1 RS10 0
	v_mov RV8 RV1
	v_mov RV1 RV3
	s_push RS30
	
	jmp_link normalize
	
	s_pop RS30
	v_mov RV3 RV1

	v_mov RV1 RV11
	v_mov RV2 RV3
	s_push RS30
	
	jmp_link dot
	
	s_pop RS30

	s_mov RS5 RS1
	s_setzero RS1
	s_itof RS1 RS1
	cmp_f RS5 RS1
	bl L7
	jmp L8
	jmp L2
L8:	v_mov RV14 RV12
	v_mov RV15 RV3
	
	v_push RV13
	v_push RV12
	v_push RV11
	v_push RV10
	v_push RV9
	v_push RV8
	v_push RV7
	v_push RV6
	v_push RV5
	v_push RV4
	v_push RV3
	s_push RS10
	s_push RS9
	s_push RS8
	s_push RS7
	s_push RS6
	s_push RS5
	Trace
	
	s_pop RS5
	s_pop RS6
	s_pop RS7
	s_pop RS8
	s_pop RS9
	s_pop RS10
	v_pop RV3
	v_pop RV4
	v_pop RV5
	v_pop RV6
	v_pop RV7
	v_pop RV8
	v_pop RV9
	v_pop RV10
	v_pop RV11
	v_pop RV12
	v_pop RV13

	
	v_mov RV1 RV14
	v_load_16byte RV2 RS28 0

	s_push RS30
	
	v_push RV3
	jmp_link distance
	
	v_pop RV3
	s_pop RS30
	s_mov RS2 RS1
	v_mov RV1 RV14
	v_mov RV2 RV4
	s_push RS30
	
	v_push RV3
	jmp_link distance
	
	v_pop RV3
	s_pop RS30

	ff_add RS2 RS2 RS1

	
	
	s_get_from_v RS4 RV14 3
	s_setzero RS1
	cmp_i RS4 RS1
	ii_addi RS4 RS0 1
	bne L11
	s_setzero RS4
L11:	ff_sub RS3 RS2 RS6
	s_write_low RS1 0
	s_write_high RS1 8192
	s_load_4byte RS1 RS1 8
	cmp_f RS3 RS1
	ii_addi RS3 RS0 1
	bg L12
	s_setzero RS3
L12:	ff_sub RS2 RS2 RS6
	s_write_low RS1 0
	s_write_high RS1 8192
	s_load_4byte RS1 RS1 8
	ff_sub RS1 RS0 RS1
	cmp_f RS2 RS1
	ii_addi RS2 RS0 1
	bl L13
	s_setzero RS2
L13:	or RS3 RS3 RS2
	and RS4 RS4 RS3
	cmp_i RS4 RS0
	bne L9
	jmp L10
	jmp L2
L10:	ff_mul RS1 RS7 RS7
	ff_mul RS3 RS6 RS6
	ff_mul RS2 RS7 RS7
	ff_add RS3 RS3 RS2
	ff_div RS1 RS1 RS3

	vf_mul RV1 RV5 RS1
	v_mov RV5 RV1
	vv_sub RV1 RV3 RV13

	s_push RS30
	
	jmp_link normalize
	
	s_pop RS30
	v_mov RV3 RV1

	v_mov RV1 RV11
	vv_sub RV2 RV0 RV13

	s_push RS30
	
	jmp_link dot
	
	s_pop RS30

	s_mov RS3 RS1
	v_mov RV1 RV11
	v_mov RV2 RV3
	s_push RS30
	
	jmp_link dot
	
	s_pop RS30

	s_mov RS2 RS1
	vv_sub RV1 RV0 RV13

	v_mov RV2 RV3
	s_push RS30
	
	jmp_link dot
	
	s_pop RS30
	
	
	s_write_low RS1 55050
	s_write_high RS1 15651
	v_get_from_s_d RV1 RS1 0
	s_write_low RS1 55050
	s_write_high RS1 15651
	v_get_from_s RV1 RS1 1
	s_write_low RS1 55050
	s_write_high RS1 15651
	v_get_from_s RV1 RS1 2
	s_write_low RS1 0
	s_write_high RS1 16256
	v_get_from_s RV1 RS1 3

	vf_mul RV2 RV6 RS8
	s_write_low RS1 1
	s_write_high RS1 0
	s_itof RS1 RS1
	ff_sub RS1 RS1 RS8
	vf_mul RV1 RV1 RS1
	vv_add RV2 RV2 RV1

	s_write_low RS1 1
	s_write_high RS1 0
	s_itof RS1 RS1
	ff_sub RS1 RS1 RS8
	vf_mul RV1 RV6 RS1
	v_mov RV6 RV1
	vv_sub RV1 RV7 RV2
	vv_mul_ele RV1 RV1 RV6
	vv_mul_ele RV1 RV1 RV5
	vv_add RV1 RV10 RV1
	v_mov RV10 RV1
	s_mov RS1 RS2
	s_mov RS2 RS9
	s_push RS30
	
	s_push RS3
	jmp_link NormalDist
	
	s_pop RS3
	s_pop RS30

	s_mov RS4 RS1
	s_mov RS1 RS3
	s_mov RS2 RS5
	s_mov RS3 RS9
	s_push RS30
	
	s_push RS4
	jmp_link HammonSmith
	
	s_pop RS4
	s_pop RS30


	vf_mul RV1 RV2 RS4
	vf_mul RV1 RV1 RS1

	vv_mul_ele RV1 RV1 RV5
	vv_add RV1 RV10 RV1
	v_mov RV10 RV1
L2:	
	
	s_get_from_v RS2 RV8 3
	s_setzero RS1
	cmp_f RS2 RS1
	ii_addi RS2 RS0 1
	bg L14
	s_setzero RS2
L14:	s_write_low RS1 512
	s_write_high RS1 16384
	cmp_i RS10 RS1
	ii_addi RS1 RS0 1
	bl L15
	s_setzero RS1
L15:	and RS2 RS2 RS1
	cmp_i RS2 RS0
	bne L4
L3:	v_mov RV1 RV11
	vv_sub RV2 RV0 RV13

	s_push RS30
	
	jmp_link dot
	
	s_pop RS30


	vv_mul_ele RV1 RV9 RV6
	vf_mul RV1 RV1 RS1
	vv_add RV1 RV10 RV1

	s_mov RS29 RS28
	s_pop RS28
	ret
NormalDist:	s_push RS28
	s_mov RS28 RS29
	ii_addi RS29 RS29 0


	ff_mul RS2 RS2 RS2

	ff_mul RS1 RS1 RS1
	s_write_low RS3 1
	s_write_high RS3 0
	s_itof RS3 RS3
	ff_sub RS3 RS2 RS3
	ff_mul RS1 RS1 RS3
	s_write_low RS3 1
	s_write_high RS3 0
	s_itof RS3 RS3
	ff_add RS1 RS1 RS3

	ff_mul RS1 RS1 RS1

	ff_div RS1 RS2 RS1

	s_mov RS29 RS28
	s_pop RS28
	ret
HammonSmith:	s_push RS28
	s_mov RS28 RS29
	ii_addi RS29 RS29 0
	s_mov RS4 RS1

	s_mov RS1 RS3
	s_setzero RS3
	s_itof RS3 RS3
	cmp_f RS2 RS3
	bl L16
	jmp L17
L16:	ff_sub RS2 RS0 RS2

L17:	s_setzero RS3
	s_itof RS3 RS3
	cmp_f RS4 RS3
	bl L18
	jmp L19
L18:	ff_sub RS4 RS0 RS4

L19:	s_write_low RS3 2
	s_write_high RS3 0
	s_itof RS3 RS3
	ff_mul RS3 RS3 RS4
	ff_mul RS3 RS3 RS2
	s_write_low RS5 1
	s_write_high RS5 0
	s_itof RS5 RS5
	ff_sub RS5 RS5 RS1
	ff_mul RS3 RS3 RS5
	ff_add RS2 RS2 RS4
	ff_mul RS1 RS1 RS2
	ff_add RS3 RS3 RS1

	s_write_low RS1 0
	s_write_high RS1 16128
	ff_div RS1 RS1 RS3

	s_mov RS29 RS28
	s_pop RS28
	ret
distance:	s_push RS28
	s_mov RS28 RS29
	ii_addi RS29 RS29 0


	vv_sub RV3 RV1 RV2
	vv_sub RV1 RV1 RV2
	vv_mul_ele RV3 RV3 RV1
	v_reduce RS1 RV3
	s_sqrt RS1 RS1

	s_mov RS29 RS28
	s_pop RS28
	ret
miss_shader:	s_push RS28
	s_mov RS28 RS29
	ii_addi RS29 RS29 0
	

	
	
	s_setzero RS1

	
	
	s_get_from_v RS2 RV2 1

	s_push RS30
	
	jmp_link max
	
	s_pop RS30


	s_write_low RS2 0
	s_write_high RS2 8192
	v_load_16byte RV1 RS2 80
	vf_mul RV1 RV1 RS1
	s_write_low RS2 0
	s_write_high RS2 8192
	v_load_16byte RV2 RS2 64
	s_write_low RS2 1
	s_write_high RS2 0
	s_itof RS2 RS2
	ff_sub RS2 RS2 RS1
	vf_mul RV2 RV2 RS2
	vv_add RV1 RV1 RV2

	s_mov RS29 RS28
	s_pop RS28
	ret
max:	s_push RS28
	s_mov RS28 RS29
	ii_addi RS29 RS29 0


	cmp_f RS1 RS2
	bg L20
	s_mov RS1 RS2
	s_mov RS29 RS28
	s_pop RS28
	ret
	jmp L21
L20:
	s_mov RS29 RS28
	s_pop RS28
	ret
L21:
	s_mov RS29 RS28
	s_pop RS28
	ret
normalize:	s_push RS28
	s_mov RS28 RS29
	ii_addi RS29 RS29 0

	vv_mul_ele RV2 RV1 RV1
	v_reduce RS1 RV2
	s_sqrt RS1 RS1

	vf_div RV1 RV1 RS1

	s_mov RS29 RS28
	s_pop RS28
	ret
dot:	s_push RS28
	s_mov RS28 RS29
	ii_addi RS29 RS29 0


	vv_mul_ele RV1 RV1 RV2
	v_reduce RS1 RV1

	s_mov RS29 RS28
	s_pop RS28
	ret
cross:	s_push RS28
	s_mov RS28 RS29
	ii_addi RS29 RS29 0


	
	s_get_from_v RS7 RV1 0

	
	
	s_get_from_v RS6 RV1 1

	
	
	s_get_from_v RS2 RV1 2

	
	s_get_from_v RS5 RV2 0

	
	
	s_get_from_v RS4 RV2 1

	
	
	s_get_from_v RS1 RV2 2

	ff_mul RS3 RS6 RS1
	ff_mul RS8 RS2 RS4
	ff_sub RS3 RS3 RS8

	ff_mul RS2 RS2 RS5
	ff_mul RS1 RS7 RS1
	ff_sub RS2 RS2 RS1

	ff_mul RS1 RS7 RS4
	ff_mul RS4 RS6 RS5
	ff_sub RS1 RS1 RS4

	v_get_from_s_d RV1 RS3 0
	v_get_from_s RV1 RS2 1
	v_get_from_s RV1 RS1 2
	s_setzero RS1
	s_itof RS1 RS1
	v_get_from_s RV1 RS1 3


	s_mov RS29 RS28
	s_pop RS28
	ret


namespace eval FPU {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries altera_nios_custom_instr_floating_point_2_multi_191 1
    dict set libraries FPU                                                 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/FPSqrt/FPSqrt_memoryC0_uid59_sqrtTableGenerator_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/FPSqrt/FPSqrt_memoryC1_uid60_sqrtTableGenerator_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/FPSqrt/FPSqrt_memoryC2_uid61_sqrtTableGenerator_lutmem.hex"
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/fpoint2_multi.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"                      
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/fpoint2_multi_datapath.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"             
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/fpoint2_multi_dspba_library_package.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/fpoint2_multi_dspba_library.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"        
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/FPAddSub/FPAddSub.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"                  
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/FPDiv/FPDiv.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"                        
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/FPMult/FPMult.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"                      
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/IntToFloat/IntToFloat.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"              
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/FloatToInt/FloatToInt.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"              
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/FPSqrt/FPSqrt_safe_path.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"            
    lappend design_files "ncvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_nios_custom_instr_floating_point_2_multi_191/sim/FPSqrt/FPSqrt.vhd\"  -work altera_nios_custom_instr_floating_point_2_multi_191 -cdslib  ./cds_libs/altera_nios_custom_instr_floating_point_2_multi_191.cds.lib"                      
    lappend design_files "ncvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/FPU.v\"  -work FPU"                                                                                                                                                                                                                     
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
}

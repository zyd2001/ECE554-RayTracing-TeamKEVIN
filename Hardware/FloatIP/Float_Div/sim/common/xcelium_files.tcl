
namespace eval Float_Div {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries altera_fp_functions_191 1
    dict set libraries Float_Div               1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/Float_Div_altera_fp_functions_191_psv3jda_memoryC0_uid112_invTables_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/Float_Div_altera_fp_functions_191_psv3jda_memoryC1_uid115_invTables_lutmem.hex"
    lappend memory_files "$QSYS_SIMDIR/../altera_fp_functions_191/sim/Float_Div_altera_fp_functions_191_psv3jda_memoryC2_uid118_invTables_lutmem.hex"
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "xmvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_fp_functions_191/sim/dspba_library_package.vhd\"  -work altera_fp_functions_191 -cdslib  ./cds_libs/altera_fp_functions_191.cds.lib"                    
    lappend design_files "xmvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_fp_functions_191/sim/dspba_library.vhd\"  -work altera_fp_functions_191 -cdslib  ./cds_libs/altera_fp_functions_191.cds.lib"                            
    lappend design_files "xmvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_fp_functions_191/sim/Float_Div_altera_fp_functions_191_psv3jda.vhd\"  -work altera_fp_functions_191 -cdslib  ./cds_libs/altera_fp_functions_191.cds.lib"
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/Float_Div.v\"  -work Float_Div"                                                                                                                           
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

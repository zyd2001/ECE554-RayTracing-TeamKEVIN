
namespace eval Fix_Sqrt {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries altera_fxp_functions_191 1
    dict set libraries Fix_Sqrt                 1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "xmvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_fxp_functions_191/sim/dspba_library_package.vhd\"  -work altera_fxp_functions_191 -cdslib  ./cds_libs/altera_fxp_functions_191.cds.lib"                    
    lappend design_files "xmvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_fxp_functions_191/sim/dspba_library.vhd\"  -work altera_fxp_functions_191 -cdslib  ./cds_libs/altera_fxp_functions_191.cds.lib"                            
    lappend design_files "xmvhdl -v93 $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/../altera_fxp_functions_191/sim/Fix_Sqrt_altera_fxp_functions_191_pjm2y2i.vhd\"  -work altera_fxp_functions_191 -cdslib  ./cds_libs/altera_fxp_functions_191.cds.lib"
    lappend design_files "xmvlog -compcnfg $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"$QSYS_SIMDIR/Fix_Sqrt.v\"  -work Fix_Sqrt"                                                                                                                                
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

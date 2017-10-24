#
# Vivado (TM) v2017.2 (64-bit)
#
# cerate_proj.tcl: Tcl script for re-creating project 'Obsluga_audio'
#
# Generated by Vivado on Mon Oct 23 15:18:41 +0200 2017
# IP Build 1909766 on Thu Jun 15 19:58:00 MDT 2017
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************
# NOTE: In order to use this script for source control purposes, please make sure that the
#       following files are added to the source control system:-
#
# 1. This project restoration tcl script (cerate_proj.tcl) that was generated.
#
# 2. The following source(s) files that were local or imported into the original project.
#    (Please see the '$orig_proj_dir' and '$origin_dir' variable setting below at the start of the script)
#
#    "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/ip/clk_wiz_1/clk_wiz_1.xci"
#    "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/src/audio_init.v"
#    "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/src/Audio_Codec_Wrapper.vhd"
#    "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/src/TWICtl.vhd"
#    "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/src/i2s_ctl.vhd"
#    "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/src/top.v"
#    "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/constr/constr.xdc"
#
# 3. The following remote source files that were added to the original project:-
#
#    <none>
#
#*****************************************************************************************

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

variable script_file
set script_file "cerate_proj.tcl"

# Help information for this script
proc help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < [llength $::argc]} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir" { incr i; set origin_dir [lindex $::argv $i] }
      "--help"       { help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/filtry_vivado/Obsluga_audio"]"

# Create project
create_project Obsluga_audio C:/KNSS -part xc7a200tsbg484-1 -force

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Reconstruct message rules
# None

# Set project properties
set obj [get_projects Obsluga_audio]
set_property -name "board_part" -value "digilentinc.com:nexys_video:part0:1.1" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/Obsluga_audio.cache/ip" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 "[file normalize "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/ip/clk_wiz_1/clk_wiz_1.xci"]"\
 "[file normalize "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/src/audio_init.v"]"\
 "[file normalize "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/src/Audio_Codec_Wrapper.vhd"]"\
 "[file normalize "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/src/TWICtl.vhd"]"\
 "[file normalize "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/src/i2s_ctl.vhd"]"\
 "[file normalize "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/src/top.v"]"\
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
set file "src/Audio_Codec_Wrapper.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "src/TWICtl.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj

set file "src/i2s_ctl.vhd"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "VHDL" -objects $file_obj


# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "top" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "C:/KNSS_GIT/Adaptacyjne_Filtry_Cyfrowe/Projekty/Obs�uga_audio/constr/constr.xdc"]"
set file_added [add_files -norecurse -fileset $obj $file]
set file "constr/constr.xdc"
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "top" -objects $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part xc7a200tsbg484-1 -flow {Vivado Synthesis 2017} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2017" [get_runs synth_1]
}
set obj [get_runs synth_1]

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part xc7a200tsbg484-1 -flow {Vivado Implementation 2017} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2017" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:Obsluga_audio"

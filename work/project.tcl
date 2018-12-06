set projDir "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/planAhead"
set projName "FB5"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/mojo_top_0.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/display_1.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/display_1.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/alu_3.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/checkOut_4.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/reset_conditioner_5.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/edge_detector_6.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/counter_7.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/edge_detector_6.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/pattern_9.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/patternScreenSecond_10.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/counter_11.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/counter_11.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/adder_13.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/boolean_14.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/compare_15.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/shift_16.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/birdPosition_17.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/pillarShift_18.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/pillarShift_18.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/addition_20.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/muxleft_21.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/muxright_22.v" "C:/Users/LETONG WEI/Desktop/SM2 document/ISTD/50.002/FB5/work/verilog/muxrightsign_23.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/LETONG\ WEI/Desktop/SM2\ document/ISTD/50.002/FB5/constraint/user.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1


# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Project -dir "C:/Users/Jia Ming/Desktop/HDL Project/Project/planAhead_run_5" -part xc3s500efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Jia Ming/Desktop/HDL Project/Project/RS232Txd.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Jia Ming/Desktop/HDL Project/Project} {ipcore_dir} }
add_files [list {ipcore_dir/DPRAM16x2.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/DPRAM24x2.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "RS232Txd.ucf" [current_fileset -constrset]
add_files [list {RS232Txd.ucf}] -fileset [get_property constrset [current_run]]
link_design

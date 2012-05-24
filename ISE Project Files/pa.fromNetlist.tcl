
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Mandelbrot2 -dir "C:/Users/Charles/Documents/Mandelbrot/ISE Project Files/planAhead_run_1" -part xc6slx45csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Charles/Documents/Mandelbrot/ISE Project Files/mainController.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Charles/Documents/Mandelbrot/ISE Project Files} {ipcore_dir} }
set_property target_constrs_file "AtlysGeneral.ucf" [current_fileset -constrset]
add_files [list {AtlysGeneral.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design

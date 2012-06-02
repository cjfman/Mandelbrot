
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Mandelbrot2 -dir "C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files/planAhead_run_1" -part xc6slx45csg324-3
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files/mainController.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files} {ipcore_dir} }
add_files [list {ipcore_dir/MemoryReadFIFO.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "AtlysGeneral.ucf" [current_fileset -constrset]
add_files [list {AtlysGeneral.ucf}] -fileset [get_property constrset [current_run]]
open_netlist_design
read_xdl -file "C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files/mainController.ncd"
if {[catch {read_twx -name results_1 -file "C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files/mainController.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"C:/Users/Charles Franklin/Documents/FPGA/Mandelbrot/ISE Project Files/mainController.twx\": $eInfo"
}

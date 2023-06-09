gui_open_window Wave
gui_sg_create pixelClock480p_group
gui_list_add_group -id Wave.1 {pixelClock480p_group}
gui_sg_addsignal -group pixelClock480p_group {pixelClock480p_tb.test_phase}
gui_set_radix -radix {ascii} -signals {pixelClock480p_tb.test_phase}
gui_sg_addsignal -group pixelClock480p_group {{Input_clocks}} -divider
gui_sg_addsignal -group pixelClock480p_group {pixelClock480p_tb.CLK_IN1}
gui_sg_addsignal -group pixelClock480p_group {{Output_clocks}} -divider
gui_sg_addsignal -group pixelClock480p_group {pixelClock480p_tb.dut.clk}
gui_list_expand -id Wave.1 pixelClock480p_tb.dut.clk
gui_sg_addsignal -group pixelClock480p_group {{Status_control}} -divider
gui_sg_addsignal -group pixelClock480p_group {pixelClock480p_tb.LOCKED}
gui_sg_addsignal -group pixelClock480p_group {{Counters}} -divider
gui_sg_addsignal -group pixelClock480p_group {pixelClock480p_tb.COUNT}
gui_sg_addsignal -group pixelClock480p_group {pixelClock480p_tb.dut.counter}
gui_list_expand -id Wave.1 pixelClock480p_tb.dut.counter
gui_zoom -window Wave.1 -full

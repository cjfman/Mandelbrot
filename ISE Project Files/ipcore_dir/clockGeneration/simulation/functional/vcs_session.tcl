gui_open_window Wave
gui_sg_create clockGeneration_group
gui_list_add_group -id Wave.1 {clockGeneration_group}
gui_sg_addsignal -group clockGeneration_group {clockGeneration_tb.test_phase}
gui_set_radix -radix {ascii} -signals {clockGeneration_tb.test_phase}
gui_sg_addsignal -group clockGeneration_group {{Input_clocks}} -divider
gui_sg_addsignal -group clockGeneration_group {clockGeneration_tb.CLK_IN1}
gui_sg_addsignal -group clockGeneration_group {{Output_clocks}} -divider
gui_sg_addsignal -group clockGeneration_group {clockGeneration_tb.dut.clk}
gui_list_expand -id Wave.1 clockGeneration_tb.dut.clk
gui_sg_addsignal -group clockGeneration_group {{Counters}} -divider
gui_sg_addsignal -group clockGeneration_group {clockGeneration_tb.COUNT}
gui_sg_addsignal -group clockGeneration_group {clockGeneration_tb.dut.counter}
gui_list_expand -id Wave.1 clockGeneration_tb.dut.counter
gui_zoom -window Wave.1 -full

# clkmgr APR SDC constraints (auto-generated)
create_clock -name clk_usb_i -period 20.83 [get_ports clk_usb_i]
create_clock -name clk_main_i -period 6.67 [get_ports clk_main_i]
create_clock -name clk_io_i -period 10.417 [get_ports clk_io_i]
create_clock -name clk_i -period 41.67 [get_ports clk_i]
create_clock -name clk_aon_i -period 5000 [get_ports clk_aon_i]

# Each clock group below is a genuinely separate physical clock root
# in the real chip (per OpenTitan's clock tree); CDC between them is
# handled by synchronizer flops in the RTL, not by timing closure.
set_clock_groups -asynchronous -group {clk_i} -group {clk_usb_i} -group {clk_main_i} -group {clk_io_i} -group {clk_aon_i}

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {scanmode_i[*]}]
set_input_delay 1 -clock clk_usb_i [get_ports rst_usb_ni]
set_input_delay 1 -clock clk_i [get_ports rst_shadowed_ni]
set_input_delay 1 -clock clk_usb_i [get_ports rst_root_usb_ni]
set_input_delay 1 -clock clk_i [get_ports rst_root_ni]
set_input_delay 1 -clock clk_main_i [get_ports rst_root_main_ni]
set_input_delay 1 -clock clk_io_i [get_ports rst_root_io_ni]
set_input_delay 1 -clock clk_io_i [get_ports rst_root_io_div4_ni]
set_input_delay 1 -clock clk_io_i [get_ports rst_root_io_div2_ni]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_main_i [get_ports rst_main_ni]
set_input_delay 1 -clock clk_io_i [get_ports rst_io_ni]
set_input_delay 1 -clock clk_io_i [get_ports rst_io_div4_ni]
set_input_delay 1 -clock clk_io_i [get_ports rst_io_div2_ni]
set_input_delay 1 -clock clk_aon_i [get_ports rst_aon_ni]
set_input_delay 1 -clock clk_i [get_ports {pwr_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {lc_hw_debug_en_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {lc_clk_byp_req_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {io_clk_byp_ack_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {idle_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {div_step_down_req_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {calib_rdy_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {all_clk_byp_ack_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {pwr_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {lc_clk_byp_ack_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {jitter_en_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {io_clk_byp_req_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {hi_speed_sel_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {clocks_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {cg_en_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {all_clk_byp_req_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

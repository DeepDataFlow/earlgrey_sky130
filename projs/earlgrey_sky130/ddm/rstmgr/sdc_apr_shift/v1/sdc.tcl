# rstmgr APR SDC constraints (auto-generated)
create_clock -name clk_usb_i -period 20.83 [get_ports clk_usb_i]
create_clock -name clk_por_i -period 5000 [get_ports clk_por_i]
create_clock -name clk_aon_i -period 5000 [get_ports clk_aon_i]
create_clock -name clk_main_i -period 6.67 [get_ports clk_main_i]
create_clock -name clk_io_i -period 10.417 [get_ports clk_io_i]
create_clock -name clk_io_div4_i -period 41.67 [get_ports clk_io_div4_i]
create_clock -name clk_io_div2_i -period 20.83 [get_ports clk_io_div2_i]
create_clock -name clk_i -period 41.67 [get_ports clk_i]

# Each clock group below is a genuinely separate physical clock root
# in the real chip (per OpenTitan's clock tree); CDC between them is
# handled by synchronizer flops in the RTL, not by timing closure.
set_clock_groups -asynchronous -group {clk_i} -group {clk_usb_i} -group {clk_por_i clk_aon_i} -group {clk_main_i} -group {clk_io_i} -group {clk_io_div4_i} -group {clk_io_div2_i}

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {scanmode_i[*]}]
set_input_delay 1 -clock clk_i [get_ports scan_rst_ni]
set_input_delay 1 -clock clk_aon_i [get_ports rst_por_ni]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {pwr_i[*]}]
set_input_delay 1 -clock clk_aon_i [get_ports {por_n_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {cpu_dump_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_dump_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {sw_rst_req_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {rst_en_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {resets_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {pwr_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

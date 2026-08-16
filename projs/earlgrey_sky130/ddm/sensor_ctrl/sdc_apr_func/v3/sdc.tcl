# sensor_ctrl APR SDC constraints (100MHz main, 200kHz AON)
create_clock -name clk_i -period 41.67 [get_ports clk_i]
create_clock -name clk_aon_i -period 5000 [get_ports clk_aon_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_aon_i [get_ports rst_aon_ni]
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_aon_i [get_ports {ast_status_i[*]}]
set_input_delay 1 -clock clk_aon_i [get_ports {ast_init_done_i[*]}]
set_input_delay 1 -clock clk_aon_i [get_ports {ast_alert_i[*]}]
set_input_delay 1 -clock clk_aon_i [get_ports {ast2pinmux_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_aon_i [get_ports wkup_req_o]
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_aon_i [get_ports {manual_pad_attr_o[*]}]
set_output_delay 1 -clock clk_i [get_ports intr_io_status_change_o]
set_output_delay 1 -clock clk_i [get_ports intr_init_status_change_o]
set_output_delay 1 -clock clk_aon_i [get_ports {cio_ast_debug_out_o[*]}]
set_output_delay 1 -clock clk_aon_i [get_ports {cio_ast_debug_out_en_o[*]}]
set_output_delay 1 -clock clk_aon_i [get_ports {ast_alert_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

# clk_i and clk_aon_i are genuinely asynchronous (separate clock sources);
# CDC is handled by synchronizer flops (e.g. u_wake_sync), not by timing closure.
set_clock_groups -asynchronous -group {clk_i} -group {clk_aon_i}

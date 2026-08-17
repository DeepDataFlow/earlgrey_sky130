# edn APR SDC constraints (auto-generated)
create_clock -name clk_i -period 6.67 [get_ports clk_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {edn_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {csrng_cmd_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports intr_edn_fatal_err_o]
set_output_delay 1 -clock clk_i [get_ports intr_edn_cmd_req_done_o]
set_output_delay 1 -clock clk_i [get_ports {edn_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {csrng_cmd_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

# hmac APR SDC constraints (auto-generated)
create_clock -name clk_i -period 6.67 [get_ports clk_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports intr_hmac_err_o]
set_output_delay 1 -clock clk_i [get_ports intr_hmac_done_o]
set_output_delay 1 -clock clk_i [get_ports intr_fifo_empty_o]
set_output_delay 1 -clock clk_i [get_ports {idle_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

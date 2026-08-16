# rv_timer APR SDC constraints (200MHz)
create_clock -name clk_i -period 41.67 [get_ports clk_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {racl_policies_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {racl_error_o[*]}]
set_output_delay 1 -clock clk_i [get_ports intr_timer_expired_hart0_timer0_o]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

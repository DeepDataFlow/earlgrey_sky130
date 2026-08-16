# adc_ctrl APR SDC constraints (auto-generated)
create_clock -name clk_i -period 41.67 [get_ports clk_i]
create_clock -name clk_aon_i -period 5000 [get_ports clk_aon_i]

# Each clock group below is a genuinely separate physical clock root
# in the real chip (per OpenTitan's clock tree); CDC between them is
# handled by synchronizer flops in the RTL, not by timing closure.
set_clock_groups -asynchronous -group {clk_i} -group {clk_aon_i}

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_aon_i [get_ports rst_aon_ni]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {adc_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports wkup_req_o]
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports intr_match_pending_o]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {adc_o[*]}]

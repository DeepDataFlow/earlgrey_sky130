# rv_plic APR SDC constraints (auto-generated)
create_clock -name clk_i -period 6.67 [get_ports clk_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {intr_src_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports msip_o]
set_output_delay 1 -clock clk_i [get_ports irq_o]
set_output_delay 1 -clock clk_i [get_ports {irq_id_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

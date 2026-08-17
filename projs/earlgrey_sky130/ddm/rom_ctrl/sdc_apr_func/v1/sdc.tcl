# rom_ctrl APR SDC constraints (auto-generated)
create_clock -name clk_i -period 6.67 [get_ports clk_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {rom_tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {rom_cfg_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {regs_tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {kmac_data_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {rom_tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports rom_cfg_o]
set_output_delay 1 -clock clk_i [get_ports {regs_tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {pwrmgr_data_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {kmac_data_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {keymgr_data_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

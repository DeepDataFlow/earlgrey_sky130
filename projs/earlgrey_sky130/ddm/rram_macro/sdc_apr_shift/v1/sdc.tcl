# rram_macro APR SDC constraints (auto-generated)
create_clock -name clk_i -period 6.67 [get_ports clk_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {scanmode_i[*]}]
set_input_delay 1 -clock clk_i [get_ports scan_rst_ni]
set_input_delay 1 -clock clk_i [get_ports scan_en_i]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {rram_macro_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {prim_tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {obs_ctrl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {lc_nvm_debug_en_i[*]}]
set_input_delay 1 -clock clk_i [get_ports cio_tms_i]
set_input_delay 1 -clock clk_i [get_ports cio_tdi_i]
set_input_delay 1 -clock clk_i [get_ports cio_tck_i]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {rram_obs_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {rram_macro_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {prim_tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports cio_tdo_o]
set_output_delay 1 -clock clk_i [get_ports cio_tdo_en_o]

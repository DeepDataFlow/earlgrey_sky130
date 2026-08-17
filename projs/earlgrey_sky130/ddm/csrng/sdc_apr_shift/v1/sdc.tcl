# csrng APR SDC constraints (auto-generated)
create_clock -name clk_i -period 6.67 [get_ports clk_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {otp_en_csrng_sw_app_read_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {lc_hw_debug_en_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {entropy_src_hw_if_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {csrng_cmd_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports intr_cs_hw_inst_exc_o]
set_output_delay 1 -clock clk_i [get_ports intr_cs_fatal_err_o]
set_output_delay 1 -clock clk_i [get_ports intr_cs_entropy_req_o]
set_output_delay 1 -clock clk_i [get_ports intr_cs_cmd_req_done_o]
set_output_delay 1 -clock clk_i [get_ports entropy_src_hw_if_o]
set_output_delay 1 -clock clk_i [get_ports {csrng_cmd_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

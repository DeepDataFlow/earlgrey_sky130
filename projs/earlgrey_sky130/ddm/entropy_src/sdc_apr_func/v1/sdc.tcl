# entropy_src APR SDC constraints (auto-generated)
create_clock -name clk_i -period 6.67 [get_ports clk_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {otp_en_entropy_src_fw_read_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {otp_en_entropy_src_fw_over_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {entropy_src_xht_meta_i[*]}]
set_input_delay 1 -clock clk_i [get_ports entropy_src_rng_valid_i]
set_input_delay 1 -clock clk_i [get_ports {entropy_src_rng_bits_i[*]}]
set_input_delay 1 -clock clk_i [get_ports entropy_src_hw_if_i]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports rng_fips_o]
set_output_delay 1 -clock clk_i [get_ports intr_es_observe_fifo_ready_o]
set_output_delay 1 -clock clk_i [get_ports intr_es_health_test_failed_o]
set_output_delay 1 -clock clk_i [get_ports intr_es_fatal_err_o]
set_output_delay 1 -clock clk_i [get_ports intr_es_entropy_valid_o]
set_output_delay 1 -clock clk_i [get_ports entropy_src_xht_valid_o]
set_output_delay 1 -clock clk_i [get_ports {entropy_src_xht_meta_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {entropy_src_xht_health_test_window_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {entropy_src_xht_bits_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {entropy_src_xht_bit_sel_o[*]}]
set_output_delay 1 -clock clk_i [get_ports entropy_src_rng_enable_o]
set_output_delay 1 -clock clk_i [get_ports {entropy_src_hw_if_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

# keymgr APR SDC constraints (auto-generated)
create_clock -name clk_i -period 6.67 [get_ports clk_i]
create_clock -name clk_edn_i -period 6.67 [get_ports clk_edn_i]

# Each clock group below is a genuinely separate physical clock root
# in the real chip (per OpenTitan's clock tree); CDC between them is
# handled by synchronizer flops in the RTL, not by timing closure.
set_clock_groups -asynchronous -group {clk_i} -group {clk_edn_i}

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports rst_shadowed_ni]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports rst_edn_ni]
set_input_delay 1 -clock clk_i [get_ports {rom_digest_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {otp_key_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {otp_device_id_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {lc_keymgr_en_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {lc_keymgr_div_i[*]}]
set_input_delay 1 -clock clk_i [get_ports kmac_en_masking_i]
set_input_delay 1 -clock clk_i [get_ports {kmac_data_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {flash_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {edn_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {otbn_key_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {kmac_key_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {kmac_data_o[*]}]
set_output_delay 1 -clock clk_i [get_ports intr_op_done_o]
set_output_delay 1 -clock clk_i [get_ports edn_o]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {aes_key_o[*]}]

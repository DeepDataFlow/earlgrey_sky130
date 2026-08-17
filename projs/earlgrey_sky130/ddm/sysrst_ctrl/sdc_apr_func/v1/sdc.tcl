# sysrst_ctrl APR SDC constraints (auto-generated)
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
set_input_delay 1 -clock clk_i [get_ports cio_pwrb_in_i]
set_input_delay 1 -clock clk_i [get_ports cio_lid_open_i]
set_input_delay 1 -clock clk_i [get_ports cio_key2_in_i]
set_input_delay 1 -clock clk_i [get_ports cio_key1_in_i]
set_input_delay 1 -clock clk_i [get_ports cio_key0_in_i]
set_input_delay 1 -clock clk_i [get_ports cio_flash_wp_l_i]
set_input_delay 1 -clock clk_i [get_ports cio_ec_rst_l_i]
set_input_delay 1 -clock clk_i [get_ports cio_ac_present_i]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports wkup_req_o]
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports rst_req_o]
set_output_delay 1 -clock clk_i [get_ports intr_event_detected_o]
set_output_delay 1 -clock clk_i [get_ports cio_z3_wakeup_o]
set_output_delay 1 -clock clk_i [get_ports cio_z3_wakeup_en_o]
set_output_delay 1 -clock clk_i [get_ports cio_pwrb_out_o]
set_output_delay 1 -clock clk_i [get_ports cio_pwrb_out_en_o]
set_output_delay 1 -clock clk_i [get_ports cio_key2_out_o]
set_output_delay 1 -clock clk_i [get_ports cio_key2_out_en_o]
set_output_delay 1 -clock clk_i [get_ports cio_key1_out_o]
set_output_delay 1 -clock clk_i [get_ports cio_key1_out_en_o]
set_output_delay 1 -clock clk_i [get_ports cio_key0_out_o]
set_output_delay 1 -clock clk_i [get_ports cio_key0_out_en_o]
set_output_delay 1 -clock clk_i [get_ports cio_flash_wp_l_o]
set_output_delay 1 -clock clk_i [get_ports cio_flash_wp_l_en_o]
set_output_delay 1 -clock clk_i [get_ports cio_ec_rst_l_o]
set_output_delay 1 -clock clk_i [get_ports cio_ec_rst_l_en_o]
set_output_delay 1 -clock clk_i [get_ports cio_bat_disable_o]
set_output_delay 1 -clock clk_i [get_ports cio_bat_disable_en_o]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

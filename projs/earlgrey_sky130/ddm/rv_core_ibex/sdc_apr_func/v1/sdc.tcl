# rv_core_ibex APR SDC constraints (auto-generated)
create_clock -name clk_otp_i -period 41.67 [get_ports clk_otp_i]
create_clock -name clk_esc_i -period 41.67 [get_ports clk_esc_i]
create_clock -name clk_i -period 6.67 [get_ports clk_i]
create_clock -name clk_edn_i -period 6.67 [get_ports clk_edn_i]

# Each clock group below is a genuinely separate physical clock root
# in the real chip (per OpenTitan's clock tree); CDC between them is
# handled by synchronizer flops in the RTL, not by timing closure.
set_clock_groups -asynchronous -group {clk_i} -group {clk_otp_i clk_esc_i} -group {clk_edn_i}

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {scanmode_i[*]}]
set_input_delay 1 -clock clk_i [get_ports scan_rst_ni]
set_input_delay 1 -clock clk_i [get_ports rst_otp_ni]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports rst_esc_ni]
set_input_delay 1 -clock clk_i [get_ports rst_edn_ni]
set_input_delay 1 -clock clk_i [get_ports {ram_cfg_icache_tag_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {ram_cfg_icache_data_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {pwrmgr_cpu_en_i[*]}]
set_input_delay 1 -clock clk_i [get_ports nmi_wdog_i]
set_input_delay 1 -clock clk_i [get_ports {lc_cpu_en_i[*]}]
set_input_delay 1 -clock clk_i [get_ports irq_timer_i]
set_input_delay 1 -clock clk_i [get_ports irq_software_i]
set_input_delay 1 -clock clk_i [get_ports irq_external_i]
set_input_delay 1 -clock clk_i [get_ports {icache_otp_key_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {hart_id_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {fpga_info_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {esc_tx_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {edn_i[*]}]
set_input_delay 1 -clock clk_i [get_ports debug_req_i]
set_input_delay 1 -clock clk_i [get_ports {corei_tl_h_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {cored_tl_h_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {cfg_tl_d_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {boot_addr_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports rst_cpu_n_o]
set_output_delay 1 -clock clk_i [get_ports {ram_cfg_icache_tag_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {ram_cfg_icache_data_o[*]}]
set_output_delay 1 -clock clk_i [get_ports pwrmgr_o]
set_output_delay 1 -clock clk_i [get_ports icache_otp_key_o]
set_output_delay 1 -clock clk_i [get_ports {esc_rx_o[*]}]
set_output_delay 1 -clock clk_i [get_ports edn_o]
set_output_delay 1 -clock clk_i [get_ports {crash_dump_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {corei_tl_h_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {cored_tl_h_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {cfg_tl_d_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

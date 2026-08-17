# alert_handler APR SDC constraints (auto-generated)
create_clock -name clk_i -period 41.67 [get_ports clk_i]
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
set_input_delay 1 -clock clk_i [get_ports {lpg_rst_en_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {lpg_cg_en_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {esc_rx_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {edn_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_tx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports intr_classd_o]
set_output_delay 1 -clock clk_i [get_ports intr_classc_o]
set_output_delay 1 -clock clk_i [get_ports intr_classb_o]
set_output_delay 1 -clock clk_i [get_ports intr_classa_o]
set_output_delay 1 -clock clk_i [get_ports {esc_tx_o[*]}]
set_output_delay 1 -clock clk_i [get_ports edn_o]
set_output_delay 1 -clock clk_i [get_ports {crashdump_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_rx_o[*]}]

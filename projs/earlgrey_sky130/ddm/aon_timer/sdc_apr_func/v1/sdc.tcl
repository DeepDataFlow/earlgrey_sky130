# aon_timer APR SDC constraints (auto-generated)
create_clock -name clk_i -period 41.67 [get_ports clk_i]
create_clock -name clk_aon_i -period 5000 [get_ports clk_aon_i]

# CDC between the main and AON/slow clock groups is handled by
# synchronizer flops in the RTL, not by same-cycle timing closure.
set_clock_groups -asynchronous -group {clk_i} -group {clk_aon_i}

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports sleep_mode_i]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_aon_i [get_ports rst_aon_ni]
set_input_delay 1 -clock clk_i [get_ports {racl_policies_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {lc_escalate_en_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports wkup_req_o]
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {racl_error_o[*]}]
set_output_delay 1 -clock clk_i [get_ports nmi_wdog_timer_bark_o]
set_output_delay 1 -clock clk_i [get_ports intr_wkup_timer_expired_o]
set_output_delay 1 -clock clk_i [get_ports intr_wdog_timer_bark_o]
set_output_delay 1 -clock clk_aon_i [get_ports aon_timer_rst_req_o]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

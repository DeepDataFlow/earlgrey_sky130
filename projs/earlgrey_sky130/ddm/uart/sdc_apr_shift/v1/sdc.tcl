# uart APR SDC constraints (200MHz)
create_clock -name clk_i -period 5 [get_ports clk_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {racl_policies_i[*]}]
set_input_delay 1 -clock clk_i [get_ports cio_rx_i]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {racl_error_o[*]}]
set_output_delay 1 -clock clk_i [get_ports lsio_trigger_o]
set_output_delay 1 -clock clk_i [get_ports intr_tx_watermark_o]
set_output_delay 1 -clock clk_i [get_ports intr_tx_empty_o]
set_output_delay 1 -clock clk_i [get_ports intr_tx_done_o]
set_output_delay 1 -clock clk_i [get_ports intr_rx_watermark_o]
set_output_delay 1 -clock clk_i [get_ports intr_rx_timeout_o]
set_output_delay 1 -clock clk_i [get_ports intr_rx_parity_err_o]
set_output_delay 1 -clock clk_i [get_ports intr_rx_overflow_o]
set_output_delay 1 -clock clk_i [get_ports intr_rx_frame_err_o]
set_output_delay 1 -clock clk_i [get_ports intr_rx_break_err_o]
set_output_delay 1 -clock clk_i [get_ports cio_tx_o]
set_output_delay 1 -clock clk_i [get_ports cio_tx_en_o]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

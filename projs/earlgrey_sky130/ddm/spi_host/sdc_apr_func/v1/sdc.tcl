# spi_host APR SDC constraints (auto-generated)
create_clock -name clk_i -period 10.417 [get_ports clk_i]

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {racl_policies_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {passthrough_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {cio_sd_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {racl_error_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {passthrough_o[*]}]
set_output_delay 1 -clock clk_i [get_ports lsio_trigger_o]
set_output_delay 1 -clock clk_i [get_ports intr_spi_event_o]
set_output_delay 1 -clock clk_i [get_ports intr_error_o]
set_output_delay 1 -clock clk_i [get_ports {cio_sd_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {cio_sd_en_o[*]}]
set_output_delay 1 -clock clk_i [get_ports cio_sck_o]
set_output_delay 1 -clock clk_i [get_ports cio_sck_en_o]
set_output_delay 1 -clock clk_i [get_ports cio_csb_o]
set_output_delay 1 -clock clk_i [get_ports cio_csb_en_o]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

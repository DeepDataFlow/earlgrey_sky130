# spi_device APR SDC constraints (auto-generated)
create_clock -name scan_clk_i -period 20.83 [get_ports scan_clk_i]
create_clock -name clk_i -period 41.67 [get_ports clk_i]

# Each clock group below is a genuinely separate physical clock root
# in the real chip (per OpenTitan's clock tree); CDC between them is
# handled by synchronizer flops in the RTL, not by timing closure.
set_clock_groups -asynchronous -group {clk_i} -group {scan_clk_i}

# --- Input Delays ---
set_input_delay 1 -clock clk_i [get_ports {tl_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {scanmode_i[*]}]
set_input_delay 1 -clock clk_i [get_ports scan_rst_ni]
set_input_delay 1 -clock clk_i [get_ports rst_ni]
set_input_delay 1 -clock clk_i [get_ports {ram_cfg_sys2spi_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {ram_cfg_spi2sys_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {racl_policies_i[*]}]
set_input_delay 1 -clock clk_i [get_ports {passthrough_i[*]}]
set_input_delay 1 -clock clk_i [get_ports mbist_en_i]
set_input_delay 1 -clock clk_i [get_ports cio_tpm_csb_i]
set_input_delay 1 -clock clk_i [get_ports {cio_sd_i[*]}]
set_input_delay 1 -clock clk_i [get_ports cio_sck_i]
set_input_delay 1 -clock clk_i [get_ports cio_csb_i]
set_input_delay 1 -clock clk_i [get_ports {alert_rx_i[*]}]

# --- Output Delays ---
set_output_delay 1 -clock clk_i [get_ports {tl_o[*]}]
set_output_delay 1 -clock clk_i [get_ports sck_monitor_o]
set_output_delay 1 -clock clk_i [get_ports ram_cfg_sys2spi_o]
set_output_delay 1 -clock clk_i [get_ports ram_cfg_spi2sys_o]
set_output_delay 1 -clock clk_i [get_ports {racl_error_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {passthrough_o[*]}]
set_output_delay 1 -clock clk_i [get_ports intr_upload_payload_overflow_o]
set_output_delay 1 -clock clk_i [get_ports intr_upload_payload_not_empty_o]
set_output_delay 1 -clock clk_i [get_ports intr_upload_cmdfifo_not_empty_o]
set_output_delay 1 -clock clk_i [get_ports intr_tpm_rdfifo_drop_o]
set_output_delay 1 -clock clk_i [get_ports intr_tpm_rdfifo_cmd_end_o]
set_output_delay 1 -clock clk_i [get_ports intr_tpm_header_not_empty_o]
set_output_delay 1 -clock clk_i [get_ports intr_readbuf_watermark_o]
set_output_delay 1 -clock clk_i [get_ports intr_readbuf_flip_o]
set_output_delay 1 -clock clk_i [get_ports {cio_sd_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {cio_sd_en_o[*]}]
set_output_delay 1 -clock clk_i [get_ports {alert_tx_o[*]}]

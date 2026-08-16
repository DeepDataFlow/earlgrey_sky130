
yosys -import

set t0 [clock milliseconds]

source setup.tcl

set target_lib $fvar(target_lib)
set blkname    $fvar(blkname)

source read_rtl.tcl

hierarchy -top $blkname
uniquify
yosys proc
techmap
dfflibmap -liberty $target_lib
abc -liberty $target_lib
clean
autoname

write_verilog -noattr -noexpr -nohex -nodec -noparam out/$blkname.v

source script/util/util.tcl

report_ports
report_registers
report_hier

set in_count   [sel_count ${blkname}/i:*]
set out_count  [sel_count ${blkname}/o:*]
set reg_count  [sel_count t:DFF*]
set inst_count [sel_count t:*]


exec gset . runtime [get_elapsed_time]
exec gset . memory  [get_memory_usage]
exec gset . input_ports $in_count
exec gset . output_ports $out_count
exec gset . reg_count $reg_count
exec gset . inst_count $inst_count

exec sd -e "ports2svg rpt/ports.rpt out/ports.svg $blkname"

report_port_connection rpt/port_conn.rpt

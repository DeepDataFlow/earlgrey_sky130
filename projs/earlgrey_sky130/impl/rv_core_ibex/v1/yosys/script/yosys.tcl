yosys -import

set t0 [clock milliseconds]

source setup.tcl

set target_lib $fvar(target_lib)
set blkname    $fvar(blkname)


foreach lib $target_lib {
    read_liberty -lib $lib
}

source read_rtl.tcl

hierarchy -check -top $blkname
#hierarchy -top $blkname

uniquify

#yosys proc
#techmap
synth -noabc

set liberty_flags {}
foreach lib $target_lib {
    lappend liberty_flags -liberty $lib
}
dfflegalize -cell {$_DFFE_PP_} 01 -cell {$_DFFSR_NNN_} 01 -cell {$_DFFSR_PNN_} 01 \
    -cell {$_DFF_NN0_} 01 -cell {$_DFF_PN0_} 01 -cell {$_DFF_PN1_} 01 -cell {$_DFF_P_} 01 \
    {t:$_DFF*} {t:$_SDFF*}
dfflibmap {*}$liberty_flags

abc {*}$liberty_flags -dont_use *lpflow* -dont_use sky130_fd_sc_hd__a211oi_*

# dfflibmap/abc only map flip-flops; map any surviving generic latch
# primitives (e.g. from RTL-level clock-gating enable latches) to real
# physical cells so they don't fail physical implementation later.
techmap -map script/util/latch_map.v

clean

autoname

write_verilog -noattr -noexpr -nohex -nodec -noparam out/$blkname.v

source script/util/util.tcl

report_ports
report_registers
report_hier
set unmap_count [report_unmap rpt/unmap.rpt]

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
exec gset . unmap_count $unmap_count

exec sd -e "ports2svg rpt/ports.rpt out/ports.svg $blkname"

report_port_connection rpt/port_conn.rpt




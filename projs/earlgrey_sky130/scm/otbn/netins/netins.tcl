load $env(G2_ROOT)/bin/libtbcload.so
source $env(G2_ROOT)/tcllib/g2lib/g2lib.tbc

set sta_continue_on_error      1
set sta_report_default_digits  3

set blkname [gvar . blkname]

source read_netlist.tcl

puts "Link..."
link_design $blkname

puts "report_macros..."
report_macros

puts "report_ref_cells..."
redirect rpt/cells.rpt { report_ref_cells }

puts "report_ports..."
redirect rpt/report_ports.rpt {report_ports}
gen_ports_rpt rpt/ports.rpt


puts "report_hier..."
redirect rpt/report_hier.rpt  {report_hier}

redirect rpt/report_resource_usage.rpt   {report_resource_usage}

exit

# vim:fdm=marker

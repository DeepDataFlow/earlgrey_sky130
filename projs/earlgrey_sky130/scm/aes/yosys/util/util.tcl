proc report_unmap {{outfile "rpt/unmap.rpt"}} {
    set tmp "/tmp/yosys_unmap_[pid].txt"
    tee -o $tmp dump {t:$_*}
    set fd [open $tmp r]
    set dump [read $fd]
    close $fd
    file delete $tmp

    array set type_count {}
    foreach line [split $dump "\n"] {
        if {[regexp {^\s+cell\s+(\$_\S+)\s+} $line -> ref]} {
            if {![info exist type_count($ref)]} { set type_count($ref) 0 }
            incr type_count($ref)
        }
    }

    set total 0
    set rpt [open $outfile w]
    puts $rpt [format "%-32s %s" "cell_type" "count"]
    puts $rpt [string repeat "-" 44]
    foreach ref [lsort [array names type_count]] {
        puts $rpt [format "%-32s %d" $ref $type_count($ref)]
        incr total $type_count($ref)
    }
    puts $rpt [string repeat "-" 44]
    puts $rpt [format "%-32s %d" "TOTAL" $total]
    close $rpt

    if {$total > 0} {
        puts "WARNING: $total unmapped cell(s) written to $outfile"
    }
    return $total
}

proc get_elapsed_time {} {
    global t0
    set ms  [expr {[clock milliseconds] - $t0}]
    set sec [expr {int(ceil($ms / 1000.0))}]
    if {$sec < 1} { set sec 1 }
    set hh [expr {$sec/3600}]
    set mm [expr {($sec%3600)/60}]
    set ss [expr {$sec%60}]
    if {$hh > 0} {
        return [format "%02dh:%02dm:%02ds" $hh $mm $ss]
    } elseif {$mm > 0} {
        return [format "%02dm:%02ds" $mm $ss]
    } else {
        return [format "%02ds" $ss]
    }
}

proc get_memory_usage {} {
    set kb 0
    catch {
        set fd [open /proc/self/status r]
        regexp {VmRSS:\s+(\d+)} [read $fd] -> kb
        close $fd
    }
    return [expr {int($kb / 1024)}]
}

proc sel_count {args} {
    set tmp "/tmp/yosys_cnt_[pid].txt"
    tee -o $tmp select -count {*}$args
    set fd [open $tmp r]
    set n 0
    regexp {(\d+)} [read $fd] -> n
    close $fd
    file delete $tmp
    return $n
}

proc report_ports {} {
    global blkname
    set tmp "/tmp/yosys_ports_[pid].txt"
    tee -o $tmp dump $blkname

    set fd [open $tmp r]
    set dump [read $fd]
    close $fd
    file delete $tmp

    set rpt [open rpt/ports.rpt w]
    puts $rpt [format "%-12s %-8s %s" "direction" "width" "name"]
    foreach line [split $dump "\n"] {
        set dir "" ; set width 1 ; set name ""
        if {[regexp {^\s+wire\s+width\s+(\d+)\s+(input|output)\s+\d+\s+\\(\S+)} $line -> width dir name]} {
        } elseif {[regexp {^\s+wire\s+(input|output)\s+\d+\s+\\(\S+)} $line -> dir name]} {
        } else { continue }
        puts $rpt [format "%-12s %-8s %s" $dir $width $name]
    }
    close $rpt
}

proc report_registers {} {
    set tmp "/tmp/yosys_regs_[pid].txt"
    tee -o $tmp dump t:DFF*

    set fd [open $tmp r]
    set dump [read $fd]
    close $fd
    file delete $tmp

    set rpt [open rpt/registers.rpt w]
    puts $rpt [format "%-16s %s" "ref_name" "instance"]
    set mod ""
    foreach line [split $dump "\n"] {
        if {[regexp {^module\s+\\?(\S+)} $line -> mod]} {}
        if {[regexp {^\s+cell\s+\\?(\S+)\s+[\\$](\S+)} $line -> ref inst]} {
            puts $rpt [format "%-16s %s/%s" $ref $mod $inst]
        }
    }
    close $rpt
}

proc report_hier {{outfile "rpt/hier.rpt"}} {
    global blkname
    set tmp "/tmp/yosys_hier_[pid].txt"
    tee -o $tmp dump $blkname

    set fd [open $tmp r]
    set dump [read $fd]
    close $fd
    file delete $tmp

    set rpt [open $outfile w]
    puts $rpt [format "%-12s %-24s %s" "cell_count" "instance_name" "module_name"]
    foreach line [split $dump "\n"] {
        if {[regexp {^\s+cell\s+\\(\S+)\s+\\(\S+)} $line -> mod inst]} {
            puts $rpt [format "%-12s %-24s %s" [sel_count ${mod}/t:*] $inst $mod]
        }
    }
    close $rpt
    puts "Written: $outfile"
}

proc report_inst_connection {inst {outfile ""}} {
    set vfiles [glob -nocomplain out/*.v]
    if {[llength $vfiles] == 0} {
        puts "Error: no .v file in out/"; return
    }
    set fd [open [lindex $vfiles 0] r]
    set content [read $fd]
    close $fd

    set ref_name "" ; set rows {} ; set in_inst 0
    foreach line [split $content "\n"] {
        if {!$in_inst} {
            if {[regexp {^\s+(\w+)\s+} $line -> ref] && [string match "*$inst *" $line]} {
                set ref_name $ref ; set in_inst 1
            }
        } else {
            if {[regexp {^\s+\);\s*$} $line]} { break }
            if {[regexp {^\s+\.(\w+)\((.+?)\),?\s*$} $line -> port net]} {
                lappend rows [list $port $net]
            }
        }
    }

    set sep [string repeat "-" 80]
    set out "Instance Connection Report\n"
    append out "  Instance : $inst\n"
    append out "  Module   : $ref_name\n"
    append out "$sep\n"
    append out [format "  %-38s %s\n" "PORT" "NET"]
    append out "$sep\n"
    foreach row $rows {
        append out [format "  %-38s %s\n" [lindex $row 0] [lindex $row 1]]
    }

    if {$outfile ne ""} {
        set fd [open $outfile w]
        puts -nonewline $fd $out
        close $fd
        puts "Written: $outfile ([llength $rows] connections)"
    } else { puts $out }
}

proc report_port_connection {{outfile ""}} {
    global blkname

    set tmp "/tmp/yosys_pc_[pid].txt"
    tee -o $tmp dump $blkname
    set fd [open $tmp r] ; set dump [read $fd] ; close $fd
    file delete $tmp

    set port_list {}
    array set port_dir {} ; array set port_width {}
    foreach line [split $dump "\n"] {
        if {[regexp {^\s+wire\s+width\s+(\d+)\s+(input|output)\s+\d+\s+\\(\S+)} $line -> w d n]} {
            lappend port_list $n ; set port_dir($n) $d ; set port_width($n) $w
        } elseif {[regexp {^\s+wire\s+(input|output)\s+\d+\s+\\(\S+)} $line -> d n]} {
            lappend port_list $n ; set port_dir($n) $d ; set port_width($n) 1
        }
    }

    array set net_conns {}
    set cur_inst ""
    foreach line [split $dump "\n"] {
        if {[regexp {^\s+cell\s+\\\S+\s+\\(\S+)} $line -> inst]} {
            set cur_inst $inst
        } elseif {[regexp {^\s+end\s*$} $line]} {
            set cur_inst ""
        } elseif {$cur_inst ne "" && [regexp {^\s+connect\s+\\(\S+)\s+(.+)} $line -> cport net]} {
            foreach {_ bnet} [regexp -all -inline {\\(\w+)} $net] {
                if {![info exist net_conns($bnet)]} { set net_conns($bnet) {} }
                set entry "$cur_inst.$cport"
                if {[lsearch $net_conns($bnet) $entry] < 0} { lappend net_conns($bnet) $entry }
            }
        }
    }

    set sep [string repeat "-" 80]
    set out "Port Connection Report\n"
    append out "  Module : $blkname\n"
    append out "  Ports  : [llength $port_list]\n"
    append out "$sep\n"

    set ordered {}
    foreach d {input output inout} {
        foreach name $port_list { if {$port_dir($name) eq $d} { lappend ordered $name } }
    }
    foreach name $ordered {
        set d $port_dir($name) ; set w $port_width($name)
        set pname [expr {$w > 1 ? "${name}\[[expr {$w-1}]:0\]" : $name}]
        append out "\n[format {  %-10s %s} $d $pname]\n"
        if {[info exist net_conns($name)] && [llength $net_conns($name)] > 0} {
            foreach conn $net_conns($name) {
                append out [format "%33s%-25s -> %s\n" "" $pname $conn]
            }
        } else {
            append out [format "%33s%-25s -> (unconnected)\n" "" $pname]
        }
    }

    if {$outfile ne ""} {
        set fd [open $outfile w] ; puts -nonewline $fd $out ; close $fd
        puts "Written: $outfile ([llength $port_list] ports)"
    } else { puts $out }
}

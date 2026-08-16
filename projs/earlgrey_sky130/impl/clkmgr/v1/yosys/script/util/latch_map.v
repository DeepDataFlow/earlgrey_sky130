// Maps Yosys's generic latch primitives to real sky130_fd_sc_hd latch cells.
// dfflibmap only maps flip-flops ($_DFF*), never latches, so without this
// map any $_DLATCH_* cell left over from clock-gating / RTL-level latches
// (e.g. prim_generic_clock_gating's enable latch) survives synthesis
// unmapped and fails physical implementation with "LEF master not found".
module \$_DLATCH_N_ (E, D, Q);
input E, D;
output Q;
sky130_fd_sc_hd__dlxtn_1 _TECHMAP_REPLACE_ (.D(D), .GATE_N(E), .Q(Q));
endmodule

module \$_DLATCH_P_ (E, D, Q);
input E, D;
output Q;
sky130_fd_sc_hd__dlxtp_1 _TECHMAP_REPLACE_ (.D(D), .GATE(E), .Q(Q));
endmodule

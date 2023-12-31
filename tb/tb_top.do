onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/w_clk
add wave -noupdate /tb_top/w_rstn
add wave -noupdate /tb_top/r_clk
add wave -noupdate /tb_top/r_rstn
add wave -noupdate -radix unsigned /tb_top/bin_w_cntr
add wave -noupdate -radix binary /tb_top/w_value_for_sync
add wave -noupdate /tb_top/_u_syncronizer_gray/w_value
add wave -noupdate -radix binary /tb_top/_u_syncronizer_gray/r_value
add wave -noupdate -radix binary /tb_top/_u_syncronizer_gray/r_value_o
add wave -noupdate -radix unsigned /tb_top/bin_cntr_synced
add wave -noupdate /tb_top/r_value_synced
add wave -noupdate -radix unsigned -childformat {{{/tb_top/r_value_wo_gray[9]} -radix unsigned} {{/tb_top/r_value_wo_gray[8]} -radix unsigned} {{/tb_top/r_value_wo_gray[7]} -radix unsigned} {{/tb_top/r_value_wo_gray[6]} -radix unsigned} {{/tb_top/r_value_wo_gray[5]} -radix unsigned} {{/tb_top/r_value_wo_gray[4]} -radix unsigned} {{/tb_top/r_value_wo_gray[3]} -radix unsigned} {{/tb_top/r_value_wo_gray[2]} -radix unsigned} {{/tb_top/r_value_wo_gray[1]} -radix unsigned} {{/tb_top/r_value_wo_gray[0]} -radix unsigned}} -subitemconfig {{/tb_top/r_value_wo_gray[9]} {-height 17 -radix unsigned} {/tb_top/r_value_wo_gray[8]} {-height 17 -radix unsigned} {/tb_top/r_value_wo_gray[7]} {-height 17 -radix unsigned} {/tb_top/r_value_wo_gray[6]} {-height 17 -radix unsigned} {/tb_top/r_value_wo_gray[5]} {-height 17 -radix unsigned} {/tb_top/r_value_wo_gray[4]} {-height 17 -radix unsigned} {/tb_top/r_value_wo_gray[3]} {-height 17 -radix unsigned} {/tb_top/r_value_wo_gray[2]} {-height 17 -radix unsigned} {/tb_top/r_value_wo_gray[1]} {-height 17 -radix unsigned} {/tb_top/r_value_wo_gray[0]} {-height 17 -radix unsigned}} /tb_top/r_value_wo_gray
add wave -noupdate -radix unsigned /tb_top/_u_syncronizer_bin/r_value
add wave -noupdate /tb_top/_u_syncronizer_gray/changed_bits
add wave -noupdate /tb_top/_u_syncronizer_bin/changed_bits
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {59273600 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 331
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {59091200 ps} {59404900 ps}

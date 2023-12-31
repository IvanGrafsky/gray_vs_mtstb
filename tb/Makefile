SRC=
ROOT_PATH=./..

SRC+=$(ROOT_PATH)/src/bin2gray.sv
SRC+=$(ROOT_PATH)/src/gray2bin.sv
SRC+=$(ROOT_PATH)/src/syncronizer.sv
SRC+=$(ROOT_PATH)/tb/tb_top.sv

compile_all:
	vlib work
	vlog -sv $(SRC)

clean:
	vdel -all

top: compile_all
	vsim -gui -quiet work.tb_top -do tb_top.do -do "run -all"
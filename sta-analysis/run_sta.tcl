read_liberty /home/gmsarath/Sarath/vlsi_wrk/OpenROAD/test/Nangate45/Nangate45_typ.lib
read_verilog /home/gmsarath/Sarath/vlsi_wrk/sta_exercise/sta-project/synthesis_yosys/alu_sunthesized.v
link_design alu_with_mux
read_sdc -e constraints.sdc


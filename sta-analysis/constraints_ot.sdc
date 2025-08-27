
create_clock -name CLK -period 1000
set_input_delay 5 -clock CLK [get_ports A]
set_input_delay 5 -clock CLK [get_ports B]
set_output_delay 5 -clock CLK [get_ports result]

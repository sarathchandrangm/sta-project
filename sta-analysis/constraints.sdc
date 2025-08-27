
create_clock -name CLK -period 1000
set_input_delay 5 -clock CLK [get_ports A]
set_input_delay 5 -clock CLK [get_ports B]
set_output_delay 5 -clock CLK [get_ports result]

# Report the worst setup path
report_checks -path_delay max

# Report the worst hold path
report_checks -path_delay min

# Report the 5 worst setup paths to output port "out1"
report_checks -path_delay max -to result -endpoint_count 5

# Report all unconstrained paths with full details
report_checks -unconstrained -format full

# Report both worst setup and hold paths, sorted by slack, and redirect to a file
report_checks -path_delay min_max -sort_by_slack

report_checks -group_path_count 100 > my_report.txt

### Document this ####

proc report_timing_paths {args} {
    set path_ends [sta::find_timing_paths_cmd "find_timing_paths" args]
    puts $path_ends
    puts $args
    set pathno 1
    foreach path_end $path_ends {
        set start_clock [get_property [get_property $path_end startpoint_clock] full_name]
        set start_point [get_property [get_property $path_end startpoint] full_name]
        set end_point [get_property [get_property $path_end endpoint] full_name]
        set end_clock [get_property [get_property $path_end endpoint_clock] full_name]
        set slack [get_property $path_end slack]
        puts "Path ${pathno} : "
        puts " [format "%-80s" $start_point], ${start_clock}"
        set points [get_property $path_end points]
        foreach point $points {
            set arrival [get_property $point arrival]
            set pin [get_property [get_property $point pin] full_name]
            set cslack [get_property $point slack]
            puts " [format "%-80s" $pin], $arrival"
        }
        puts " [format "%-80s" $end_point], ${end_clock}, [format "%.3f" $slack]"
        incr pathno
        puts ""
    }
}


report_timing_paths -from A -to result -group_path_count 2 -sort_by_slack 
report_checks -path_delay min_max -format full_clock_expanded -fields {slew cap input_pins nets fanout}  -endpoint_count 10 -unique_paths_to_endpoint > ./sta_report.rpt

set_property -dict {PACKAGE_PIN AD12 IOSTANDARD LVDS} [get_ports sys_clk_p]

#bank 15
set_property PACKAGE_PIN P21 [get_ports {hit[0]}]
set_property PACKAGE_PIN M22 [get_ports {hit[1]}]
#set_property PACKAGE_PIN M28 [get_ports {hit[0]}]
#set_property PACKAGE_PIN K28 [get_ports {hit[1]}]
# set_property PACKAGE_PIN M23 [get_ports {hit[0]}]
# set_property PACKAGE_PIN M22 [get_ports {hit[1]}]
set_property PACKAGE_PIN M25 [get_ports {hit[2]}]
set_property PACKAGE_PIN M24 [get_ports {hit[3]}]

#bank 13
set_property PACKAGE_PIN AK26 [get_ports {hit[4]}]
set_property PACKAGE_PIN AJ26 [get_ports {hit[5]}]
set_property PACKAGE_PIN AF27 [get_ports {hit[6]}]
set_property PACKAGE_PIN AF26 [get_ports {hit[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hit[*]}]


set_property PACKAGE_PIN H19 [get_ports {led[0]}]
set_property PACKAGE_PIN J19 [get_ports {led[1]}]
set_property PACKAGE_PIN K20 [get_ports {led[2]}]
set_property PACKAGE_PIN K19 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[*]}]


set_property -dict {PACKAGE_PIN G28 IOSTANDARD LVCMOS33} [get_ports usb_rst_n]
set_property -dict {PACKAGE_PIN A26 IOSTANDARD LVCMOS33} [get_ports usb_pw_en]
set_property -dict {PACKAGE_PIN C25 IOSTANDARD LVCMOS33} [get_ports usb_clk]
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports usb_rxf_n]
set_property -dict {PACKAGE_PIN B27 IOSTANDARD LVCMOS33} [get_ports usb_txf_n]
set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports usb_we_n]
set_property -dict {PACKAGE_PIN D21 IOSTANDARD LVCMOS33} [get_ports usb_rd_n]
set_property -dict {PACKAGE_PIN C21 IOSTANDARD LVCMOS33} [get_ports usb_oe_n]
set_property -dict {PACKAGE_PIN C16 IOSTANDARD LVCMOS33} [get_ports usb_wakeup]
set_property -dict {PACKAGE_PIN D16 IOSTANDARD LVCMOS33} [get_ports usb_siwu]
set_property -dict {PACKAGE_PIN E25 IOSTANDARD LVCMOS33} [get_ports usb_led]


set_property -dict {PACKAGE_PIN E28 IOSTANDARD LVCMOS33} [get_ports {usb_be[0]}]
set_property -dict {PACKAGE_PIN D28 IOSTANDARD LVCMOS33} [get_ports {usb_be[1]}]
set_property -dict {PACKAGE_PIN E29 IOSTANDARD LVCMOS33} [get_ports {usb_be[2]}]
set_property -dict {PACKAGE_PIN E30 IOSTANDARD LVCMOS33} [get_ports {usb_be[3]}]

set_property -dict {PACKAGE_PIN A22 IOSTANDARD LVCMOS33} [get_ports {usb_data[0]}]
set_property -dict {PACKAGE_PIN B22 IOSTANDARD LVCMOS33} [get_ports {usb_data[1]}]
set_property -dict {PACKAGE_PIN A21 IOSTANDARD LVCMOS33} [get_ports {usb_data[2]}]
set_property -dict {PACKAGE_PIN A20 IOSTANDARD LVCMOS33} [get_ports {usb_data[3]}]
set_property -dict {PACKAGE_PIN B20 IOSTANDARD LVCMOS33} [get_ports {usb_data[4]}]
set_property -dict {PACKAGE_PIN C20 IOSTANDARD LVCMOS33} [get_ports {usb_data[5]}]
set_property -dict {PACKAGE_PIN C22 IOSTANDARD LVCMOS33} [get_ports {usb_data[6]}]
set_property -dict {PACKAGE_PIN D22 IOSTANDARD LVCMOS33} [get_ports {usb_data[7]}]
set_property -dict {PACKAGE_PIN B23 IOSTANDARD LVCMOS33} [get_ports {usb_data[8]}]
set_property -dict {PACKAGE_PIN A23 IOSTANDARD LVCMOS33} [get_ports {usb_data[9]}]
set_property -dict {PACKAGE_PIN C24 IOSTANDARD LVCMOS33} [get_ports {usb_data[10]}]
set_property -dict {PACKAGE_PIN B24 IOSTANDARD LVCMOS33} [get_ports {usb_data[11]}]
set_property -dict {PACKAGE_PIN B25 IOSTANDARD LVCMOS33} [get_ports {usb_data[12]}]
set_property -dict {PACKAGE_PIN D26 IOSTANDARD LVCMOS33} [get_ports {usb_data[13]}]
set_property -dict {PACKAGE_PIN C26 IOSTANDARD LVCMOS33} [get_ports {usb_data[14]}]
set_property -dict {PACKAGE_PIN A25 IOSTANDARD LVCMOS33} [get_ports {usb_data[15]}]
set_property -dict {PACKAGE_PIN G23 IOSTANDARD LVCMOS33} [get_ports {usb_data[16]}]
set_property -dict {PACKAGE_PIN G24 IOSTANDARD LVCMOS33} [get_ports {usb_data[17]}]
set_property -dict {PACKAGE_PIN E23 IOSTANDARD LVCMOS33} [get_ports {usb_data[18]}]
set_property -dict {PACKAGE_PIN D23 IOSTANDARD LVCMOS33} [get_ports {usb_data[19]}]
set_property -dict {PACKAGE_PIN F26 IOSTANDARD LVCMOS33} [get_ports {usb_data[20]}]
set_property -dict {PACKAGE_PIN E26 IOSTANDARD LVCMOS33} [get_ports {usb_data[21]}]
set_property -dict {PACKAGE_PIN E24 IOSTANDARD LVCMOS33} [get_ports {usb_data[22]}]
set_property -dict {PACKAGE_PIN D24 IOSTANDARD LVCMOS33} [get_ports {usb_data[23]}]
set_property -dict {PACKAGE_PIN H20 IOSTANDARD LVCMOS33} [get_ports {usb_data[24]}]
set_property -dict {PACKAGE_PIN G20 IOSTANDARD LVCMOS33} [get_ports {usb_data[25]}]
set_property -dict {PACKAGE_PIN H21 IOSTANDARD LVCMOS33} [get_ports {usb_data[26]}]
set_property -dict {PACKAGE_PIN H22 IOSTANDARD LVCMOS33} [get_ports {usb_data[27]}]
set_property -dict {PACKAGE_PIN F21 IOSTANDARD LVCMOS33} [get_ports {usb_data[28]}]
set_property -dict {PACKAGE_PIN E21 IOSTANDARD LVCMOS33} [get_ports {usb_data[29]}]
set_property -dict {PACKAGE_PIN G22 IOSTANDARD LVCMOS33} [get_ports {usb_data[30]}]
set_property -dict {PACKAGE_PIN F22 IOSTANDARD LVCMOS33} [get_ports {usb_data[31]}]






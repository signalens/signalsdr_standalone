set_property  -dict {PACKAGE_PIN  U20  IOSTANDARD LVCMOS25} [get_ports gpio_sync]                        ;
set_property  -dict {PACKAGE_PIN  N17  IOSTANDARD LVCMOS25} [get_ports gpio_resetb]                      ;


set_property  -dict {PACKAGE_PIN  P18  IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn]         ;
set_property  -dict {PACKAGE_PIN  R14  IOSTANDARD LVCMOS25} [get_ports spi_clk]                          ;
set_property  -dict {PACKAGE_PIN  P15  IOSTANDARD LVCMOS25} [get_ports spi_mosi]                         ;
set_property  -dict {PACKAGE_PIN  R19  IOSTANDARD LVCMOS25} [get_ports spi_miso]                         ;
     
set_property  -dict {PACKAGE_PIN  T15   IOSTANDARD LVCMOS25 PULLTYPE PULLUP} [get_ports iic_scl]     ;    
set_property  -dict {PACKAGE_PIN  P14   IOSTANDARD LVCMOS25 PULLTYPE PULLUP} [get_ports iic_sda]     ;     

set_property  -dict {PACKAGE_PIN P19  IOSTANDARD LVDS_25 } [get_ports  tx_clk_out_n     ]   ; 
set_property  -dict {PACKAGE_PIN N18  IOSTANDARD LVDS_25 } [get_ports  tx_clk_out_p     ]   ; 
set_property  -dict {PACKAGE_PIN Y17  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[0] ]   ; 
set_property  -dict {PACKAGE_PIN Y16  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[0] ]   ; 
set_property  -dict {PACKAGE_PIN U15  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[1] ]   ; 
set_property  -dict {PACKAGE_PIN U14  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[1] ]   ; 
set_property  -dict {PACKAGE_PIN W15  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[2] ]   ; 
set_property  -dict {PACKAGE_PIN V15  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[2] ]   ; 
set_property  -dict {PACKAGE_PIN Y14  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[3] ]   ; 
set_property  -dict {PACKAGE_PIN W14  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[3] ]   ; 
set_property  -dict {PACKAGE_PIN W13  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[4] ]   ; 
set_property  -dict {PACKAGE_PIN V12  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[4] ]   ; 
set_property  -dict {PACKAGE_PIN U12  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[5] ]   ; 
set_property  -dict {PACKAGE_PIN T12  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[5] ]   ; 
set_property  -dict {PACKAGE_PIN U17  IOSTANDARD LVDS_25 } [get_ports  tx_frame_out_n   ]   ; 
set_property  -dict {PACKAGE_PIN T16  IOSTANDARD LVDS_25 } [get_ports  tx_frame_out_p   ]   ; 
set_property  -dict {PACKAGE_PIN P20  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_clk_in_n      ]; 
set_property  -dict {PACKAGE_PIN N20  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_clk_in_p      ]; 
set_property  -dict {PACKAGE_PIN Y19  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_n[0]  ];
set_property  -dict {PACKAGE_PIN Y18  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_p[0]  ];
set_property  -dict {PACKAGE_PIN W20  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_n[1]  ];
set_property  -dict {PACKAGE_PIN V20  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_p[1]  ];
set_property  -dict {PACKAGE_PIN W19  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_n[2]  ];
set_property  -dict {PACKAGE_PIN W18  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_p[2]  ];
set_property  -dict {PACKAGE_PIN R17  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_n[3]  ];
set_property  -dict {PACKAGE_PIN R16  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_p[3]  ];
set_property  -dict {PACKAGE_PIN V18  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_n[4]  ];
set_property  -dict {PACKAGE_PIN V17  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_p[4]  ];
set_property  -dict {PACKAGE_PIN W16  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_n[5]  ];
set_property  -dict {PACKAGE_PIN V16  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_data_in_p[5]  ];
set_property  -dict {PACKAGE_PIN U19  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_frame_in_n    ]; 
set_property  -dict {PACKAGE_PIN U18  IOSTANDARD LVDS_25 DIFF_TERM TRUE } [get_ports  rx_frame_in_p    ]; 

 
create_clock -name rx_clk       -period  4 [get_ports rx_clk_in_p];

 
set_property  -dict {PACKAGE_PIN L14  IOSTANDARD LVCMOS25 } [get_ports  USB_UART_PC2PL]   ; 
set_property  -dict {PACKAGE_PIN L15  IOSTANDARD LVCMOS25 } [get_ports  USB_UART_PL2PC]   ; 
 
set_property  -dict {PACKAGE_PIN C20  IOSTANDARD LVCMOS25 } [get_ports  TX2_AMP_EN]   ;  
set_property  -dict {PACKAGE_PIN B20  IOSTANDARD LVCMOS25 } [get_ports  TX1_AMP_EN]   ;  
set_property  -dict {PACKAGE_PIN B19  IOSTANDARD LVCMOS25 } [get_ports  RX2_LED]   ;  
set_property  -dict {PACKAGE_PIN A20  IOSTANDARD LVCMOS25 } [get_ports  RX1_LED]   ;  
set_property  -dict {PACKAGE_PIN K14  IOSTANDARD LVCMOS25 } [get_ports  PL_LED]   ;   
set_property  -dict {PACKAGE_PIN  k18   IOSTANDARD LVCMOS25} [get_ports  gps_pl_led    ] ; 



set_property  -dict {PACKAGE_PIN  E17   IOSTANDARD LVCMOS25} [get_ports  pps_in    ] ;
set_property  -dict {PACKAGE_PIN  H16   IOSTANDARD LVCMOS25} [get_ports  clk_40m   ] ;
create_clock -name clk_40m       -period 25 [get_ports clk_40m]


set_property  -dict {PACKAGE_PIN  J15   IOSTANDARD LVCMOS25} [get_ports  dac_nsyc  ] ;
set_property  -dict {PACKAGE_PIN  K16    IOSTANDARD LVCMOS25} [get_ports  dac_din   ] ;
set_property  -dict {PACKAGE_PIN  J16   IOSTANDARD LVCMOS25} [get_ports  dac_clk   ] ;

set_property  -dict {PACKAGE_PIN  e19   IOSTANDARD LVCMOS25} [get_ports  sel_clk_src    ] ; 

set_property  -dict {PACKAGE_PIN  d20  IOSTANDARD LVCMOS25} [get_ports  phy_tx_en] ;  
set_property  -dict {PACKAGE_PIN  e18  IOSTANDARD LVCMOS25} [get_ports  phy_tx_err] ;
set_property  -dict {PACKAGE_PIN  f17  IOSTANDARD LVCMOS25} [get_ports  phy_reset_n] ;
set_property  -dict {PACKAGE_PIN  m19  IOSTANDARD LVCMOS25} [get_ports  phy_tx_dout[0]] ;
set_property  -dict {PACKAGE_PIN  m20  IOSTANDARD LVCMOS25} [get_ports  phy_tx_dout[1]] ;
set_property  -dict {PACKAGE_PIN  m17  IOSTANDARD LVCMOS25} [get_ports  phy_tx_dout[2]] ;
set_property  -dict {PACKAGE_PIN  m18  IOSTANDARD LVCMOS25} [get_ports  phy_tx_dout[3]] ;
set_property  -dict {PACKAGE_PIN  l19  IOSTANDARD LVCMOS25} [get_ports  phy_tx_dout[4]] ;
set_property  -dict {PACKAGE_PIN  l20  IOSTANDARD LVCMOS25} [get_ports  phy_tx_dout[5]] ;
set_property  -dict {PACKAGE_PIN  k19  IOSTANDARD LVCMOS25} [get_ports  phy_tx_dout[6]] ;
set_property  -dict {PACKAGE_PIN  j19  IOSTANDARD LVCMOS25} [get_ports  phy_tx_dout[7]] ;
set_property  -dict {PACKAGE_PIN  l16  IOSTANDARD LVCMOS25} [get_ports  phy_tx_clk] ;

set_property  -dict {PACKAGE_PIN  l17  IOSTANDARD LVCMOS25} [get_ports  phy_rx_err] ;
set_property  -dict {PACKAGE_PIN  k17  IOSTANDARD LVCMOS25} [get_ports  phy_rx_clk] ;
create_clock -name phy_rx_clk   -period 8 [get_ports phy_rx_clk]

set_property  -dict {PACKAGE_PIN  h17  IOSTANDARD LVCMOS25} [get_ports  phy_rx_din[0]] ;
set_property  -dict {PACKAGE_PIN  g15  IOSTANDARD LVCMOS25} [get_ports  phy_rx_din[1]] ;
set_property  -dict {PACKAGE_PIN  h18  IOSTANDARD LVCMOS25} [get_ports  phy_rx_din[2]] ;
set_property  -dict {PACKAGE_PIN  f19  IOSTANDARD LVCMOS25} [get_ports  phy_rx_din[3]] ;
set_property  -dict {PACKAGE_PIN  f20  IOSTANDARD LVCMOS25} [get_ports  phy_rx_din[4]] ;
set_property  -dict {PACKAGE_PIN  g17  IOSTANDARD LVCMOS25} [get_ports  phy_rx_din[5]] ;
set_property  -dict {PACKAGE_PIN  g18  IOSTANDARD LVCMOS25} [get_ports  phy_rx_din[6]] ;
set_property  -dict {PACKAGE_PIN  j20  IOSTANDARD LVCMOS25} [get_ports  phy_rx_din[7]] ;


set_property  -dict {PACKAGE_PIN  h20  IOSTANDARD LVCMOS25} [get_ports  phy_rx_dv] ; 
set_property  -dict {PACKAGE_PIN  h15  IOSTANDARD LVCMOS25} [get_ports  phy_gtx_clk] ;
  
set_property  -dict {PACKAGE_PIN M14   IOSTANDARD LVCMOS25  PULLUP true} [ get_ports  scl ]       ;
set_property  -dict {PACKAGE_PIN M15   IOSTANDARD LVCMOS25  PULLUP true}  [ get_ports  sda ]      ;

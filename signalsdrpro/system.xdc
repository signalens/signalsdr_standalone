
set_property  -dict {PACKAGE_PIN  U20  IOSTANDARD LVCMOS25} [get_ports gpio_sync]                        ;
set_property  -dict {PACKAGE_PIN  N17  IOSTANDARD LVCMOS25} [get_ports gpio_resetb]                      ;

set_property  -dict {PACKAGE_PIN  P18  IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn]         ;
set_property  -dict {PACKAGE_PIN  R14  IOSTANDARD LVCMOS25} [get_ports spi_clk]                          ;
set_property  -dict {PACKAGE_PIN  P15  IOSTANDARD LVCMOS25} [get_ports spi_mosi]                         ;
set_property  -dict {PACKAGE_PIN  R19  IOSTANDARD LVCMOS25} [get_ports spi_miso]                         ;
    
set_property  -dict {PACKAGE_PIN  T15   IOSTANDARD LVCMOS25 PULLTYPE PULLUP} [get_ports iic_scl]     ;    
set_property  -dict {PACKAGE_PIN  P14   IOSTANDARD LVCMOS25 PULLTYPE PULLUP} [get_ports iic_sda]     ;    

set_property  -dict {PACKAGE_PIN P19  IOSTANDARD LVDS_25 } [get_ports  tx_clk_out_n     ]   
set_property  -dict {PACKAGE_PIN N18  IOSTANDARD LVDS_25 } [get_ports  tx_clk_out_p     ]   
set_property  -dict {PACKAGE_PIN Y17  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[0] ]   
set_property  -dict {PACKAGE_PIN Y16  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[0] ]   
set_property  -dict {PACKAGE_PIN U15  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[1] ]   
set_property  -dict {PACKAGE_PIN U14  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[1] ]   
set_property  -dict {PACKAGE_PIN W15  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[2] ]   
set_property  -dict {PACKAGE_PIN V15  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[2] ]   
set_property  -dict {PACKAGE_PIN Y14  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[3] ]   
set_property  -dict {PACKAGE_PIN W14  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[3] ]   
set_property  -dict {PACKAGE_PIN W13  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[4] ]   
set_property  -dict {PACKAGE_PIN V12  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[4] ]   
set_property  -dict {PACKAGE_PIN U12  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_n[5] ]   
set_property  -dict {PACKAGE_PIN T12  IOSTANDARD LVDS_25 } [get_ports  tx_data_out_p[5] ]   
set_property  -dict {PACKAGE_PIN U17  IOSTANDARD LVDS_25 } [get_ports  tx_frame_out_n   ]   
set_property  -dict {PACKAGE_PIN T16  IOSTANDARD LVDS_25 } [get_ports  tx_frame_out_p   ]   
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

#SDRPRO ADD
set_property  -dict {PACKAGE_PIN R18  IOSTANDARD LVCMOS25 } [get_ports  USB_UART_PC2PL]   ; 
set_property  -dict {PACKAGE_PIN T17  IOSTANDARD LVCMOS25 } [get_ports  USB_UART_PL2PC]   ; 

set_property  -dict {PACKAGE_PIN T15  IOSTANDARD LVCMOS25 } [get_ports  I2C_SCL]; 
set_property  -dict {PACKAGE_PIN P14  IOSTANDARD LVCMOS25 } [get_ports  I2C_SDA]; 

set_property  -dict {PACKAGE_PIN F19  IOSTANDARD LVCMOS25 } [get_ports  TX1_LED];
set_property  -dict {PACKAGE_PIN N15  IOSTANDARD LVCMOS25 } [get_ports  TX2_LED];
set_property  -dict {PACKAGE_PIN B19  IOSTANDARD LVCMOS25 } [get_ports  PL_LED ];
set_property  -dict {PACKAGE_PIN L17  IOSTANDARD LVCMOS25 } [get_ports  RX1_LED];
set_property  -dict {PACKAGE_PIN N16  IOSTANDARD LVCMOS25 } [get_ports  RX2_LED];

set_property  -dict {PACKAGE_PIN T14  IOSTANDARD LVCMOS25 } [get_ports  FX3_RESETn];

set_property  -dict {PACKAGE_PIN D20  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ0 ];
set_property  -dict {PACKAGE_PIN G19  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ1 ];
set_property  -dict {PACKAGE_PIN H15  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ2 ];
set_property  -dict {PACKAGE_PIN E19  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ3 ];
set_property  -dict {PACKAGE_PIN F20  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ4 ];
set_property  -dict {PACKAGE_PIN G18  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ5 ];
set_property  -dict {PACKAGE_PIN M17  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ6 ];
set_property  -dict {PACKAGE_PIN E18  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ7 ];
set_property  -dict {PACKAGE_PIN M18  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ8 ];
set_property  -dict {PACKAGE_PIN E17  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ9 ];
set_property  -dict {PACKAGE_PIN M15  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ10];
set_property  -dict {PACKAGE_PIN M19  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ11];
set_property  -dict {PACKAGE_PIN M20  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ12];
set_property  -dict {PACKAGE_PIN L20  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ13];
set_property  -dict {PACKAGE_PIN F16  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ14];
set_property  -dict {PACKAGE_PIN C20  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ15];
set_property  -dict {PACKAGE_PIN J18  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ16];
set_property  -dict {PACKAGE_PIN A20  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ17];
set_property  -dict {PACKAGE_PIN J15  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ18];
set_property  -dict {PACKAGE_PIN D19  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ19];
set_property  -dict {PACKAGE_PIN J19  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ20];
set_property  -dict {PACKAGE_PIN J14  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ21];
set_property  -dict {PACKAGE_PIN H18  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ22];
set_property  -dict {PACKAGE_PIN K18  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ23];
set_property  -dict {PACKAGE_PIN K14  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ24];
set_property  -dict {PACKAGE_PIN H17  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ25];
set_property  -dict {PACKAGE_PIN D18  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ26];
set_property  -dict {PACKAGE_PIN L15  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ27];
set_property  -dict {PACKAGE_PIN J16  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ28];
set_property  -dict {PACKAGE_PIN M14  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ29];
set_property  -dict {PACKAGE_PIN L14  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ30];
set_property  -dict {PACKAGE_PIN K16  IOSTANDARD LVDS_25 } [get_ports  FX3_DQ31]; 
                                                      
set_property  -dict {PACKAGE_PIN L19  IOSTANDARD LVDS_25 } [get_ports  FX3_CTL0]; 
set_property  -dict {PACKAGE_PIN J20  IOSTANDARD LVDS_25 } [get_ports  FX3_CTL1]; 
set_property  -dict {PACKAGE_PIN K19  IOSTANDARD LVDS_25 } [get_ports  FX3_CTL2]; 
set_property  -dict {PACKAGE_PIN G17  IOSTANDARD LVDS_25 } [get_ports  FX3_CTL3]; 
set_property  -dict {PACKAGE_PIN G14  IOSTANDARD LVDS_25 } [get_ports  FX3_CTL4]; 
set_property  -dict {PACKAGE_PIN H16  IOSTANDARD LVDS_25 } [get_ports  FX3_CTL5]; 
set_property  -dict {PACKAGE_PIN F17  IOSTANDARD LVDS_25 } [get_ports  FX3_CTL7]; 
set_property  -dict {PACKAGE_PIN G15  IOSTANDARD LVDS_25 } [get_ports  FX3_CTL9]; 
set_property  -dict {PACKAGE_PIN G20  IOSTANDARD LVDS_25 } [get_ports  FX3_CTL11]; 
set_property  -dict {PACKAGE_PIN B20  IOSTANDARD LVDS_25 } [get_ports  FX3_CTL12];  

set_property  -dict {PACKAGE_PIN V5   IOSTANDARD LVCMOS25 } [get_ports  PLIO_0 ];
set_property  -dict {PACKAGE_PIN Y6   IOSTANDARD LVCMOS25 } [get_ports  PLIO_1 ];
set_property  -dict {PACKAGE_PIN V7   IOSTANDARD LVCMOS25 } [get_ports  PLIO_2 ];
set_property  -dict {PACKAGE_PIN Y7   IOSTANDARD LVCMOS25 } [get_ports  PLIO_3 ];
set_property  -dict {PACKAGE_PIN V8   IOSTANDARD LVCMOS25 } [get_ports  PLIO_4 ];
set_property  -dict {PACKAGE_PIN Y8   IOSTANDARD LVCMOS25 } [get_ports  PLIO_5 ];
set_property  -dict {PACKAGE_PIN W8   IOSTANDARD LVCMOS25 } [get_ports  PLIO_6 ];
set_property  -dict {PACKAGE_PIN Y9   IOSTANDARD LVCMOS25 } [get_ports  PLIO_7 ];
set_property  -dict {PACKAGE_PIN W9   IOSTANDARD LVCMOS25 } [get_ports  PLIO_8 ];
set_property  -dict {PACKAGE_PIN W10  IOSTANDARD LVCMOS25 } [get_ports  PLIO_9 ];
set_property  -dict {PACKAGE_PIN Y11  IOSTANDARD LVCMOS25 } [get_ports  PLIO_10];
set_property  -dict {PACKAGE_PIN W11  IOSTANDARD LVCMOS25 } [get_ports  PLIO_11];
set_property  -dict {PACKAGE_PIN Y12  IOSTANDARD LVCMOS25 } [get_ports  PLIO_12];
set_property  -dict {PACKAGE_PIN U8   IOSTANDARD LVCMOS25 } [get_ports  PLIO_13];
set_property  -dict {PACKAGE_PIN U10  IOSTANDARD LVCMOS25 } [get_ports  PLIO_14];
set_property  -dict {PACKAGE_PIN T9   IOSTANDARD LVCMOS25 } [get_ports  PLIO_15];
 
set_property  -dict {PACKAGE_PIN U7    IOSTANDARD LVCMOS25 } [get_ports  GPS_TXD_R];
set_property  -dict {PACKAGE_PIN U9    IOSTANDARD LVCMOS25 } [get_ports  GPS_RXD_R];
set_property  -dict {PACKAGE_PIN T5    IOSTANDARD LVCMOS25 } [get_ports  GPS_1PPS_RAW];
set_property  -dict {PACKAGE_PIN U5    IOSTANDARD LVCMOS25 } [get_ports  DAC_nSYNC_40M];
set_property  -dict {PACKAGE_PIN Y13   IOSTANDARD LVCMOS25 } [get_ports  VC_SEL_40M];
set_property  -dict {PACKAGE_PIN V11   IOSTANDARD LVCMOS25 } [get_ports  PLL_LCKED];
set_property  -dict {PACKAGE_PIN V10   IOSTANDARD LVCMOS25 } [get_ports  PLL_SCK];
set_property  -dict {PACKAGE_PIN V6    IOSTANDARD LVCMOS25 } [get_ports  PLL_DIN];
set_property  -dict {PACKAGE_PIN W6    IOSTANDARD LVCMOS25 } [get_ports  PLL_CSN];

set_property  -dict {PACKAGE_PIN T11    IOSTANDARD LVCMOS25 } [get_ports  FPGA_CFG_DONE];
set_property  -dict {PACKAGE_PIN T10    IOSTANDARD LVCMOS25 } [get_ports  FPGA_CFG_PROGn];

set_property  -dict {PACKAGE_PIN U13    IOSTANDARD LVCMOS25 } [get_ports  FPGA_CFG_SCLK];
set_property  -dict {PACKAGE_PIN V13    IOSTANDARD LVCMOS25 } [get_ports  FPGA_CFG_INTn];

set_property  -dict {PACKAGE_PIN T20    IOSTANDARD LVCMOS25 } [get_ports  TRIG];
set_property  -dict {PACKAGE_PIN T19    IOSTANDARD LVCMOS25 } [get_ports  REF_CHK];










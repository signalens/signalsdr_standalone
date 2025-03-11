
`timescale 1ns/100ps


module system_top (
  inout   [14:0]  ddr_addr,
  inout   [ 2:0]  ddr_ba,
  inout           ddr_cas_n,
  inout           ddr_ck_n,
  inout           ddr_ck_p,
  inout           ddr_cke,
  inout           ddr_cs_n,
  inout   [ 3:0]  ddr_dm,
  inout   [31:0]  ddr_dq,
  inout   [ 3:0]  ddr_dqs_n,
  inout   [ 3:0]  ddr_dqs_p,
  inout           ddr_odt,
  inout           ddr_ras_n,
  inout           ddr_reset_n,
  inout           ddr_we_n,

  inout           fixed_io_ddr_vrn,
  inout           fixed_io_ddr_vrp,
  inout   [53:0]  fixed_io_mio,
  inout           fixed_io_ps_clk,
  inout           fixed_io_ps_porb,
  inout           fixed_io_ps_srstb,

  inout             iic_scl ,
  inout            iic_sda   ,

  input           rx_clk_in_p,
  input           rx_clk_in_n,
  input           rx_frame_in_p,
  input           rx_frame_in_n,
  input   [ 5:0]  rx_data_in_p,
  input   [ 5:0]  rx_data_in_n,
  output          tx_clk_out_p,
  output          tx_clk_out_n,
  output          tx_frame_out_p,
  output          tx_frame_out_n,
  output  [ 5:0]  tx_data_out_p,
  output  [ 5:0]  tx_data_out_n,

  inout           gpio_resetb,
  inout           gpio_sync,

  output          spi_csn,
  output          spi_clk,
  output          spi_mosi,
  input           spi_miso,
  
  //ADRPI ADD PORT
  input scl,
  input sda,
  
  input  pps_in    ,
input  clk_40m   ,  
input  dac_nsyc  ,
input  dac_din   ,
input  dac_clk   , 
input  sel_clk_src ,  
input  phy_tx_en,  
input  phy_tx_err,
input  phy_reset_n,

input [7:0]  phy_tx_dout, 
input [7:0]  phy_rx_din ,

input  phy_tx_clk, 
input  phy_rx_err,
input  phy_rx_clk,  

input  phy_rx_dv, 
input  phy_gtx_clk,
  
  input  USB_UART_PC2PL,
  output USB_UART_PL2PC,
  
  output PL_LED,
  output gps_pl_led,
  output TX2_AMP_EN,
  output TX1_AMP_EN, 
  output RX1_LED,
  output RX2_LED   
  );   
 
    assign USB_UART_PL2PC = USB_UART_PC2PL;
    assign  TX2_AMP_EN = 1;
    assign  TX1_AMP_EN = 1; 
    assign  RX1_LED = 1;
    assign  RX2_LED = 1;  
    assign  PL_LED = 1;  
    assign  gps_pl_led = 1;  
  

  // internal signals
  wire    [63:0]  gpio_i;
  wire    [63:0]  gpio_o;
  wire    [63:0]  gpio_t;
  
 
  assign gpio_i[44:0] = gpio_o[44:0]; 
  ad_iobuf #(.DATA_WIDTH(2)) i_iobuf (
    .dio_t ( gpio_t[46:45]),
    .dio_i ( gpio_o[46:45]),
    .dio_o ( gpio_i[46:45]),
    .dio_p ({ gpio_resetb,        // 46:46
              gpio_sync   }));     // 45:45
  assign gpio_i[63:47] = gpio_o[63:47]; 
  // instantiations

  system_wrapper i_system_wrapper (
    .ddr_addr (ddr_addr),
    .ddr_ba (ddr_ba),
    .ddr_cas_n (ddr_cas_n),
    .ddr_ck_n (ddr_ck_n),
    .ddr_ck_p (ddr_ck_p),
    .ddr_cke (ddr_cke),
    .ddr_cs_n (ddr_cs_n),
    .ddr_dm (ddr_dm),
    .ddr_dq (ddr_dq),
    .ddr_dqs_n (ddr_dqs_n),
    .ddr_dqs_p (ddr_dqs_p),
    .ddr_odt (ddr_odt),
    .ddr_ras_n (ddr_ras_n),
    .ddr_reset_n (ddr_reset_n),
    .ddr_we_n (ddr_we_n),
    .enable ( ),
    .fixed_io_ddr_vrn (fixed_io_ddr_vrn),
    .fixed_io_ddr_vrp (fixed_io_ddr_vrp),
    .fixed_io_mio (fixed_io_mio),
    .fixed_io_ps_clk (fixed_io_ps_clk),
    .fixed_io_ps_porb (fixed_io_ps_porb),
    .fixed_io_ps_srstb (fixed_io_ps_srstb),
    
    .gp_in_0 ( 0 ),
    .gp_in_1 ( 0 ),
    .gp_in_2 ( 0 ),
    .gp_in_3 ( 0 ),
    .gp_out_0 (  ),
    .gp_out_1 (  ),
    .gp_out_2 (  ),
    .gp_out_3 (  ),
    
    .gpio_i ( gpio_i ),
    .gpio_o ( gpio_o ),
    .gpio_t ( gpio_t ),
    
    .gps_pps (1'b0),
    
    .iic_main_scl_io (iic_scl),
    .iic_main_sda_io (iic_sda),
    .otg_vbusoc (1'b0),
    .rx_clk_in_n (rx_clk_in_n),
    .rx_clk_in_p (rx_clk_in_p),
    .rx_data_in_n (rx_data_in_n),
    .rx_data_in_p (rx_data_in_p),
    .rx_frame_in_n (rx_frame_in_n),
    .rx_frame_in_p (rx_frame_in_p),
    .spi0_clk_i (1'b0),
    .spi0_clk_o (spi_clk),
    .spi0_csn_0_o (spi_csn),
    .spi0_csn_1_o (),
    .spi0_csn_2_o (),
    .spi0_csn_i (1'b1),
    .spi0_sdi_i (spi_miso),
    .spi0_sdo_i (1'b0),
    .spi0_sdo_o (spi_mosi),
    .spi1_clk_i (1'b0),
    .spi1_clk_o (),
    .spi1_csn_0_o (),
    .spi1_csn_1_o (),
    .spi1_csn_2_o (),
    .spi1_csn_i (1'b1),
    .spi1_sdi_i (1'b0),
    .spi1_sdo_i (1'b0),
    .spi1_sdo_o (),
    .tdd_sync_i (1'b0),
    .tdd_sync_o (),
    .tdd_sync_t (),
    .tx_clk_out_n (tx_clk_out_n),
    .tx_clk_out_p (tx_clk_out_p),
    .tx_data_out_n (tx_data_out_n),
    .tx_data_out_p (tx_data_out_p),
    .tx_frame_out_n (tx_frame_out_n),
    .tx_frame_out_p (tx_frame_out_p),
    .txnrx ( ),
    .up_enable (gpio_o[47]),
    .up_txnrx (gpio_o[48])
    );
    

endmodule

// ***************************************************************************
// ***************************************************************************

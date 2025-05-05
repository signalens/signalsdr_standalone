# SignalSDRPro Standalone Build Guide  

## Build Instructions  

### Prerequisites  
- **Vivado 2023.2**  
- **Vitis 2023.2**  

**Setup**
```
sudo apt-get install git build-essential fakeroot libncurses5-dev libssl-dev ccache
sudo apt-get install dfu-util u-boot-tools device-tree-compiler libssl1.0-dev mtools
sudo apt-get install bc python3 cpio zip unzip rsync file wget gcc-arm-linux-gnueabihf
sudo apt-get install libncurses5 device-tree-compiler u-boot-tools xvfb
```

**Clone**
   - Git clone
   ``` 
   git clone https://github.com/signalens/signalsdr_standalone.git
   ```

**Update all modules**
   - Update all github modules
   ``` 
   cd signalsdr_standalone/
   git submodule update --init --recursive
   ```

**ENV**
   ```
   export CROSS_COMPILE=arm-linux-gnueabihf-
   export PATH=$PATH:/tools/Xilinx/Vitis/2023.2/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin
   export VIVADO_SETTINGS=/tools/Xilinx/Vivado/2023.2/settings64.sh
   export PERL_MM_OPT=
   ```

**Preparing hdl**  
   - Compile Enviroment
      ```
      source /tools/Xilinx/Vivado/2023.2/settings64.sh
      ```
     
   - Load the ADI build script:  
     ```bash
     cd hdl/library
     vivado -mode batch -source ../projects/scripts/adi_make.tcl -tclargs build_lib all
     cd util_pack/util_upack2 && make clean && make && cd -
     cd util_pack/util_cpack2 && make clean && make && cd -
     cd axi_dmac && make clean && make && cd -
     cd axi_ad9361 && make clean && make && cd -
     cd axi_sysid && make clean && make && cd -
     cd sysid_rom && make clean && make && cd -
     cd util_tdd_sync && make clean && make && cd -
     cd xilinx/util_clkdiv && make clean && make && cd -
     cd util_rfifo && make clean && make && cd -
     cd util_wfifo && make clean && make && cd -
     cd axi_gpreg && make clean && make && cd -
     ```  
   
   - Generate the Vivado project:  
     ```bash
     cd ../projects/signalsdrpro
     rm -rf signalsdrpro.cache signalsdrpro.gen signalsdrpro.hw signalsdrpro.ip_user_files signalsdrpro.runs signalsdrpro.srcs vivado*
     vivado -mode batch -source system_project.tcl
     vivado -mode batch -source export_hardware.tcl
     ```  

**Building BOOT.bin**  
   ```
   cd projects/signalsdrpro
   bash ./build_boot.sh
   ```
**Copy Boot Files**  
   - copy BOOT.BIN to SD card and boot

**Test Boot**
```
cf-ad9361-lpc: Successfully initialized (122882080 Hz)
ad9361_init : AD936x Rev 2 successfully initialized
cf-ad9361-dds-core-lpc: Successfully initialized (122882080 Hz)
Available commands:
help?  - Displays all available commands.
register?  - Gets the specified register value.
tx_lo_freq?  - Gets current TX LO frequency [MHz].
tx_lo_freq=  - Sets the TX LO frequency [MHz].
tx_samp_freq?  - Gets current TX sampling frequency [Hz].
tx_samp_freq=  - Sets the TX sampling frequency [Hz].
tx_rf_bandwidth?  - Gets current TX RF bandwidth [Hz].
tx_rf_bandwidth=  - Sets the TX RF bandwidth [Hz].
tx1_attenuation?  - Gets current TX1 attenuation [mdB].
tx1_attenuation=  - Sets the TX1 attenuation [mdB].
tx2_attenuation?  - Gets current TX2 attenuation [mdB].
tx2_attenuation=  - Sets the TX2 attenuation [mdB].
tx_fir_en?  - Gets current TX FIR state.
tx_fir_en=  - Sets the TX FIR state.
rx_lo_freq?  - Gets current RX LO frequency [MHz].
rx_lo_freq=  - Sets the RX LO frequency [MHz].
rx_samp_freq?  - Gets current RX sampling frequency [Hz].
rx_samp_freq=  - Sets the RX sampling frequency [Hz].
rx_rf_bandwidth?  - Gets current RX RF bandwidth [Hz].
rx_rf_bandwidth=  - Sets the RX RF bandwidth [Hz].
rx1_gc_mode?  - Gets current RX1 GC mode.
rx1_gc_mode=  - Sets the RX1 GC mode.
rx2_gc_mode?  - Gets current RX2 GC mode.
rx2_gc_mode=  - Sets the RX2 GC mode.
rx1_rf_gain?  - Gets current RX1 RF gain.
rx1_rf_gain=  - Sets the RX1 RF gain.
rx2_rf_gain?  - Gets current RX2 RF gain.
rx2_rf_gain=  - Sets the RX2 RF gain.
rx_fir_en?  - Gets current RX FIR state.
rx_fir_en=  - Sets the RX FIR state.
dds_tx1_tone1_freq?  - Gets current DDS TX1 Tone 1 frequency [Hz].
dds_tx1_tone1_freq=  - Sets the DDS TX1 Tone 1 frequency [Hz].
dds_tx1_tone2_freq?  - Gets current DDS TX1 Tone 2 frequency [Hz].
dds_tx1_tone2_freq=  - Sets the DDS TX1 Tone 2 frequency [Hz].
dds_tx1_tone1_phase?  - Gets current DDS TX1 Tone 1 phase [degrees].
dds_tx1_tone1_phase=  - Sets the DDS TX1 Tone 1 phase [degrees].
dds_tx1_tone2_phase?  - Gets current DDS TX1 Tone 2 phase [degrees].
dds_tx1_tone2_phase=  - Sets the DDS TX1 Tone 2 phase [degrees].
dds_tx1_tone1_scale?  - Gets current DDS TX1 Tone 1 scale.
dds_tx1_tone1_scale=  - Sets the DDS TX1 Tone 1 scale.
dds_tx1_tone2_scale?  - Gets current DDS TX1 Tone 2 scale.
dds_tx1_tone2_scale=  - Sets the DDS TX1 Tone 2 scale.
dds_tx2_tone1_freq?  - Gets current DDS TX2 Tone 1 frequency [Hz].
dds_tx2_tone1_freq=  - Sets the DDS TX2 Tone 1 frequency [Hz].
dds_tx2_tone2_freq?  - Gets current DDS TX2 Tone 2 frequency [Hz].
dds_tx2_tone2_freq=  - Sets the DDS TX2 Tone 2 frequency [Hz].
dds_tx2_tone1_phase?  - Gets current DDS TX2 Tone 1 phase [degrees].
dds_tx2_tone1_phase=  - Sets the DDS TX2 Tone 1 phase [degrees].
dds_tx2_tone2_phase?  - Gets current DDS TX2 Tone 2 phase [degrees].
dds_tx2_tone2_phase=  - Sets the DDS TX2 Tone 2 phase [degrees].
dds_tx2_tone1_scale?  - Gets current DDS TX2 Tone 1 scale.
dds_tx2_tone1_scale=  - Sets the DDS TX2 Tone 1 scale.
dds_tx2_tone2_scale?  - Gets current DDS TX2 Tone 2 scale.
dds_tx2_tone2_scale=  - Sets the DDS TX2 Tone 2 scale.
```

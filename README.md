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

**Run Build Scripts**  
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

**Vitis Project Setup**  
   ```
   cd projects/signalsdrpro
   bash ./build_boot.sh
   ```
**Generate Boot Files**  
   - copy BOOT.BIN to SD card and boot


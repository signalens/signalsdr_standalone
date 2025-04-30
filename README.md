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
   - Enter into hdl folder
      ```
      source /tools/Xilinx/Vivado/2023.2/settings64.sh
      ```
   - Cleaning project cache
      ```bash
      rm -rf hdl/projects/signalsdrpro/signalsdrpro.cache
      rm -rf hdl/projects/signalsdrpro/signalsdrpro.hw
      rm -rf hdl/projects/signalsdrpro/signalsdrpro.ip_user_files
      rm -rf hdl/projects/signalsdrpro/.Xil      
      ```
      
   - Load the ADI build script:  
     ```bash
     cd hdl/library
     vivado -mode batch -source ../projects/scripts/adi_make.tcl -tclargs lib all
     cd util_pack/util_upack2 && make clean && make && cd -
     cd util_pack/util_cpack2 && make clean && make && cd -
     cd axi_dmac && make clean && make && cd -
     cd axi_ad9361 && make clean && make && cd -
     cd axi_ad9361 && make clean && make && cd -
     ```  
   
   - Generate the Vivado project:  
     ```bash
     cd ../projects/signalsdrpro
     vivado -mode batch -source system_project.tcl
     ```  

**Vitis Project Setup**  
   - Create a **new empty workspace** in Vitis.  
   - Copy `app` into the project's `src` directory.  
   - Build the application in Vitis.  

**Generate Boot Files**  
   - Use Vivado/Vitis tools to generate the `BOOT` image for hardware deployment.  

---

## Project Modifications  

### Hardware Changes  
1. **Top-Level HDL**  
   - Updated pin assignments in the top-level design.  
2. **XDC Constraints**  
   - Adjusted pin mappings in the XDC file for hardware compatibility.  
3. **Tcl Scripts**  
   - Modified PS UART configuration and clock pin definitions in the block design (BD).  

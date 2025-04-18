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

**Open Vivado**  
   - Launch Vivado 2023.2 and open the Tcl Console (located at the bottom).  
      ```
      /tools/Xilinx/Vivado/2023.2/bin/vivado -mode tcl
      ```

**Run Build Scripts**  
   - Enter into hdl folder
      ```
      cd signalsdr_standalone/hdl/projects/signalsdrpro 
      ```

   - Load the ADI build script:  
     ```tcl
     source ../scripts/adi_make.tcl  
     ```  
   
   - Copy make file
      ```
      mkdir -p ~/library/axi_ad9361
      cp -r * ~/library/axi_ad9361
      ```

   - Compile libraries:  
     ```tcl  
     adi_make::lib all  
     ```  

   - Generate the Vivado project:  
     ```tcl  
     source ./system_project.tcl  
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

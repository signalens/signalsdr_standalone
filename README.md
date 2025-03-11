# SignalSDRPro Standalone Build Guide  

## Build Instructions  

### Prerequisites  
- **Vivado 2021.1**  
- **Vitis 2021.1**  

### Steps  
1. **Open Vivado**  
   - Launch Vivado 2021.1 and open the Tcl Console (located at the bottom).  
   - Navigate to the project directory:  
     ```tcl  
     cd signal_standalone/hdl/projects/signalsdrpro  
     ```  

2. **Run Build Scripts**  
   - Load the ADI build script:  
     ```tcl  
     source ../scripts/adi_make.tcl  
     ```  
   - Compile libraries:  
     ```tcl  
     adi_make::lib all  
     ```  
   - Generate the Vivado project:  
     ```tcl  
     source ./system_project.tcl  
     ```  

3. **Vitis Project Setup**  
   - Create a **new empty workspace** in Vitis.  
   - Copy `app` into the project's `src` directory.  
   - Build the application in Vitis.  

4. **Generate Boot Files**  
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

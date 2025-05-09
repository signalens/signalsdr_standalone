# SignalSDR Build System
# This Makefile handles building both SignalSDR Pro and Pi applications
# Still needs to be tested

# Configuration
VITIS_PATH ?= /tools/Xilinx/Vitis/2023.2
VIVADO_PATH ?= /tools/Xilinx/Vivado/2023.2
WORKSPACE_DIR ?= workspace
APP_NAME ?= signalsdr_app
BOOT_BIN ?= BOOT.BIN

# Target-specific configuration
TARGET ?= signalsdrpro
HDL_PROJ_DIR ?= hdl/projects/$(TARGET)
XSA_PATH ?= $(HDL_PROJ_DIR)/$(TARGET).sdk/system_top.xsa

# Validate target
ifeq ($(filter $(TARGET),signalsdrpro signalsdrpi),)
    $(error Invalid TARGET. Use 'signalsdrpro' or 'signalsdrpi')
endif

HDL_LIB_DIR ?= ../hdl/library

# Environment setup
export CROSS_COMPILE=arm-linux-gnueabihf-
export PATH=$(VITIS_PATH)/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin:$(PATH)
export VIVADO_SETTINGS=$(VIVADO_PATH)/settings64.sh
export PERL_MM_OPT=

# Default target
all: $(BOOT_BIN)

# Source Vitis environment
.PHONY: setup_env
setup_env:
	@echo "Setting up Vitis environment..."
	@source $(VITIS_PATH)/settings64.sh

# Clean targets
.PHONY: clean clean_hdl clean_hdl_proj
clean: clean_hdl clean_hdl_proj
	@echo "Cleaning workspace..."
	rm -rf $(WORKSPACE_DIR)
	rm -f $(BOOT_BIN)
	rm -f boot.bif

clean_hdl:
	@echo "Cleaning HDL libraries..."
	cd $(HDL_LIB_DIR)/util_pack/util_upack2 && make clean && cd ../../../../
	cd $(HDL_LIB_DIR)/util_pack/util_cpack2 && make clean && cd ../../../../
	cd $(HDL_LIB_DIR)/axi_dmac && make clean && cd ../../../../
	cd $(HDL_LIB_DIR)/axi_ad9361 && make clean && cd ../../../../
	cd $(HDL_LIB_DIR)/axi_sysid && make clean && cd ../../../../
	cd $(HDL_LIB_DIR)/sysid_rom && make clean && cd ../../../../
	cd $(HDL_LIB_DIR)/util_tdd_sync && make clean && cd ../../../../
	cd $(HDL_LIB_DIR)/xilinx/util_clkdiv && make clean && cd ../../../../
	cd $(HDL_LIB_DIR)/util_rfifo && make clean && cd ../../../../
	cd $(HDL_LIB_DIR)/util_wfifo && make clean && cd ../../../../
	cd $(HDL_LIB_DIR)/axi_gpreg && make clean && cd ../../../../

clean_hdl_proj:
	@echo "Cleaning HDL project..."
	cd $(HDL_PROJ_DIR) && rm -rf signalsdr$(TARGET).cache signalsdr$(TARGET).gen signalsdr$(TARGET).hw signalsdr$(TARGET).ip_user_files signalsdr$(TARGET).runs signalsdr$(TARGET).srcs vivado*

# Build HDL libraries
.PHONY: build_hdl
build_hdl: clean_hdl
	@echo "Building HDL libraries..."
	cd $(HDL_LIB_DIR) && vivado -mode batch -source ../projects/scripts/adi_make.tcl -tclargs build_lib all
	cd $(HDL_LIB_DIR)/util_pack/util_upack2 && make clean && make && cd ../../../../
	cd $(HDL_LIB_DIR)/util_pack/util_cpack2 && make clean && make && cd ../../../../
	cd $(HDL_LIB_DIR)/axi_dmac && make clean && make && cd ../../../../
	cd $(HDL_LIB_DIR)/axi_ad9361 && make clean && make && cd ../../../../
	cd $(HDL_LIB_DIR)/axi_sysid && make clean && make && cd ../../../../
	cd $(HDL_LIB_DIR)/sysid_rom && make clean && make && cd ../../../../
	cd $(HDL_LIB_DIR)/util_tdd_sync && make clean && make && cd ../../../../
	cd $(HDL_LIB_DIR)/xilinx/util_clkdiv && make clean && make && cd ../../../../
	cd $(HDL_LIB_DIR)/util_rfifo && make clean && make && cd ../../../../
	cd $(HDL_LIB_DIR)/util_wfifo && make clean && make && cd ../../../../
	cd $(HDL_LIB_DIR)/axi_gpreg && make clean && make && cd ../../../../

# Build HDL project
.PHONY: build_hdl_proj
build_hdl_proj: build_hdl clean_hdl_proj
	@echo "Building HDL project..."
	cd $(HDL_PROJ_DIR) && vivado -mode batch -source system_project.tcl
	cd $(HDL_PROJ_DIR) && vivado -mode batch -source export_hardware.tcl

# Create workspace directory
$(WORKSPACE_DIR):
	@echo "Creating workspace directory..."
	mkdir -p $(WORKSPACE_DIR)/$(APP_NAME)/src

# Copy source files
$(WORKSPACE_DIR)/$(APP_NAME)/src: $(WORKSPACE_DIR)
	@echo "Copying source files..."
	cp -r src/* $(WORKSPACE_DIR)/$(APP_NAME)/src

# Generate BSP and build application
$(WORKSPACE_DIR)/$(APP_NAME)/Release/$(APP_NAME).elf: $(WORKSPACE_DIR)/$(APP_NAME)/src build_hdl_proj
	@echo "Generating BSP and building application..."
	@xsct -nodisp << EOF
	setws $(WORKSPACE_DIR)
	set processors [getprocessors $(XSA_PATH)]
	if {[llength \$$processors] == 0} {
		puts "Error: No processors found in XSA file"
		exit 1
	}
	set proc [lindex \$$processors 0]
	puts "Using processor: \$$proc"
	platform create -name signalsdr_platform -hw $(XSA_PATH) -proc \$$proc -os standalone
	platform active signalsdr_platform
	app create -name $(APP_NAME) -platform signalsdr_platform -proc \$$proc -os standalone -lang C -template {Empty Application}
	app config -name $(APP_NAME) -add compiler-misc {-DUSE_AMP=1}
	app config -name $(APP_NAME) -set compiler-optimization {Optimize most (-O3)}
	app config -name $(APP_NAME) -set build-config {Release}
	app config -name $(APP_NAME) -add include-path {src}
	app config -name $(APP_NAME) -add include-path {src/include}
	app config -name $(APP_NAME) -add include-path {src/lib}
	importsources -name $(APP_NAME) -path $(WORKSPACE_DIR)/$(APP_NAME)/src
	set c_files [glob -nocomplain $(WORKSPACE_DIR)/$(APP_NAME)/src/*.c]
	foreach file \$$c_files {
		puts "Adding source file: \$$file"
		app config -name $(APP_NAME) -add sources {\$$file}
	}
	app build -name $(APP_NAME)
	EOF

# Create boot.bif file
boot.bif: $(WORKSPACE_DIR)/$(APP_NAME)/Release/$(APP_NAME).elf
	@echo "Creating boot.bif file..."
	@echo "//arch = zynq; split = false; format = BIN" > boot.bif
	@echo "the_ROM_image:" >> boot.bif
	@echo "{" >> boot.bif
	@echo "    [bootloader]$(WORKSPACE_DIR)/$(APP_NAME)/Release/$(APP_NAME).elf" >> boot.bif
	@echo "    [destination_device = pl]$(XSA_PATH)" >> boot.bif
	@echo "}" >> boot.bif

# Generate BOOT.BIN
$(BOOT_BIN): boot.bif
	@echo "Generating BOOT.BIN..."
	@bootgen -image boot.bif -arch zynq -o $(BOOT_BIN) -w

# Help target
.PHONY: help
help:
	@echo "SignalSDR Build System"
	@echo ""
	@echo "Available targets:"
	@echo "  all           - Build everything (default)"
	@echo "  clean         - Remove all build artifacts (includes clean_hdl and clean_hdl_proj)"
	@echo "  clean_hdl     - Clean HDL libraries"
	@echo "  clean_hdl_proj - Clean HDL project"
	@echo "  build_hdl     - Build HDL libraries"
	@echo "  build_hdl_proj - Build HDL project"
	@echo "  help          - Show this help message"
	@echo ""
	@echo "Configuration:"
	@echo "  TARGET        - Build target (signalsdrpro or signalsdrpi, default: signalsdrpro)"
	@echo "  VITIS_PATH    - Path to Vitis installation (default: /tools/Xilinx/Vitis/2023.2)"
	@echo "  VIVADO_PATH   - Path to Vivado installation (default: /tools/Xilinx/Vivado/2023.2)"
	@echo "  WORKSPACE_DIR - Build directory (default: workspace)"
	@echo "  APP_NAME      - Application name (default: signalsdr_app)"
	@echo "  BOOT_BIN      - Output boot file name (default: BOOT.BIN)"
	@echo "  HDL_LIB_DIR   - HDL library directory (default: ../hdl/library)"
	@echo "  HDL_PROJ_DIR  - HDL project directory (default: ../hdl/projects/signalsdrpro or signalsdrpi)"
	@echo ""
	@echo "Example usage:"
	@echo "  make TARGET=signalsdrpro    # Build SignalSDR Pro"
	@echo "  make TARGET=signalsdrpi     # Build SignalSDR Pi"
	@echo "  make clean                  # Clean all build artifacts (including HDL)"
	@echo "  make clean_hdl             # Clean only HDL libraries"
	@echo "  make clean_hdl_proj        # Clean only HDL project"

# Set default target
.DEFAULT_GOAL := help 

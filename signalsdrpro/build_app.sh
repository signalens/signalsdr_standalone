#!/bin/bash

# Source Vitis environment
source /tools/Xilinx/Vitis/2023.2/settings64.sh

# Set headless mode
export DISPLAY=:0

# Generate XSA file
cd ../hdl/projects/signalsdrpro
vivado -mode batch -source system_project.tcl
vivado -mode batch -source export_hardware.tcl
cd ../../../signalsdrpro

# Clean up and recreate workspace directory
echo "Cleaning up workspace..."
rm -rf workspace
mkdir -p workspace

# Create platform and application using xsct in batch mode
xsct -nodisp << EOF
puts "Setting workspace..."
setws workspace

puts "Checking available processors..."
set processors [getprocessors ../hdl/projects/signalsdrpro/signalsdrpro/system_top.xsa]
puts "Available processors: \$processors"

# Use the first available processor
set proc [lindex \$processors 0]
puts "Using processor: \$proc"

puts "Creating platform..."
platform create -name signalsdr_platform -hw ../hdl/projects/signalsdrpro/signalsdrpro/system_top.xsa -proc \$proc -os standalone
if {[catch {platform active signalsdr_platform} err]} {
    puts "Error activating platform: \$err"
    exit 1
}

# Create a unique domain name using timestamp
set timestamp [clock format [clock seconds] -format %Y%m%d_%H%M%S]
set domain_name "standalone_domain_\$timestamp"
puts "Creating domain with name: \$domain_name"

if {[catch {domain create -name \$domain_name -os standalone -proc \$proc} err]} {
    puts "Error creating domain: \$err"
    exit 1
}

puts "Activating domain..."
if {[catch {domain active \$domain_name} err]} {
    puts "Error activating domain: \$err"
    exit 1
}

puts "Generating platform..."
if {[catch {platform generate} err]} {
    puts "Error generating platform: \$err"
    exit 1
}

puts "Creating application..."
app create -name signalsdr_app -platform signalsdr_platform -domain \$domain_name -template "Empty Application"

puts "Setting build configuration..."
app config -name signalsdr_app build-config Release

puts "Setting compiler flags..."
app config -name signalsdr_app compiler-misc "-Wall -O2 -mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard"

puts "Setting linker flags..."
app config -name signalsdr_app linker-misc "-mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard -Wl,-build-id=none"

puts "Setting include paths..."
app config -name signalsdr_app include-path ../app
app config -name signalsdr_app include-path ../../no-OS/include

puts "Setting library paths..."
app config -name signalsdr_app library-search-path workspace/signalsdr_platform/export/signalsdr_platform/sw/signalsdr_platform/standalone_domain/bsp/ps7_cortexa9_0/lib

puts "Setting libraries..."
app config -name signalsdr_app libraries "xil gpio spips scugic scutimer scuwdt metal"

puts "Adding source files..."
set src_files [glob -directory ../app *.c]
foreach src \$src_files {
    puts "Adding source: \$src"
    app config -name signalsdr_app add-src \$src
}

puts "Building application..."
app build -name signalsdr_app

# Verify ELF file exists
set elf_file "workspace/signalsdr_app/Release/signalsdr_app.elf"
if {![file exists \$elf_file]} {
    puts "Error: ELF file not found at \$elf_file"
    puts "Contents of workspace/signalsdr_app/Release:"
    puts [glob -directory workspace/signalsdr_app/Release *]
    exit 1
}
EOF

# Generate BOOT.BIN
echo "Generating BOOT.BIN..."
bootgen -image boot.bif -arch zynq -o BOOT.BIN -w 

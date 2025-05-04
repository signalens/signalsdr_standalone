#!/bin/bash

# Exit on error
set -e

# Source Vitis environment
echo "Setting up Vitis environment..."
source /tools/Xilinx/Vitis/2023.2/settings64.sh

# Set headless mode
export DISPLAY=:0

# Clean up previous build
echo "Cleaning up previous build..."
rm -rf workspace
mkdir -p app workspace/signalsdr_app/src

# Copy app directory to workspace
echo "Copying app directory to workspace..."
cp -r app/* workspace/signalsdr_app/src

# Generate BSP using xsct
echo "Generating BSP and setting up workspace..."
xsct -nodisp << EOF
# Set workspace
setws workspace

# Get available processors
set processors [getprocessors ../hdl/projects/signalsdrpro/signalsdrpro.sdk/system_top.xsa]
if {[llength \$processors] == 0} {
    puts "Error: No processors found in XSA file"
    exit 1
}

# Use the first available processor
set proc [lindex \$processors 0]
puts "Using processor: \$proc"

# Create platform
platform create -name signalsdr_platform -hw ../hdl/projects/signalsdrpro/signalsdrpro.sdk/system_top.xsa -proc \$proc -os standalone
platform active signalsdr_platform

# Create application project
app create -name signalsdr_app -platform signalsdr_platform -proc \$proc -os standalone -lang C -template {Empty Application}

# Configure project settings
app config -name signalsdr_app -add compiler-misc {-DUSE_AMP=1}
app config -name signalsdr_app -set compiler-optimization {Optimize most (-O3)}
app config -name signalsdr_app -set build-config {Release}

# Add include paths
app config -name signalsdr_app -add include-path {src}
app config -name signalsdr_app -add include-path {src/include}
app config -name signalsdr_app -add include-path {src/lib}

# Import source files
importsources -name signalsdr_app -path workspace/signalsdr_app/src

# Add all source files to the project
set c_files [glob -nocomplain workspace/signalsdr_app/src/*.c]
foreach file \$c_files {
    puts "Adding source file: \$file"
    app config -name signalsdr_app -add sources {\$file}
}

# Build application
puts "Building application..."
app build -name signalsdr_app

# Verify project file exists
if {![file exists workspace/signalsdr_app/signalsdr_app.prj]} {
    puts "Error: Project file not created"
    exit 1
}

# Print build status
puts "Build completed successfully"
EOF

# Verify build was successful
if [ ! -d "workspace/signalsdr_app" ]; then
    echo "Error: Application directory not found"
    exit 1
fi

# Verify all required files for BOOT.BIN
echo "Verifying files for BOOT.BIN generation..."
if [ ! -f "workspace/signalsdr_app/Release/signalsdr_app.elf" ]; then
    echo "Error: ELF file not found in Release directory"
    exit 1
fi

if [ ! -f "../hdl/projects/signalsdrpro/signalsdrpro.sdk/system_top.xsa" ]; then
    echo "Error: XSA file not found"
    exit 1
fi

# Generate BOOT.BIN
echo "Generating BOOT.BIN..."
bootgen -image boot.bif -arch zynq -o BOOT.BIN -w

# Verify BOOT.BIN was created
if [ ! -f "BOOT.BIN" ]; then
    echo "Error: BOOT.BIN generation failed"
    exit 1
fi

echo "Build completed successfully!"
echo "BOOT.BIN is available in the current directory"

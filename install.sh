#!/bin/bash
SCRIPT_DIR="$(realpath $( dirname -- "$0"; ))"
cd $SCRIPT_DIR

# Download openvaf
wget https://openva.fra1.cdn.digitaloceanspaces.com/openvaf_23_2_0_linux_amd64.tar.xz
tar xf openvaf_23_2_0_linux_amd64.tar.xz

# Download and patch model
git clone https://github.com/google/skywater-pdk-libs-sky130_fd_pr_reram sky130_fd_pr_reram
cp sky130_fd_pr_reram/cells/reram_cell/sky130_fd_pr_reram__reram_cell.va ngspice/sky130_fd_pr_reram__reram_module.va
patch "ngspice/sky130_fd_pr_reram__reram_module.va" < "ngspice/va_model_patch"

# Compile model
./openvaf ngspice/sky130_fd_pr_reram__reram_module.va

# Clean
rm -rf sky130_fd_pr_reram
rm openvaf_23_2_0_linux_amd64.tar.xz
rm openvaf

# Update spice netlist according to env
sed -i "s|/foss/pdks|$PDK_ROOT|g" ngspice/sky130_fd_pr_reram__reram_cell.spice
sed -i "s|/foss/pdks|$PDK_ROOT|g" ngspice/reram_example.spice

# Copy model, spice file and example netlist
sudo mkdir -p ${PDK_ROOT}/sky130B/libs.tech/ngspice
sudo cp "ngspice"/*.va ${PDK_ROOT}/sky130B/libs.tech/ngspice
sudo cp "ngspice"/*.spice ${PDK_ROOT}/sky130B/libs.tech/ngspice
sudo cp "ngspice"/*.osdi ${PDK_ROOT}/sky130B/libs.tech/ngspice
sudo cp -r "$SCRIPT_DIR/xschem" ${PDK_ROOT}/sky130B/libs.tech
v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 510 -400 830 -190 {flags=graph
y1=-600.0e-6
y2=1.5e-3
ypos1=-400.0e-6
ypos2=600.0e-6

subdivy=1
unity=m
x1=-2
x2=2
divx=8
subdivx=1
node="\\"I(R0); 0 i(v1) -\\""
sweep=te
color=4
dataset=-1
unitx=1
logy=0
divy=10}
N 190 -310 190 -280 {
lab=TE}
N 190 -310 410 -310 {
lab=TE}
N 410 -310 410 -280 {
lab=TE}
N 190 -220 190 -190 {
lab=0}
N 190 -190 410 -190 {
lab=0}
N 410 -220 410 -200 {
lab=0}
N 190 -190 190 -180 {
lab=0}
N 410 -200 410 -190 {
lab=0}
C {devices/vsource.sym} 190 -250 0 0 {name=V1 value="PWL (0 0 
+ 0.25u 1.8
+ 0.5u 0
+ 0.75u -1.8
+ 1.0u 0.0)"}
C {devices/code_shown.sym} 190 -90 0 0 {name=SIMULATE
only_toplevel=false 
value=".tran 0.1n 1.5u"}
C {devices/gnd.sym} 190 -180 0 0 {name=l2 lab=0}
C {devices/lab_wire.sym} 300 -310 0 0 {name=l1 sig_type=std_logic lab=TE}
C {sky130_fd_pr/reram_cell.sym} 410 -250 0 0 {name=R0
model=reram_cell
Tfilament_0=3.8e-9
spiceprefix=X
}
C {devices/launcher.sym} 520 -420 0 0 {name=h1
descr="Load I-V" 
tclcommand="
set rawfile [file tail [file rootname [xschem get schname]]]
xschem raw_read $netlist_dir/$\{rawfile\}.raw
unset rawfile
"}
C {devices/code.sym} 180 -480 0 0 {name=MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.inc $::SKYWATER_MODELS/sky130_fd_pr_reram__reram_cell.spice
"
spice_ignore=false}
C {devices/code.sym} 320 -480 0 0 {name=NGSPICE
only_toplevel=true
value=".control
save all
run
write reram_example_ngspice.raw
.endc

" }

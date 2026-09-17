v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 70 40 80 50 {
lab=#net1}
N 80 50 100 50 {
lab=#net1}
N 100 50 150 40 {
lab=#net1}
N 110 -170 150 -80 {
lab=OUTN}
N 70 -80 110 -170 {
lab=OUTN}
N 190 10 310 -10 {
lab=INN}
N -90 -10 -80 -10 {
lab=INP}
N -110 -10 -90 -10 {
lab=INP}
N -80 -10 30 10 {
lab=INP}
C {sky130_fd_pr/nfet_01v8.sym} 50 10 0 0 {name=M1
W=4
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 170 10 0 1 {name=M2
W=4
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/res.sym} 70 -50 0 0 {name=R1
value=100

footprint=1206
device=resistor
m=1}
C {devices/res.sym} 150 -50 0 0 {name=R2
value=100
footprint=1206
device=resistor
m=1}
C {devices/isource.sym} 100 80 0 0 {name=I0 value=1m}
C {devices/gnd.sym} 100 110 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 110 -140 0 1 {name=V1 value=1.8 savecurrent=false}
C {devices/gnd.sym} 70 10 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 150 10 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 110 -110 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} 310 20 0 0 {name=V2 value="PULSE(1.4 1.0 0 20p 20p 480p 1n)" savecurrent=false}
C {devices/vsource.sym} -110 20 0 0 {name=V3 value="PULSE(1.0 1.4 0 20p 20p 480p 1n)" savecurrent=false}
C {devices/gnd.sym} -110 50 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} 310 50 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} -110 -10 0 0 {lab=INP}
C {devices/lab_pin.sym} 310 -10 0 1 {lab=INN}
C {devices/lab_pin.sym} 150 -20 0 1 {lab=OUTN
}
C {devices/lab_pin.sym} 70 -20 0 0 {lab=OUTP
}

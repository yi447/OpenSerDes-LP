v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -130 -130 -90 -170 {
lab=VDD}
N -170 -130 -170 -70 {
lab=VAMP}
N 140 -180 200 -180 {
lab=VDD}
N 200 -180 200 -160 {
lab=VDD}
N 90 -180 140 -180 {
lab=VDD}
N 90 -180 90 -160 {
lab=VDD}
N 140 30 200 20 {
lab=#net1}
N 90 20 140 30 {
lab=#net1}
N 90 -100 90 -40 {
lab=N1}
N 200 -100 200 -40 {
lab=VAMP}
N 50 -130 90 -70 {
lab=N1}
N 90 -70 160 -130 {
lab=N1}
N 90 -130 110 -130 {
lab=VDD}
N 200 -130 210 -140 {
lab=VDD}
N 210 -140 220 -140 {
lab=VDD}
N 90 -10 100 -20 {
lab=GND}
N 200 -10 220 -10 {
lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 70 -10 0 0 {name=M1
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
C {sky130_fd_pr/nfet_01v8.sym} 180 -10 0 0 {name=M2
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
C {sky130_fd_pr/pfet_01v8.sym} 70 -130 0 0 {name=M3
W=8
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 180 -130 0 0 {name=M4
W=8
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -150 -70 0 0 {name=M6
W=2
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
C {sky130_fd_pr/pfet_01v8.sym} -150 -130 0 0 {name=M5
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
model=pfet_01v8
spiceprefix=X
}
C {devices/vdd.sym} -130 -160 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} -130 -40 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} -90 -170 0 0 {name=l3 lab=VDD}
C {devices/lab_pin.sym} -130 -100 0 0 {name=p1 sig_type=std_logic lab=RXOUT}
C {devices/lab_pin.sym} -170 -80 0 0 {name=p2 sig_type=std_logic lab=VAMP}
C {devices/vdd.sym} 140 -180 0 0 {name=l4 lab=VDD}
C {devices/gnd.sym} 140 90 0 0 {name=l5 lab=GND}
C {devices/isource.sym} 140 60 0 0 {name=I0 value=200u}
C {devices/lab_pin.sym} 90 -70 0 0 {name=p3 sig_type=std_logic lab=N1}
C {devices/lab_pin.sym} 200 -70 0 1 {name=p4 sig_type=std_logic lab=VAMP}
C {devices/vdd.sym} 110 -130 0 0 {name=l6 lab=VDD}
C {devices/vdd.sym} 220 -140 0 0 {name=l7 lab=VDD}
C {devices/gnd.sym} 100 -20 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 220 -10 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 50 -10 0 0 {name=p6 sig_type=std_logic lab=INP
}
C {devices/lab_pin.sym} 160 -10 0 0 {name=p5 sig_type=std_logic lab=INN
}

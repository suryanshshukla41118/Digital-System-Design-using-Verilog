module cmos_inverter (out, in);

input in;
output out;

supply1 Vdd;
supply0 Gnd;

pmos p1 (out, Vdd, in);   // PMOS: drain, source, gate
nmos n1 (out, Gnd, in);   // NMOS: drain, source, gate

endmodule

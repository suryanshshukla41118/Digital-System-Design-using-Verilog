`timescale 1ns/1ps

module tb_inverter;

reg in;
wire out;

cmos_inverter uut (.out(out), .in(in));

initial
begin
    in = 0;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;

    #20 $finish;
end

endmodule

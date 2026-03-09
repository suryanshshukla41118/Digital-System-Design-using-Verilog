// Full Adder Module
module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

// 4-bit Ripple Carry Adder
module ripple_carry_adder_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);
    wire c1, c2, c3;  // Intermediate carry wires

    full_adder FA0 (.a(A[0]), .b(B[0]), .cin(Cin),  .sum(Sum[0]), .cout(c1));
    full_adder FA1 (.a(A[1]), .b(B[1]), .cin(c1),   .sum(Sum[1]), .cout(c2));
    full_adder FA2 (.a(A[2]), .b(B[2]), .cin(c2),   .sum(Sum[2]), .cout(c3));
    full_adder FA3 (.a(A[3]), .b(B[3]), .cin(c3),   .sum(Sum[3]), .cout(Cout));

endmodule

// Testbench
module tb_ripple_carry_adder;
    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] Sum;
    wire       Cout;

    ripple_carry_adder_4bit uut (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout)
    );

    initial begin
        $display("A    B    Cin | Sum  Cout");
        $display("-----|-----|----|----|----");

        // Test cases
        A=4'b0001; B=4'b0001; Cin=0; #10;
        $display("%b  %b   %b   | %b  %b", A, B, Cin, Sum, Cout);

        A=4'b0111; B=4'b0001; Cin=0; #10;
        $display("%b  %b   %b   | %b  %b", A, B, Cin, Sum, Cout);

        A=4'b1111; B=4'b0001; Cin=0; #10;
        $display("%b  %b   %b   | %b  %b", A, B, Cin, Sum, Cout);

        A=4'b1010; B=4'b0101; Cin=1; #10;
        $display("%b  %b   %b   | %b  %b", A, B, Cin, Sum, Cout);

        A=4'b1111; B=4'b1111; Cin=1; #10;
        $display("%b  %b   %b   | %b  %b", A, B, Cin, Sum, Cout);

        $finish;
    end
endmodule

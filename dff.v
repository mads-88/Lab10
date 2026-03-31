module dff(
    input D,
    input clk,
    output reg Q,
    output Qnot
);

    initial begin
        Q <= 0;
    end

    always @(posedge clk) begin
        Q <= D;
    end

    assign Qnot = ~Q;

endmodule

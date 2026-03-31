module tff(
    input T,
    input clk,
    output wire Q,
    output wire Qnot
);

    wire D;
    wire current_q;
    wire current_qnot;

    assign D = (T & current_qnot) | (~T & current_q);

    dff dff_tff(
        .D(D),
        .clk(clk),
        .Q(current_q),
        .Qnot(current_qnot)
    );

    assign Q = current_q;
    assign Qnot = current_qnot;

endmodule

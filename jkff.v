module jkff(
    input J,
    input K,
    input clk,
    output wire Q,
    output wire Qnot
);

    wire D;
    wire current_q;
    wire current_qnot;

    assign D = (J & current_qnot) | (~K & current_q);

    d_flip_flop dff_jk(
        .D(D),
        .clk(clk),
        .Q(current_q),
        .Qnot(current_qnot)
    );

    assign Q = current_q;
    assign Qnot = current_qnot;

endmodule

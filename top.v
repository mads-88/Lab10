module d_flip_flop(
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


module jk_flip_flop(
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


module t_flip_flop(
    input T,
    input clk,
    output wire Q,
    output wire Qnot
);

    wire D;
    wire current_q;
    wire current_qnot;

    assign D = (T & current_qnot) | (~T & current_q);

    d_flip_flop dff_t(
        .D(D),
        .clk(clk),
        .Q(current_q),
        .Qnot(current_qnot)
    );

    assign Q = current_q;
    assign Qnot = current_qnot;

endmodule


module top(
    input [3:0] sw,
    input btnC,
    output [5:0] led
);

    d_flip_flop dff(
        .D(sw[0]),
        .clk(btnC),
        .Q(led[0]),
        .Qnot(led[1])
    );

    jk_flip_flop jkff(
        .J(sw[1]),
        .K(sw[2]),
        .clk(btnC),
        .Q(led[2]),
        .Qnot(led[3])
    );

    t_flip_flop tff(
        .T(sw[3]),
        .clk(btnC),
        .Q(led[4]),
        .Qnot(led[5])
    );

endmodule

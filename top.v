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

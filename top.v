module top(
    input [3:0] sw,
    input btnC,
    output [5:0] led
);

    dff(
        .D(sw[0]),
        .clk(btnC),
        .Q(led[0]),
        .Qnot(led[1])
    );

    jkff(
        .J(sw[1]),
        .K(sw[2]),
        .clk(btnC),
        .Q(led[2]),
        .Qnot(led[3])
    );

    tff(
        .T(sw[3]),
        .clk(btnC),
        .Q(led[4]),
        .Qnot(led[5])
    );

endmodule

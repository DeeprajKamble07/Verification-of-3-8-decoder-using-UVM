module decoder(input [2:0] a ,output reg [7:0] y);
  always@(*)
    begin
      case(a)
        0:y=8'd1;
        1:y=8'd2;
        2:y=8'd4;
        3:y=8'd8;
        4:y=8'd16;
        5:y=8'd32;
        6:y=8'd64;
        7:y=8'd128;
        default: y=8'd0;
      endcase
    end
endmodule

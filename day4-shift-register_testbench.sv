module tb_shift_reg;
  reg clk, rst, sin;
  wire [7:0] q;

shift_register_8bit DUT(.clk(clk), .rst(rst), .sin(sin), .q(q));


initial clk=0; always #5 clk=~clk;

initial begin
    rst = 1; sin = 0;
    #20;
    rst = 0;


@(posedge clk);#1; sin=1;
@(posedge clk);#1; sin=0; 
@(posedge clk);#1; sin=1; 
@(posedge clk);#1; sin=1; 
@(posedge clk);#1; sin=0; 
@(posedge clk);#1; sin=1; 
@(posedge clk);#1; sin=0; 
@(posedge clk);#1; sin=1;

    #50;
    $finish;
end

initial begin
    $monitor("Time=%0t | sin=%b | q=%b", $time, sin, q);
end


endmodule

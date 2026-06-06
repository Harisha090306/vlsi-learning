module tbb_up_down;
reg clk, rst, up_down;
wire [3:0]count;

up_down_counter DUT(.clk(clk), .rst(rst), .up_down(up_down), .count(count));

initial clk =0;
always #5 clk=~clk;

initial begin 
  rst =1;
  #20;
  
  rst=0;
  up_down=1;
  repeat(6) @(posedge clk); #1;
  
  rst =0;
  up_down=0;
  repeat(6) @(posedge clk); #1;
  
  #20;
  $finish;
end

initial begin
  $monitor("%0T | %b | %b",$time, up_down, count);
end
endmodule

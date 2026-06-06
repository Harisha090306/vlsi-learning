module tbb_sequence_detector;
  reg clk, rst, din;
  wire detected;
  
  sequence_detector DET(.clk(clk), .rst(rst), .din(din), .detected(detected));
  
  initial clk=0;
  always #5 clk=~clk;
  
  initial begin
    rst = 1;#20;
    
    rst = 0; 
    @(posedge clk); #1; din = 0; 
    @(posedge clk); #1; din = 1; 
    @(posedge clk); #1; din = 0;
    @(posedge clk); #1; din = 1;
    @(posedge clk); #1; din = 1;
    @(posedge clk); #1; din = 0;
    @(posedge clk); #1; din = 1;
    @(posedge clk); #1; din = 1;
    @(posedge clk); #1; din = 0;
    @(posedge clk); #1; din = 1;
    @(posedge clk); #1; din = 1;
    #20;
    $finish;
  end
  
  initial begin
    $display("din  detected");
    $monitor("%b %b",din, detected);
  end
endmodule

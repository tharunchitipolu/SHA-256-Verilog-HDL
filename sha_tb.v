module sha_tb();
// change parameter if input length varies 
parameter N = 88;
parameter res = 256'hB94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9;
reg [N-1:0]data;
reg [63:0]m2b;
reg clk;
wire [255:0]final_op;


sha_main #(.N(N)) uut(.data(data),.m2b(m2b),.clk(clk), .final_op(final_op) );

always #5 clk = ~clk;   
  initial begin  
    clk <= 0; 
   end

// we consider  'Hello World' as sample input.
// converting to binary using ASCII

initial
begin
	#10 data = 88'b0110100001100101011011000110110001101111001000000111011101101111011100100110110001100100;
            	m2b = 64'd88; 
         
        #100//give required simulation time to complete the operation one by one.
	#100

	//-----VERIFICATION OF THE OBTAINED RESULT WITH EXISTING RESULT------
	

if (final_op != res)
begin

$display(" ERROR - data=%d,m2b=%d,final_op=%d",(data),(m2b),(final_op));

end



end

endmodule








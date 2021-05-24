//message schedule

module MS(input [511:0]data,[5:0]a,input clk, output [31:0]ms );

reg [31:0]w[0:63];


always @ (posedge clk)begin

 w[15]  = data[31:0];
 w[14]  = data[63:32];
 w[13]  = data[95:64];
 w[12]  = data[127:96];
 w[11]  = data[159:128];
 w[10]  = data[191:160];
 w[9] = data[223:192];
 w[8] = data[255:224];
 w[7] = data[287:256];
 w[6] = data[319:288];
 w[5] = data[351:320];
 w[4] = data[383:352];
 w[3] = data[415:384];
 w[2] = data[447:416];
 w[1] = data[479:448];
 w[0] = data[511:480];

end

// intial assign 0 from w[16] to w[63]
wire [31:0]k[0:47];
genvar i;
generate 
   for (i=0;i<48;i=i+1)begin
       always@(*) begin
            w[i]  = 32'b0;
  end
end
endgenerate




// s0 function
function [31:0]s0;
input [31:0]w;
     begin
	s0 = ({w[6:0], w[31:7]} ^ {w[17:0], w[31:18]} ^ (w >> 3));
     end
endfunction

//s1 function
function [31:0]s1;
input [31:0]w;
    begin
	s1 = ({w[16:0], w[31:17]} ^ {w[18:0], w[31:19]} ^ (w >> 10));
    end
endfunction

//computing w[16:63] values

wire [31:0]s_0,s_1;
genvar j;
generate
for(j=16;j<64;j=j+1) begin
	assign s_0 = s0(w[j-15]);
	assign s_1 = s1(w[j-2]);

        always@(s_0,s_1)begin
	     w[j] = w[j-16]+s_0+w[j-7]+s_1; 
	end			
	end	
endgenerate




reg [31:0]var_W;
  always @(a)
    begin : message_constant
      case(a)
        00: var_W = w[0];
        01: var_W = w[1];
        02: var_W = w[2];
        03: var_W = w[3];
        04: var_W = w[4];
        05: var_W = w[5];
        06: var_W = w[6];
        07: var_W = w[7];
        08: var_W = w[8];
        09: var_W = w[9];
        10: var_W = w[10];
        11: var_W = w[11];
        12: var_W = w[12];
        13: var_W = w[13];
        14: var_W = w[14];
        15: var_W = w[15];
        16: var_W = w[16];
        17: var_W = w[17];
        18: var_W = w[18];
        19: var_W = w[19];
        20: var_W = w[20];
        21: var_W = w[21];
        22: var_W = w[22];
        23: var_W = w[23];
        24: var_W = w[24];
        25: var_W = w[25];
        26: var_W = w[26];
        27: var_W = w[27];
        28: var_W = w[28];
        29: var_W = w[29];
        30: var_W = w[30];
        31: var_W = w[31];
        32: var_W = w[32];
        33: var_W = w[33];
        34: var_W = w[34];
        35: var_W = w[35];
        36: var_W = w[36];
        37: var_W = w[37];
        38: var_W = w[38];
        39: var_W = w[39];
        40: var_W = w[40];
        41: var_W = w[41];
        42: var_W = w[42];
        43: var_W = w[43];
        44: var_W = w[44];
        45: var_W = w[45];
        46: var_W = w[46];
        47: var_W = w[47];
        48: var_W = w[48];
        49: var_W = w[49];
        50: var_W = w[50];
        51: var_W = w[51];
        52: var_W = w[52];
        53: var_W = w[53];
        54: var_W = w[54];
        55: var_W = w[55];
        56: var_W = w[56];
        57: var_W = w[57];
        58: var_W = w[58];
        59: var_W = w[59];
        60: var_W = w[60];
        61: var_W = w[61];
        62: var_W = w[62];
        63: var_W = w[63];
      endcase 
    end
assign ms = var_W;

endmodule





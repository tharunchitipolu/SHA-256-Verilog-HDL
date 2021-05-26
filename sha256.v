





// compressor block

module comp_S1 (input wire [31:0] x,output wire [31:0] S1);
           assign S1 = ({x[5:0], x[31:6]} ^ {x[10:0], x[31:11]} ^ {x[24:0], x[31:25]});
endmodule


module Ch (input wire [31:0] x, y, z,output wire [31:0] Ch);
           assign Ch = ((x & y) ^ (~x & z));
endmodule


module comp_S0 (input wire [31:0] x, output wire [31:0] S0);
           assign S0 = ({x[1:0], x[31:2]} ^ {x[12:0], x[31:13]} ^ {x[21:0], x[31:22]});
endmodule


module Maj (input wire [31:0] x, y, z, output wire [31:0] Maj);
           assign Maj = (x & y) ^ (x & z) ^ (y & z);
endmodule



module sha_main#(parameter N)(data, m2b, clk, final_op);
   input clk;
   input [N-1:0]data;
   input [63:0]m2b;
   output [255:0]final_op;
 wire  [511:0]pp_out;
 wire [446-N:0]pad;

//padding
assign pad = 0;
assign pp_out = {data,1'b1, pad, m2b};


reg [31:0]a,b,c,d,e,f,g,h;

always@(posedge clk) 
begin

a = 32'h6A09E667;
b = 32'hBB67AE85;
c = 32'h3C6EF372;
d = 32'hA54FF53A;
e = 32'h510E527F;
f = 32'h9B05688C;
g = 32'h1F83D9AB;
h = 32'h5BE0CD19;
end


wire [31:0]s_1[0:63];
wire [31:0]ch_op[0:63];
wire [31:0]s_0[0:63];
wire [31:0]m_op[0:63];
wire [31:0]temp1,temp2;
wire [31:0]w_op[0:63];
wire [31:0]k_op[0:63];

wire [31:0]a1,b1,c1,d1,e1,f1,g1,h1;

genvar i;
generate 
   for (i = 0; i<64; i= i+1)begin
      comp_S1 s1(.x(e),.S1(s_1[i]));
      Ch c1(.x(e),.y(f),.z(g),.Ch(ch_op[i]));
      comp_S0 s0(.x(a),.S0(s_0[i]));
      Maj m1(.x(a),.y(b),.z(c),.Maj(m_op[i]));
      MS ms1(.data(pp_out),.a(i), .clk(clk),.ms(w_op[i]) );
      sha256_K k1(.var(i), .K(k_op[i]));
      assign temp1 = h + s_1[i] + ch_op[i] + w_op[i] + k_op[i];
      assign  temp2 = s_0[i] +  m_op[i];
      always @(posedge clk) begin
        h = g;
        g = f;
        f = e;
        e = d +temp1;
        d = c;
        c = b;
        b = a;
        a = temp1 + temp2 ;
      end
      end
endgenerate

always@* begin
 a = a + 32'h6A09E667;
 b = b + 32'hBB67AE85;
 c = c + 32'h3C6EF372;
 d = d + 32'hA54FF53A;
 e = e + 32'h510E527F;
 f = f + 32'h9B05688C;
 g = g + 32'h1F83D9AB;
 h = h + 32'h5BE0CD19;
end
assign final_op = {a,b,c,d,e,f,g,h};
endmodule
// initial rounded constants(K)

module sha256_K(var, K);
   input wire [5:0]var;
   output wire [31:0]K;

  reg [31 : 0] var_K;
  always @*
    begin : k_constants
      case(var)
        00: var_K = 32'h428a2f98;
        01: var_K = 32'h71374491;
        02: var_K = 32'hb5c0fbcf;
        03: var_K = 32'he9b5dba5;
        04: var_K = 32'h3956c25b;
        05: var_K = 32'h59f111f1;
        06: var_K = 32'h923f82a4;
        07: var_K = 32'hab1c5ed5;
        08: var_K = 32'hd807aa98;
        09: var_K = 32'h12835b01;
        10: var_K = 32'h243185be;
        11: var_K = 32'h550c7dc3;
        12: var_K = 32'h72be5d74;
        13: var_K = 32'h80deb1fe;
        14: var_K = 32'h9bdc06a7;
        15: var_K = 32'hc19bf174;
        16: var_K = 32'he49b69c1;
        17: var_K = 32'hefbe4786;
        18: var_K = 32'h0fc19dc6;
        19: var_K = 32'h240ca1cc;
        20: var_K = 32'h2de92c6f;
        21: var_K = 32'h4a7484aa;
        22: var_K = 32'h5cb0a9dc;
        23: var_K = 32'h76f988da;
        24: var_K = 32'h983e5152;
        25: var_K = 32'ha831c66d;
        26: var_K = 32'hb00327c8;
        27: var_K = 32'hbf597fc7;
        28: var_K = 32'hc6e00bf3;
        29: var_K = 32'hd5a79147;
        30: var_K = 32'h06ca6351;
        31: var_K = 32'h14292967;
        32: var_K = 32'h27b70a85;
        33: var_K = 32'h2e1b2138;
        34: var_K = 32'h4d2c6dfc;
        35: var_K = 32'h53380d13;
        36: var_K = 32'h650a7354;
        37: var_K = 32'h766a0abb;
        38: var_K = 32'h81c2c92e;
        39: var_K = 32'h92722c85;
        40: var_K = 32'ha2bfe8a1;
        41: var_K = 32'ha81a664b;
        42: var_K = 32'hc24b8b70;
        43: var_K = 32'hc76c51a3;
        44: var_K = 32'hd192e819;
        45: var_K = 32'hd6990624;
        46: var_K = 32'hf40e3585;
        47: var_K = 32'h106aa070;
        48: var_K = 32'h19a4c116;
        49: var_K = 32'h1e376c08;
        50: var_K = 32'h2748774c;
        51: var_K = 32'h34b0bcb5;
        52: var_K = 32'h391c0cb3;
        53: var_K = 32'h4ed8aa4a;
        54: var_K = 32'h5b9cca4f;
        55: var_K = 32'h682e6ff3;
        56: var_K = 32'h748f82ee;
        57: var_K = 32'h78a5636f;
        58: var_K = 32'h84c87814;
        59: var_K = 32'h8cc70208;
        60: var_K = 32'h90befffa;
        61: var_K = 32'ha4506ceb;
        62: var_K = 32'hbef9a3f7;
        63: var_K = 32'hc67178f2;
      endcase 
    end
assign K = var_K;
 
endmodule 


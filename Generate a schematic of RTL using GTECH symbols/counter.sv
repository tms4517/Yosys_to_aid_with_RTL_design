`default_nettype none

module counter
  ( input  var logic i_clk
  , input  var logic i_arst

  , input  var logic i_start
  , input  var logic i_stop

  , output  var logic [7:0] o_count
  );

  logic [7:0] count_d, count_q;

  {* therange *}

  always_ff @(posedge i_clk, posedge i_arst)
    if (i_arst)
      count_q <= '0;
    else if (i_start && !i_stop)
      count_q <= count_d;
    else
      count_q <= count_q;

  {* *}

  always_comb count_d = count_q + 1'b1;

  always_comb o_count = count_q;

endmodule

`resetall

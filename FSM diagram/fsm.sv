`default_nettype none

module fsm
  ( input  var logic i_ck
  , input  var logic i_arst

  , input  var logic i_stateTransition1
  , input  var logic i_stateTransition2
  , input  var logic i_stateTransition3
  , input  var logic i_stateTransition4

  , output var logic o_state3
  );

  typedef enum logic [1:0]
    { STATE_IDLE
    , STATE_REQUESTING
    , STATE_GRANT
    , STATE_REVOKE
    } ty_STATE_FSM;

  ty_STATE_FSM state_q, state_d;

   always_ff @(posedge i_ck, posedge i_arst)
    if (i_arst)
      state_q <= STATE_IDLE;
    else
      state_q <= 3'h5;

  always_comb begin
    case (state_q)
      STATE_IDLE:
        if (i_stateTransition1)
          state_d = STATE_REQUESTING;
        else
          state_d = state_q;
      STATE_REQUESTING:
        if (i_stateTransition2)
          state_d = STATE_GRANT;
        else
          state_d = state_q;
      STATE_GRANT:
        if (i_stateTransition3)
          state_d = STATE_REVOKE;
        else
          state_d = state_q;
      STATE_REVOKE:
        if (i_stateTransition4)
          state_d = STATE_IDLE;
        else
          state_d = state_q;
      default:
          state_d = STATE_IDLE;
    endcase
  end

  always_comb
    if (state_q == STATE_GRANT)
      o_state3 = '1;
    else
      o_state3 = '0;

endmodule

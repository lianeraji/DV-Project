interface Bit_Manipulation_intf(input logic clk);
  import rtl_pkg::*;

  timeunit 1ns;
  timeprecision 1ps;

  logic               rst_l;
  logic               scan_mode;
  logic               valid_in;
  rtl_alu_pkt_t       ap;
  logic               csr_ren_in;
  logic        [31:0] csr_rddata_in;
  logic signed [31:0] a_in;
  logic        [31:0] b_in;
  logic        [31:0] result_ff;
  logic               error;


  clocking cb_drv @(negedge clk);
    default input #1 output #0;
    output scan_mode;
    output valid_in;
    output ap;
    output csr_ren_in;
    output csr_rddata_in;
    output a_in;
    output b_in;
    input  result_ff;
    input  error;
  endclocking

  
  clocking cb_mon @(posedge clk);
    default input #0 output #1;
    input rst_l;
    input scan_mode;
    input valid_in;
    input ap;
    input csr_ren_in;
    input csr_rddata_in;
    input a_in;
    input b_in;
    input result_ff;
    input error;
  endclocking

  modport drv (clocking cb_drv, input clk, rst_l);
  modport mon (clocking cb_mon, input clk, rst_l);

endinterface

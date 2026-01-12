`timescale 1ns/1ns
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "enivornment.sv"
`include "test.sv"

module top;
  intf intff();
  decoder dut(.a(intff.a),.y(intff.y));
  
  initial begin
    uvm_config_db #(virtual intf)::set(null,"*","vif",intff);
  end
  initial begin
    run_test("test");
  end
  initial begin
    #5000;
    $display("sorry! ran out of time");
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule

`include "uvm_macros.svh"
`include "bvm_macros.svh"
import uvm_pkg::*;
module top;
  import test_pkg::*;

   initial begin
      run_test ("test");
   end
endmodule


// xrun options
    -timescale 10ns/1ns
    -access +rwc
    -gui
    -input restore.tcl
    +SVSEED=random
    
// UVM options
    -uvmhome "/Tools/cadence/XCELIUM2303/tools/methodology/UVM/CDNS-1.1d"
    +UVM_VERBOSITY=UVM_HIGH
    +UVM_NO_RELNOTES
    +uvm_set_config_int="*",recording_detail,1
    +define+BVM_ASSERT_BEGIN_TR=void'
    //+UVM_TESTNAME=random_test
    
// BVM
    -incdir ../bvm
    ../bvm/*.sv

// UVC (this is just a placeholder for now)
    //-incdir directory
    //uvc_pkg.sv
    //uvc_if.sv

// Top leve
    ./*.sv
//    huffman_dec.sv

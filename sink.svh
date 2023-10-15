class sink extends uvm_component;
	`uvm_component_utils(sink)
	uvm_blocking_put_imp#(in_tr,sink) in;
	function new(string name = "sink", uvm_component parent);
		super.new(name,parent);
		in  = new("in",this);
	endfunction
	task put(in_tr tr);
		`uvm_info("SINK","Transacao recebida",UVM_LOW)
		#10;
		`bvm_end_tr(tr)
	endtask
endclass

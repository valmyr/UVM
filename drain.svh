class drain extends uvm_component;
	`uvm_component_utils(drain)
	uvm_get_port#(in_tr) in;
	function new (string name="drain", uvm_component parent = null);
		super.new(name,parent);
		in = new("in",this);
	endfunction
	task run_phase(uvm_phase phase);
		in_tr tr;
		#30;
		forever begin
			#10;
			in.get(tr);
			`uvm_info("DRAIN	","transacao recebida",UVM_LOW)
			#10;
			`bvm_end_tr(tr)
		end
	endtask
endclass

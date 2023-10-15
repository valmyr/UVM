class source extends uvm_component;
	`uvm_component_utils(source)
	uvm_blocking_put_port#(in_tr) out;
	function new(string name ="source",uvm_component parent);
		super.new(name,parent);
		out = new("out",this);
	endfunction
	task run_phase(uvm_phase phase);
		in_tr tr;
		phase.raise_objection(this);
		repeat(2) begin
		 	#10;
			tr = in_tr::type_id::create("tr",this);
			assert(tr.randomize());
			$display("%b",tr.uni);
			for(int i = 0; i < 8; i = i + 1)begin
				`uvm_info("SOURCE","Enviando transacao",UVM_LOW)
				`bvm_begin_tr(tr)
				tr.in = tr.uni[7-i];
				out.put(tr);	
			end

		end
		#10;
		phase.drop_objection(this);
	endtask
endclass

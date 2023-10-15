class refmod extends uvm_component;
	`uvm_component_utils(refmod)
	uvm_get_port #(in_tr) in;
	uvm_blocking_put_port#(in_tr) out;
	
	function new(string name, uvm_component parent=null);
		super.new(name,parent);
		in  = new("in",this);
		out = new("out",this);
	endfunction: new
	task run_phase(uvm_phase phase);
		in_tr tr_in, tr_out;
		/*in_tr logic  {S1=8'b00000001,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18} symbols;
		in_tr logic {I01 = 8'b00000001,
			I02 = 8'b00000010,
			I03 = 8'b00000110,
			I04 = 8'b00111000,
			I05 = 8'b00111001,
			I06 = 8'b01110110,
			I07 = 8'b01111000,
			I08 = 8'b01110110,
			I09 = 8'b01110111,
			I10 = 8'b01111000,
			I11 = 8'b01111001,
			I12 = 8'b01111010,
			I13 = 8'b01111011,
			I14 = 8'b01111100,
			I15 = 8'b01111101,
			I16 = 8'b01111110,
			I17 = 8'b11111110,
			I18 = 8'b11111111} code_words;
		*/
		forever begin
			in.get(tr_in);
			#10;
			`bvm_end_tr(tr_in);
			tr_out = in_tr::type_id::create("tr_out",this);
			tr_out.in = tr_in.in;
			`uvm_info("REFMOD",tr_out.in,"UVM_HIGH")
			`bvm_begin_tr(tr_out)
			#10;
			out.put(tr_out);
		end
	endtask

endclass

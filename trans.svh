class in_tr extends uvm_sequence_item;
	rand bit [7:0] uni;
	bit in;
	constraint in_universe{uni inside {8'b00000001,8'b00000010,8'b00000110,8'b00111000,8'b00111001,8'b01110110,8'b01111000,8'b01110110,8'b01110111,8'b01111000,8'b01111001,8'b01111010, 8'b01111011,8'b01111100,8'b01111101,8'b01111110,8'b11111110,8'b11111111};}
	constraint in_small {uni < 256; }
	`uvm_object_utils_begin(in_tr)
		`uvm_field_int(in, UVM_ALL_ON | UVM_BIN);
	`uvm_object_utils_end
endclass

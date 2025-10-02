class apb_ral_read_sequence extends uvm_sequence #(apb_ral_seq_item);

	`uvm_object_utils(apb_ral_read_sequence)
	
	function new(string name = "apb_ral_read_sequence");
		super.new(name);
	endfunction

	task body();
		apb_ral_seq_item req;
		repeat(5) begin
			req=apb_ral_seq_item::type_id::create("req");
			start_item(req);
			if(!req.randomize() with {psel==1;pwrite==0;penable==1;}
				`uvm_error("_APB_RAL_READ_SEQUENCE_","RANDOMIZATION FAILED")
			finish_item(req);
		end
	endtask
endclass

class apb_ral_write_sequence extends uvm_sequence #(apb_ral_seq_item);
	
	`uvm_object_utils(apb_ral_write_sequence)

	function new(string new="apb_ral_write_sequence");
		super.new(name);
	endfunction

	task body();
		apb_ral_seq_item req;
		repeat(5) begin
			req=apb_ral_seq_item::type_id::create("req");
			start_item(req);
			if(!req.randomize() with {req.psel ==1;req.pwrite==1;penable==1;})
				`uvm_error("_APB_RAL_WRITE_SEQUENCE_","RANDOMIZATION FAILED")
			finish_item(req);
		end
	endtask
endclass



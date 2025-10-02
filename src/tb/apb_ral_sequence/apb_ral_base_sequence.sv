class apb_ral_base_sequence extends uvm_sequence #(apb_ral_seq_item);

	`uvm_object_utils(apb_ral_base_sequence)

	function new(string name = "apb_ral_base_sequence");
		super.new(name);
	endfunction

	task body();
		apb_ral_seq_item req;
		repeat(5) begin
			req = apb_ral_seq_item::type_id::create("req");
			start_item(req);
			if(!req.randomize() with { req.psel ==1; req.penable ==1;})
				`uvm_error("_APB_RAL_BASE_SEQUENCE_","RANDOMIZATION FAILED")
	
			finish_item(req);
		end
	endtask
endclass

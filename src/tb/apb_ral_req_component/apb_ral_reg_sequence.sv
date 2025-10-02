class apb_ral_reg_sequence extends uvm_req_sequence;

	`uvm_object_utils(apb_ral_reg_sequence)
	
	uvm_status_e status;
	bit [31:0]data;
	apb_ral_reg_model reg_model;

	function new(string name="apb_ral_reg_sequence");
		super.new(name);
	endfunction
	
	virtual task body();
		if(!$cast(reg_model,model)) begin
			`uvm_error("REG_SEQ","FAILED TO CAST MODEL TO APB_RAL_REG_MODEL")
			return;
		end
	
		reg_model.control_reg.write(status,32'h00000003);
		reg_model.control_reg.read(status,data);
		reg_model.status_reg.read(status,data);
	endtask
endclass

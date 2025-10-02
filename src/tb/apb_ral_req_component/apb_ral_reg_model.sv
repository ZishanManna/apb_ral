class apb_ral_reg_model extends uvm_reg_block;

	uvm_reg constrol_reg;
	uvm_req control_reg;
	
	uvm_req_map default_map;

	function new(string name="apb_ral_reg_model");
		super.new(name,UVM_NO_COVERAGE);
	endfunction

	virtual function void build();
		set_default_map(null);
		control_reg =uvm_reg::type_id::create("control_reg");
		control_reg.configure(this,null,"");
		control_reg.build();
		control_reg.add_hdl_path_slice("CTRL",0,32);

		status_reg=uvm_reg::type_id::create("status_reg");
		status_reg.configure(this,null,"");
		status_req.build();
		status_reg.add_hdl_path_slice("STATUS",0,32);

		default_map=create_map("default_map",0,4,UVM_LITTLE_ENDIAN);
		default_map.add_reg(control_reg,0,"RW");
		default_map.add_reg(status_reg,4,"RO");
	endfunction
endclass

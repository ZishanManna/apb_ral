class apb_ral_reg_adapter extends uvm_reg_adapter;
	
	`uvm_object_utils(apb_ral_reg_adapter)

	function new(string name ="apb_ral_reg_adapter");
		super.new(name);
	endfunction

	virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
		apb_ral_seq_item item;
		item=apb_ral_seq_item::type_id::create("item");
		item.paddr	=rw.addr;
		item.pwdata	=rw.data;
		item.pwrite 	=rw.write;
		item.psel	=1'b1;
		item.penable	=1'b1;
		return item;
	endfunction

	virtual function void bus2reg(uvm_sequence_item bus_item,ref uvm_reg_bus_op rw);
		apb_ral_seq_item item;
		if(!$cast(item,bus_item))retun;
		
		rw.kind		=item.pwrite?UVM_WRITE :UVM_READ;
		rw.addr		=item.paddr;
		rw.data		=item.prdata;
	endfunction
endclass



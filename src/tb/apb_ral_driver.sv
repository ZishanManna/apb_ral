class apb_ral_driver extends uvm_driver #(apb_ral_seq_item);

	`uvm_component_utils("apb_ral_driver")

	virtual apb_ral_interface vif;

	function new(string name ="apb_ral_driver",uvm_component parent);
		super.new(name,parent);
	endfunction
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual apb_ral_interface)::get(this,"*","vif",vif)
			`uvm_error("_APB_RAL_DRIVER_","VIF IS NOT SET")
	endfunction

	virtual task run_phase(uvm_phase phase);
		apb_ral_seq_item req;
		forever begin 
			seq_item_port.get_next_item(req);
			vif.drv_cb.paddr 	<= req.paddr;
			vif.drv_cb.pwdata	<= req.pwdata;
			vif.drv_cb.psel 	<=req.psel;
			vif.drv_cb.penable	<=req.penable;
			vif.drv_cb.pwrite	<=req.pwrite;
			vif.drv_cb.pready	<=1'b1;
			seq_item_port.item_done();
		end
	endtask
endclass

class apb_ral_sequencer extends uvm_sequencer #(apb_ral_seq_item);

	`uvm_component_utils(apb_ral_sequencer)

	function new(string name ="apb_ral_sequencer",uvm-component parent);
		super.new(name,parent);
	endfunction
endclass

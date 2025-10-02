class apb_ral_seq_item extends uvm_sequence_item;

	rand bit [31:0] paddr;
	rand bit [31:0] pwdata;
	     bit [31:0] prdata;
	rand bit pwrite;
	rand bit psel;
	rand bit penable;
	rand bit pready;

	`uvm_object_utils(apb_ral_seq_item)
	
	function new (string name = "apb_ral_seq_item");
		super.new(name);
	endfunction

	constraint pready_c { pready == 1; }
	
	function string convert2string();
		return $sformat("APB TXN: PADDR = 0x%0h, PWDATA = 0x%0h, PRDATA = 0x%0h, PWRITE = %0b, PSEL = %0b, PENABLE =%0b, PREADY =%0b",paddr,pwdata,prdata,pwrite,psel,penable,pready);
	endfunction

endclass


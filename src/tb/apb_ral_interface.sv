interface abp_ral_interface(input logic pclk,input logic presetn);

	logic [31:0] paddr;
	logic [31:0] pwdata;
	logic [31:0] prdata;
	logic psel;
	logic penable;
	logic pwrite;
	logic pready;
	
	clocking drv_cb @(posedge pclk);
		default input #1step output #1step;
		output paddr,pwdata,psel,penable,pwrite;
		input prdata,pready;
	endclocking

	clocking mon_cb @(posedge pclk);
		default input #1step output #1step;
		input paddr,pwdata,prdata,psel,penable,pwrite,pready;
	endclocking

	modport DRV (clocking drv_cb,input presetn);
	modport MON (clocking mon_cb,input presetn);

endinterface

	

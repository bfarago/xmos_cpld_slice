// Copyright (C) 2010-2016 MYND-ideal Ltd. All rights reserved.

// EXAMPLE for xmos cpld slice panel concept
// lines are connected, driving direction depends on internal state.
// Three modes are the following: init (after reset), run0 and run1.
// In init mode, the system waits for a timeout or some "magic" happends.
// The "magic" is a combination of input pins from main board (which can be configured here).
// Whithout this combination, a timeout will be reached, and automatically falls back to run0 mode,
// which is the default stable run mode. Other (run1) mode can be selectable by user.
// Every run modes could have a magic pin combination, which triggers the system to goes back to init mode.
// At this source only one combination is deffinied. In this "magic" combination, run level will left, state
// machine will goes to init mode. In init mode, while the timeout not reached, we could start a "communication"
// to choose the next run level.
// At this implementation we have an sclk, and a mode0 pin chosen (these pins are in the set of the magic
// pins). On falling edge of sclk, we sample the mode pin(s), then state machine next state is chosen by the selected
// mode. If mode0 bit is zero, run0 level reached, if mode0 is high, run1 state will be chosen.
// 
// Planned to use this system in the following way:
// 1) Desktop tool helps to generate this verilog file, depending on the typical usage of the slice cards. With jtag interface
// user could download a specific image to the cpld card. A static routing simply, need to set the port directions, and assign
// the connections (by the desktop tool).
// 2..n) After an investigation, choose typical modes, do some interaction with the DUT if necessary, or write triggers to the
// cpld code, if directions changing dinamically. In this case, we could organise the ports with 0..n is dinamical, n+1..max are
// statically routed. This is something what need to specify, than desktop application need to implements the cases... 
//
// TODO:
// -After this mockup, I guess the pin nameing must looks like a bus, rather than cannonical names like this. (AA16) Because
// the verilog requires to specify the pin directly... Ech. So better if we could access to the pins like a bus.
// -pin55 not used, but B18 is connected only once. So, we could connect it...
//
// Already tested (conceptually):
//  - statically declared routes ( both direction, and the connection is given by the verilog)
//  - dinamic direction version.. Something like this... 
//  - triggerable version (todo)
//  - i2c like bus could make a pain in the ass. We don'know the direction explicitly.
//  - smallest cpld (40) is to weak to add -any- logic.. 80 can be ok.

// OK, What is in this file right now:
// each slice pin connected strait to the same numbered pin on the board left and right side. So nothing is scrambled, each pin
// keeps its function as it is. Direction must be specified, and run modes could be choosen (which contains configurations on
// the directions). For example, there is a trigger only in run0 mode, which sets one line direction dinamicaly.
 

module xmos_cpld_slice
(
// {ALTERA_ARGS_BEGIN} DO NOT REMOVE THIS LINE!
	CLK,
	nRST,
	
	AB10,
	AA11,
	AB11,
	AA12,
	AB12,
	AA13,
	AB13,
	AA15,
	AB15,
	AA16,
	AB17,
	B18,
	AA18,
	BA18,
	BB17,
	BA16,
	BB15,
	BA15,
	BB13,
	BA13,
	BB12,
	BA12,
	BB11,
	BA11,
	BB10,
	BA9,
	BB9,
	BA8,
	BB7,
	BA7,
	BB6,
	BA6,
	BB4,
	BA4,
	BB2,
	BA3,
	BB1,
	BA1,
	AA1,
	AB1,
	AA3,
	AB2,
	AA4,
	AB4,
	P55,
	AA6,
	AB6,
	AA7,
	AB7,
	AA8,
	AB9,
	AA9
// {ALTERA_ARGS_END} DO NOT REMOVE THIS LINE!

);

// {ALTERA_IO_BEGIN} DO NOT REMOVE THIS LINE!
input			CLK;
input			nRST;

inout			AB10;
inout			AA11;
inout			AB11;
inout			AA12;
inout			AB12;
inout			AA13;
inout			AB13;
inout			AA15;
inout			AB15;
inout			AA16;
inout			AB17;
inout			B18;
inout			AA18;
inout			BA18;
inout			BB17;
inout			BA16;
inout			BB15;
inout			BA15;
inout			BB13;
inout			BA13;
inout			BB12;
inout			BA12;
inout			BB11;
inout			BA11;
inout			BB10;
inout			BA9;
inout			BB9;
inout			BA8;
inout			BB7;
inout			BA7;
inout			BB6;
inout			BA6;
inout			BB4;
inout			BA4;
inout			BB2;
inout			BA3;
inout			BB1;
inout			BA1;
inout			AA1;
inout			AB1;
inout			AA3;
inout			AB2;
inout			AA4;
inout			AB4;
inout			P55;
inout			AA6;
inout			AB6;
inout			AA7;
inout			AB7;
inout			AA8;
inout			AB9;
inout			AA9;

// {ALTERA_IO_END} DO NOT REMOVE THIS LINE!
// {ALTERA_MODULE_BEGIN} DO NOT REMOVE THIS LINE!

// number of lines
localparam lines =25;
// first n line specdatal, the rest is dummy wires between pins.
localparam rest =0;

//each bidirectional pin named as A or B array item depends on connection (left or right side) 
reg [lines-1:0] data;
wire [lines-1:0] lineA;
wire [lines-1:0] lineB;
reg [lines-1:0] dir;

//states and modes
`define s_init 2'b00
`define s_run0  2'b01
`define s_run1  2'b10
`define s_wt 2'b11

reg [1:0] state;
reg [8:0] counterA;	//timer

//choose a combination which is not possible at normal case (free gpio)
wire [2:0] magic;
assign magic ={lineA[2], lineA[1], lineA[0]};
`define magicvalue  3'b111

wire magic_sck;
wire magic_mode0;
assign magic_sck   = lineA[2];
assign magic_mode0 = lineA[1];

wire example_trigger;
assign example_trigger= lineA[9]; //for example

ALT_IOBUF myiobufA0  (.i(data[ 0]), .oe(dir[ 0]), .o(lineA[ 0]),.io(AB17)); 
ALT_IOBUF myiobufA1  (.i(data[ 1]), .oe(dir[ 1]), .o(lineA[ 1]),.io(AB15));  
ALT_IOBUF myiobufA2  (.i(data[ 2]), .oe(dir[ 2]), .o(lineA[ 2]),.io(AB13)); 
ALT_IOBUF myiobufA3  (.i(data[ 3]), .oe(dir[ 3]), .o(lineA[ 3]),.io(AB12)); 
ALT_IOBUF myiobufA4  (.i(data[ 4]), .oe(dir[ 4]), .o(lineA[ 4]),.io(AB11));  
ALT_IOBUF myiobufA5  (.i(data[ 5]), .oe(dir[ 5]), .o(lineA[ 5]),.io(AB10));  
ALT_IOBUF myiobufA6  (.i(data[ 6]), .oe(dir[ 6]), .o(lineA[ 6]),.io(AB9));  
ALT_IOBUF myiobufA7  (.i(data[ 7]), .oe(dir[ 7]), .o(lineA[ 7]),.io(AB7));  
ALT_IOBUF myiobufA8  (.i(data[ 8]), .oe(dir[ 8]), .o(lineA[ 8]),.io(AB6));  
ALT_IOBUF myiobufA9  (.i(data[ 9]), .oe(dir[ 9]), .o(lineA[ 9]),.io(AB4));  
ALT_IOBUF myiobufA10 (.i(data[10]), .oe(dir[10]), .o(lineA[10]),.io(AB2));  
ALT_IOBUF myiobufA11 (.i(data[11]), .oe(dir[11]), .o(lineA[11]),.io(AB1));  
ALT_IOBUF myiobufA12 (.i(data[12]), .oe(dir[12]), .o(lineA[12]),.io(AA18));  
ALT_IOBUF myiobufA13 (.i(data[13]), .oe(dir[13]), .o(lineA[13]),.io(AA16));  
ALT_IOBUF myiobufA14 (.i(data[14]), .oe(dir[14]), .o(lineA[14]),.io(AA15));  
ALT_IOBUF myiobufA15 (.i(data[15]), .oe(dir[15]), .o(lineA[15]),.io(AA13));  
ALT_IOBUF myiobufA16 (.i(data[16]), .oe(dir[16]), .o(lineA[16]),.io(AA12));  
ALT_IOBUF myiobufA17 (.i(data[17]), .oe(dir[17]), .o(lineA[17]),.io(AA11));  
ALT_IOBUF myiobufA18 (.i(data[18]), .oe(dir[18]), .o(lineA[18]),.io(AA9));  
ALT_IOBUF myiobufA19 (.i(data[19]), .oe(dir[19]), .o(lineA[19]),.io(AA8));  
ALT_IOBUF myiobufA20 (.i(data[20]), .oe(dir[20]), .o(lineA[20]),.io(AA7));  
ALT_IOBUF myiobufA21 (.i(data[21]), .oe(dir[21]), .o(lineA[21]),.io(AA6));  
ALT_IOBUF myiobufA22 (.i(data[22]), .oe(dir[22]), .o(lineA[22]),.io(AA4));  
ALT_IOBUF myiobufA23 (.i(data[23]), .oe(dir[23]), .o(lineA[23]),.io(AA3));  
ALT_IOBUF myiobufA24 (.i(data[24]), .oe(dir[24]), .o(lineA[24]),.io(AA1));  


ALT_IOBUF myiobufB0  (.i(data[ 0]), .oe(~dir[ 0]), .o(lineB[ 0]),.io(BB17)); 
ALT_IOBUF myiobufB1  (.i(data[ 1]), .oe(~dir[ 1]), .o(lineB[ 1]),.io(BB15));  
ALT_IOBUF myiobufB2  (.i(data[ 2]), .oe(~dir[ 2]), .o(lineB[ 2]),.io(BB13)); 
ALT_IOBUF myiobufB3  (.i(data[ 3]), .oe(~dir[ 3]), .o(lineB[ 3]),.io(BB12)); 
ALT_IOBUF myiobufB4  (.i(data[ 4]), .oe(~dir[ 4]), .o(lineB[ 4]),.io(BB11));  
ALT_IOBUF myiobufB5  (.i(data[ 5]), .oe(~dir[ 5]), .o(lineB[ 5]),.io(BB10));  
ALT_IOBUF myiobufB6  (.i(data[ 6]), .oe(~dir[ 6]), .o(lineB[ 6]),.io(BB9));  
ALT_IOBUF myiobufB7  (.i(data[ 7]), .oe(~dir[ 7]), .o(lineB[ 7]),.io(BB7));  
ALT_IOBUF myiobufB8  (.i(data[ 8]), .oe(~dir[ 8]), .o(lineB[ 8]),.io(BB6));  
ALT_IOBUF myiobufB9  (.i(data[ 9]), .oe(~dir[ 9]), .o(lineB[ 9]),.io(BB4));  
ALT_IOBUF myiobufB10 (.i(data[10]), .oe(~dir[10]), .o(lineB[10]),.io(BB2));  
ALT_IOBUF myiobufB11 (.i(data[11]), .oe(~dir[11]), .o(lineB[11]),.io(BB1));  
ALT_IOBUF myiobufB12 (.i(data[12]), .oe(~dir[12]), .o(lineB[12]),.io(BA18));  
ALT_IOBUF myiobufB13 (.i(data[13]), .oe(~dir[13]), .o(lineB[13]),.io(BA16));  
ALT_IOBUF myiobufB14 (.i(data[14]), .oe(~dir[14]), .o(lineB[14]),.io(BA15));  
ALT_IOBUF myiobufB15 (.i(data[15]), .oe(~dir[15]), .o(lineB[15]),.io(BA13));  
ALT_IOBUF myiobufB16 (.i(data[16]), .oe(~dir[16]), .o(lineB[16]),.io(BA12));  
ALT_IOBUF myiobufB17 (.i(data[17]), .oe(~dir[17]), .o(lineB[17]),.io(BA11));  
ALT_IOBUF myiobufB18 (.i(data[18]), .oe(~dir[18]), .o(lineB[18]),.io(BA9));  
ALT_IOBUF myiobufB19 (.i(data[19]), .oe(~dir[19]), .o(lineB[19]),.io(BA8));  
ALT_IOBUF myiobufB20 (.i(data[20]), .oe(~dir[20]), .o(lineB[20]),.io(BA7));  
ALT_IOBUF myiobufB21 (.i(data[21]), .oe(~dir[21]), .o(lineB[21]),.io(BA6));  
ALT_IOBUF myiobufB22 (.i(data[22]), .oe(~dir[22]), .o(lineB[22]),.io(BA4));  
ALT_IOBUF myiobufB23 (.i(data[23]), .oe(~dir[23]), .o(lineB[23]),.io(BA3));  
ALT_IOBUF myiobufB24 (.i(data[24]), .oe(~dir[24]), .o(lineB[24]),.io(BA1));  

//this generate block unusable on this way... But something similar can be...
genvar n;
generate
for (n=rest; n<lines; n=n+1)
	begin : gen_cons
	//ALT_IOBUF myiobufA (.i(data[n]), .oe(dir[n]), .o(line[n]),.io(A[n])); 
//	defparam <instance_name>.io_standard = "3.3-V PCI"; 
//	defparam <instance_name>.current_strength = "minimum current"; 
//	defparam <instance_name>.slow_slew_rate = "on"; 
//	defparam <instance_name>.location = "IlineANK_1"; 
//	defparam <instance_name>.enable_bus_hold = "on";
//	defparam <instance_name>.weak_pull_up_resistor = "off";
//	defparam <instance_name>.termination = "series 50 ohms"; 
	end
endgenerate

integer i;


//genvar i;
//generate
//for (i=rest; i<lines; i=i+1)
//	begin : gen_cons
//		assign B[i] = dir[i] ? A[i]: 'bz;    // wire A[] is syntactically ok, but not the same as bidir port.
//		assign A[i] = (~dir[i]) ? B[i]: 'bz; // so this way not works. Ports nameing will be indexed (bus) later!
//	end
//endgenerate

always @(posedge CLK or negedge nRST) begin
	if (~nRST) begin
		// initdatal values set by reset, this is the direction config, one bit for one line.
		// if dir[n] bit is 1, line driving direction is B[n] <= A[n]
		// Which means an output from main blinerd point of view.
		//       4321098765432109876543210
		dir =  'b0000000000000000000000000;  // reset state (SETUP_initial)
		data=0;
		counterA= 255;	//aprox. 2usec 500khz
		state= `s_init;
	end
	else
	begin
		for (i=rest; i<lines; i=i+1)
		begin
			data[i] = dir[i]?lineB[i]:lineA[i];
		end
		
		case (state)
			`s_init:
				begin
					if (counterA == 0) 
					begin
						state= `s_run0; //fallback timeout
					end
					if (magic_sck)
					begin
							state= `s_wt;
					end
				end
			`s_wt:
				if (~magic_sck)
					begin
						state= magic_mode0 ? `s_run1 : `s_run0 ;
					end
			`s_run1:	//SETUP 1
				begin
				   //       4321098765432109876543210
					dir =  'b0001001010101010111100000;	
					if (magic == 3'b111)
					begin
						state= `s_init;
						counterA= 255;
					end
				end
			`s_run0: //SETUP 0
				begin
					//       4321098765432109876543210
					dir =  'b0111001000101010111100000;
					if (magic == 3'b111)
					begin
						state= `s_init;
						counterA= 255;
					end
					dir[11]=example_trigger;
				end
		endcase
		
		if (counterA)
		begin
				counterA=counterA - 1;
		end
	end
end

// {ALTERA_MODULE_END} DO NOT REMOVE THIS LINE!
endmodule

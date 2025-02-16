/*
	Copyright 2024 Efabless Corp.

	Author: Efabless Corp. (ip_admin@efabless.com)

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	    http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/

`timescale              1ns/1ps
`default_nettype        wire

/*
    A bit bangging flash writer with AHB slave interface
    Registers:
        00: Write Enable
        04: SSn control
        08: SCK control
        0C: OE control
        10: SO data out (write, 4 bits)
        14: SI data in (read, 4bits)
*/

module EF_QSPI_FLASH_WRITER (
    input               HCLK,
    input               HRESETn,
    
    // AHB-Lite Slave Interface
    //`AHB_SLAVE_IFC,
    // AHB-Lite Slave Interface
    input wire          HSEL,
    input wire [31:0]   HADDR,
    input wire [1:0]    HTRANS,
    input wire          HWRITE,
    input wire          HREADY,
    input wire [31:0]   HWDATA,
    input wire [2:0]    HSIZE,
    output wire         HREADYOUT,
    output wire [31:0]  HRDATA,
    
    // FLASH Interface from the FR
    input  wire         fr_sck,
    input  wire         fr_ce_n,
    output wire [3:0]   fr_din,
    input  wire [3:0]   fr_dout,
    input  wire         fr_douten,

    // FLASH Interface
    output  wire        fm_sck,
    output  wire        fm_ce_n,
    input   wire [3:0]  fm_din,
    output  wire [3:0]  fm_dout,
    output  wire [3:0]  fm_douten
);

    localparam  WE_REG_OFF  = 8'h00, 
                SS_REG_OFF  = 8'h04,
                SCK_REG_OFF = 8'h08,
                OE_REG_OFF  = 8'h0c,
                SO_REG_OFF  = 8'h10,
                SI_REG_OFF  = 8'h14,
                ID_REG_OFF  = 8'h18;
                
                
    
    reg             last_HSEL;
    reg [31:0]      last_HADDR;
    reg             last_HWRITE;
    reg [1:0]       last_HTRANS;

    always@ (posedge HCLK or negedge HRESETn) begin
		if (!HRESETn) begin
			last_HSEL       <= 0;
			last_HADDR      <= 0;
			last_HWRITE     <= 0;
			last_HTRANS     <= 0;
		end else if(HREADY) begin
			last_HSEL       <= HSEL;
			last_HADDR      <= HADDR;
			last_HWRITE     <= HWRITE;
			last_HTRANS     <= HTRANS;
		end
	end

    wire rd_enable = last_HSEL & (~last_HWRITE) & last_HTRANS[1];
    wire wr_enable = last_HSEL & (last_HWRITE) & last_HTRANS[1];

    reg             WE_REG;
    wire WE_REG_sel = wr_enable & (last_HADDR[7:0] == WE_REG_OFF);
    always @(posedge HCLK or negedge HRESETn)
    begin
        if (~HRESETn)
            WE_REG <= 1'h0;
        else if (WE_REG_sel & (HWDATA[31:8] == 24'hA5A855))
            WE_REG <= HWDATA[0];
    end

    
        reg [1-1:0] SS_REG;
        wire SS_REG_SEL = wr_enable & (last_HADDR[15:0] == SS_REG_OFF);
        always @(posedge HCLK or negedge HRESETn)
            if (~HRESETn)
                SS_REG <= 1;
            else if (SS_REG_SEL)
                SS_REG <= HWDATA[1-1:0];  
    
        reg [1-1:0] SCK_REG;
        wire SCK_REG_SEL = wr_enable & (last_HADDR[15:0] == SCK_REG_OFF);
        always @(posedge HCLK or negedge HRESETn)
            if (~HRESETn)
                SCK_REG <= 0;
            else if (SCK_REG_SEL)
                SCK_REG <= HWDATA[1-1:0];
    
        reg [4-1:0] OE_REG;
        wire OE_REG_SEL = wr_enable & (last_HADDR[15:0] == OE_REG_OFF);
        always @(posedge HCLK or negedge HRESETn)
            if (~HRESETn)
                OE_REG <= 0;
            else if (OE_REG_SEL)
                OE_REG <= HWDATA[4-1:0];  
    
        reg [4-1:0] SO_REG;
        wire SO_REG_SEL = wr_enable & (last_HADDR[15:0] == SO_REG_OFF);
        always @(posedge HCLK or negedge HRESETn)
            if (~HRESETn)
                SO_REG <= 0;
            else if (SO_REG_SEL)
                SO_REG <= HWDATA[4-1:0];
    
    assign HRDATA = (last_HADDR[7:0] == SI_REG_OFF) & rd_enable ? {31'h0, fm_din[1]} : 
                    (last_HADDR[7:0] == ID_REG_OFF) & rd_enable ? {32'hABCD0001} : 
                    32'h0; 

    assign  fm_sck      =   WE_REG  ?   SCK_REG :   fr_sck;
    assign  fm_ce_n     =   WE_REG  ?   SS_REG  :   fr_ce_n;
    assign  fm_douten   =   WE_REG  ?   OE_REG  :   {4{fr_douten}};
    assign  fm_dout     =   WE_REG  ?   SO_REG  :   fr_dout;

    assign fr_din       =   fm_din;

    assign HREADYOUT = 1'b1;

endmodule

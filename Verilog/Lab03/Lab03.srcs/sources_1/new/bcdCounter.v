`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2019 12:27:21 PM
// Design Name: 
// Module Name: bcdCounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module bcdCounter(
    output reg [3:0] outputs,
    output reg overflow,
    output reg borrow,
    input wire up,
    input wire down,  
    input wire set9,
    input wire clear,
    input wire clk
    );

//////////////////////////////////////////////////////////////////////////////////
initial
begin
    outputs = 0;
end
////////////////////////////////////////////////////////////////////////////////////
always @(posedge clk)
begin
overflow = 0;
borrow = 0;
case ({up, down, set9, clear})
//////////////////////////////////////////////////////////////////////////////////
4'b1000: //counter up
begin
    overflow = (outputs == 9);
    outputs = (outputs + 1) % 10;
end
//////////////////////////////////////////////////////////////////////////////////
4'b0100: //counter down
begin
    borrow = (outputs == 0);
    outputs = (outputs + 9) % 10;
end
//////////////////////////////////////////////////////////////////////////////////
4'b0010: outputs = 9; // set 9
//////////////////////////////////////////////////////////////////////////////////
4'b0001: outputs = 0; // clear
endcase
end

endmodule
 
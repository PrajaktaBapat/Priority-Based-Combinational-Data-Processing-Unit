//Priority encoder block for data processing unit
module priority_enc_block(i0,i1,i2,i3,s0,s1,valid);
input i0,i1,i2,i3;
output reg s0,s1;
output reg valid;
always @(*) begin
valid = 1'b1;

//i3 input selected
if (i3) begin
s1=1'b1;
s0=1'b1;
end

//i2 input selected
else if(i2) begin
s1=1'b1;
s0=1'b0;
end

//i1 input selected
else if(i1) begin
s1=1'b0;
s0=1'b1;
end

//i0 input selected
else if(i0) begin
s1=1'b0;
s0=1'b0;
end

//valid bit is low
else begin
s1=1'b0;
s0=1'b0;
valid=1'b0;
end

end
endmodule

module priority_enc_block_TB();
reg i0,i1,i2,i3;
wire s0,s1,valid;

priority_enc_block uut( .i0(i0), .i1(i1), .i2(i2), .i3(i3), .s0(s0), .s1(s1), .valid(valid));

initial begin
$display("---- 4:2 Priority Encoder Verification Started ----");
//No inputs active
i0=0;i1=0;i2=0;i3=0; #20;

//Single input active cases
i0=1;i1=0;i2=0;i3=0; #20;
i0=0;i1=1;i2=0;i3=0; #20;
i0=0;i1=0;i2=1;i3=0; #20;
i0=0;i1=0;i2=0;i3=1; #20;

//Priority Tests
i0=1;i1=1;i2=0;i3=0; #20;
i0=1;i1=0;i2=1;i3=0; #20;
i0=1;i1=1;i2=1;i3=0; #20;
i0=0;i1=1;i2=0;i3=1; #20;
i0=0;i1=0;i2=1;i3=1; #20;
i0=1;i1=1;i2=1;i3=1; #20;
end
endmodule

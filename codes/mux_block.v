//4:1 MUX block using 2:1 MUX hierarchical structure 
module mux_2to1(s1,i0,i1,y0);
input s1,i0,i1;
output y0;
assign y0 = s1 ? i1:i0;
endmodule

module mux_block(s0,s1,i0,i1,i2,i3,out);
input s0,s1,i0,i1,i2,i3;
output out;
wire y0,y1;

mux_2to1 M1( .s1(s1), .i0(i0), .i1(i1), .y0(y0));
mux_2to1 M2( .s1(s1), .i0(i2), .i1(i3), .y0(y1));
mux_2to1 M3( .s1(s0), .i0(y0), .i1(y1), .y0(out));

endmodule

//Testbench for verification of the block
module mux_block_TB();
reg s0,s1,i0,i1,i2,i3;
wire out;
integer sel;

mux_block uut( .s0(s0), .s1(s1), .i0(i0), .i1(i1), .i2(i2), .i3(i3), .out(out));

initial begin
$display("---- 4:1 MUX Verification Started ----");

        // Test Case 1: Mixed inputs
        $display("Test Case 1: Mixed inputs");
        {i0,i1,i2,i3} = 4'b0101;

        for (sel = 0; sel < 4; sel = sel + 1) begin
            {s0,s1} = sel;
            #10;
        end

        // Test Case 2: Inverted inputs
        $display("Test Case 2: Inverted inputs");
        {i0,i1,i2,i3} = 4'b1010;

        for (sel = 0; sel < 4; sel = sel + 1) begin
            {s0,s1} = sel;
            #10;
        end

        // Test Case 3: All zeros
        $display("Test Case 3: All zeros");
        {i0,i1,i2,i3} = 4'b0000;

        for (sel = 0; sel < 4; sel = sel + 1) begin
            {s0,s1} = sel;
            #10;
        end

        // Test Case 4: All ones
        $display("Test Case 4: All ones");
        {i0,i1,i2,i3} = 4'b1111;

        for (sel = 0; sel < 4; sel = sel + 1) begin
            {s0,s1} = sel;
            #10;
        end

        // Test Case 5: One-hot input
        $display("Test Case 5: One-hot input");
        {i0,i1,i2,i3} = 4'b1000;

        for (sel = 0; sel < 4; sel = sel + 1) begin
            {s0,s1} = sel;
            #10;
        end

        $display("---- Verification Completed ----");
        $finish;
    end

endmodule

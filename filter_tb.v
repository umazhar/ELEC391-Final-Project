module filter_tb();
    reg CLOCK_50;
    reg [23:0] in;
    wire [23:0] out;
    reg read_ready, write_ready;
    reg reset;

    // fir_filter DUT(CLOCK_50, in, out, read_ready, write_ready, reset);
    filter DUT(CLOCK_50, in, out, read_ready, reset);

    initial begin
        CLOCK_50 = 0; #5;
        forever begin
            CLOCK_50 = 1; #5;
            CLOCK_50 = 0; #5;
        end
    end


    initial begin
        read_ready = 1'b1;
        #10;
        in = 8;
        #10;
        in = 16;
        #10; 
        in = 8;
        #10;  
        in = 32;
        #10;
        in = 8;
        #10; 
        in = 16;
        #10; 
        in = 8;
        #10; 
        in = 8;
        #10; 
        in = 24;
        #10;
        in = 16;
        #10;
        in = 8;
        #10;
        
    end



endmodule
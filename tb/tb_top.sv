`timescale 1ns/100ps

module tb_top;


localparam WIDTH = 10;


logic [WIDTH - 1 : 0] bin_w_cntr, w_value_for_sync;
logic [WIDTH - 1 : 0] bin_cntr_synced, r_value_synced, r_value_wo_gray;

logic w_clk = 0;
logic w_rstn = 1;

logic r_clk = 0;
logic r_rstn = 1;

int unsigned gray_errors = 0;
int unsigned bin_errors = 0;

//-----------------------------DUT----------------------------------------------
syncronizer#(
  .WIDTH  (WIDTH)
) _u_syncronizer_gray(
  .w_clk_i      (w_clk ),
  .w_rstn_i     (w_rstn),
  .w_value_i    (w_value_for_sync),

  .r_clk_i      (r_clk),
  .r_rstn_i     (r_rstn),
  .r_value_o    (r_value_synced)
);



bin2gray#(
  .WIDTH  (WIDTH)
) _u_bin2gray(
  .bin_i    (bin_w_cntr),
  .gray_o   (w_value_for_sync)
);


gray2bin#(
  .WIDTH  (WIDTH)
) _u_gray2bin(
  .gray_i   (r_value_synced),
  .bin_o    (bin_cntr_synced)
);


syncronizer#(
  .WIDTH  (WIDTH)
) _u_syncronizer_bin(
  .w_clk_i      (w_clk ),
  .w_rstn_i     (w_rstn),
  .w_value_i    (bin_w_cntr),

  .r_clk_i      (r_clk),
  .r_rstn_i     (r_rstn),
  .r_value_o    (r_value_wo_gray)
);

//------------------------------------------------------------------------------

initial begin
  bin_w_cntr = 0;
  #100;
  w_rstn = 0;
  r_rstn = 0;
  #100;
  w_rstn = 1;
  r_rstn = 1;
  fork
    forever begin
      #10 w_clk = ~w_clk;
    end
    forever begin
      #8 r_clk = ~r_clk;
    end
    begin
      #100;
      for(int i = 0; i < 2**WIDTH - 1; i++) begin
        @(posedge w_clk) begin
          bin_w_cntr = bin_w_cntr + 1'b1;
        end
        do begin
          @(posedge r_clk) begin
            if(!((bin_w_cntr - 'd1 == bin_cntr_synced ) || (bin_w_cntr == bin_cntr_synced))) begin
              $error("Counters with gray encoding differs more than 1");
              gray_errors++;
            end

            if(!((bin_w_cntr - 'd1 == r_value_wo_gray ) || (bin_w_cntr == r_value_wo_gray))) begin
              $error("Counters with bin encoding differs more than 1, %d %d",
                                                                bin_w_cntr, r_value_wo_gray);
              bin_errors++;
            end
          end
        end while(bin_cntr_synced != bin_w_cntr);
      end
      #100;
      $display("Gray encoding errors %d", gray_errors);
      $display("Bin encoding errors %d", bin_errors);
      $finish;
    end
  join
end



endmodule
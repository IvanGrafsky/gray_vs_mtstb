module syncronizer#(
  parameter WIDTH = 4
)(
  input logic w_clk_i,
  input logic w_rstn_i,
  input logic [WIDTH - 1 : 0] w_value_i,

  input logic r_clk_i,
  input logic r_rstn_i,
  output logic [WIDTH - 1 : 0] r_value_o
);

logic [WIDTH - 1 : 0] w_value;
logic [WIDTH - 1 : 0] r_value;

logic [WIDTH - 1 : 0] changed_bits; // for metastability imitation
integer random; // for metastability imitation
logic clr_changed_bits;

always_ff@(posedge w_clk_i or negedge w_rstn_i) begin
  if(!w_rstn_i) begin
    w_value <= '0;
  end else begin
    w_value <= w_value_i;
  end
end

always_ff@(posedge r_clk_i or negedge r_rstn_i) begin
  if(!r_rstn_i) begin
    r_value <= '0;
    r_value_o <= '0;
  end else begin
    if(|changed_bits) begin                           // если на отправляющей стороне изменились данные
      random = $urandom_range(0, 9);
      if(random > 2) begin                            // то например с вероятностью 20% произойдет
        r_value <= w_value;                           // setup/hold violation(зависит от отношений клоков, их фаз и.т.д.)
      end else begin
        for(int i = 0 ; i < WIDTH; i++) begin
          if(changed_bits[i]) begin                   // смотрим те биты, которые изменились
            r_value[i] <= $urandom_range(0, 1);       // и эти триггеры входят в метастабильное состояние
          end else begin                              // и принимают значения либо 0, либо 1
            r_value[i] <= w_value[i];                 // неизмененные биты защелкиваются как есть, потому что в окне
          end                                         // setup/hold нет изменений данных
        end
      end
    end else begin
      r_value <= w_value;
    end
    r_value_o <= r_value;
  end
end


// test code for metastability imitation
always_ff@(posedge r_clk_i) begin
  clr_changed_bits <= |changed_bits;
end


always_ff@(posedge w_clk_i or negedge w_rstn_i) begin
  if(!w_rstn_i) begin
    changed_bits <= '0;
  end else begin
    if(|(w_value ^ w_value_i)) begin
      changed_bits <= w_value ^ w_value_i;
    end else if(clr_changed_bits) begin
      changed_bits <= '0;
    end
  end
end


endmodule


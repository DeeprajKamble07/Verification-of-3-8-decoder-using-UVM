class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  uvm_analysis_imp #(seq_item,scoreboard) scoreboard_port; 
  seq_item queue[$];
  function new(string name="scoreboard",uvm_component parent=null);
    super.new(name,parent);
    scoreboard_port=new("scoreboard_port",this);
    `uvm_info("scoreboard class","inside constructor class",UVM_HIGH);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("scoreboard class","inside build phase",UVM_HIGH);
  endfunction
  function void write(seq_item item);
    queue.push_back(item);
  endfunction
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("scoreboard class","inside connect phase",UVM_HIGH);
  endfunction
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("scoreboard class","inside run phase",UVM_HIGH);
    forever begin
      seq_item exp_item;
    wait(queue.size() > 0); 
      exp_item= queue.pop_front();
      compare(exp_item);
    end
  endtask
  
  task compare(seq_item exp_item);
    logic [7:0] actual, expected;
    case(exp_item.a)
      0:expected=8'd1;
        1:expected=8'd2;
        2:expected=8'd4;
        3:expected=8'd8;
        4:expected=8'd16;
        5:expected=8'd32;
        6:expected=8'd64;
        7:expected=8'd128;
      default:expected=8'd0;
    endcase
    actual=exp_item.y;
    
    if(actual==expected)
      begin
        `uvm_info("SCB",$sformatf("PASS! expected=%0d actual=%0d",expected,actual),UVM_LOW);
      end
    else
      begin
        `uvm_error("SCB",$sformatf("FAIL! expected=%0d actual=%0d",expected,actual));
      end
    
    
  endtask
endclass

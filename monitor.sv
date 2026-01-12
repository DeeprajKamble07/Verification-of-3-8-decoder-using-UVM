class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  virtual intf vif;
  seq_item item;
  uvm_analysis_port #(seq_item) monitor_port;
  function new(string name="monitor",uvm_component parent=null);
    super.new(name,parent);
    monitor_port=new("monitor_port",this);
    `uvm_info("monitor class","inside constructor class",UVM_HIGH);
  endfunction
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("monitor class","inside build phase",UVM_HIGH);
  endfunction
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("monitor class","inside connect phase",UVM_HIGH);
    if(!(uvm_config_db #(virtual intf)::get(this,"*","vif",vif)))
      begin
      `uvm_error("driver class","failed to get vif from confing db");
      end
  endfunction
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("monitor class","inside run phase",UVM_HIGH);
    forever begin
      #1;
      item=seq_item::type_id::create("item");
      item.a=vif.a;
      item.y=vif.y;
      monitor_port.write(item);
    end
  endtask
endclass

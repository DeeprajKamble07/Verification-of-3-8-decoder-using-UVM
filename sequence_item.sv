class seq_item extends uvm_sequence_item;
  `uvm_object_utils(seq_item)
  rand logic [3:0]a;
  logic [7:0] y;
  function new(string name="seq_item");
    super.new(name);
    `uvm_info("sequence_item class","inside constructor class",UVM_HIGH);
  endfunction
endclass

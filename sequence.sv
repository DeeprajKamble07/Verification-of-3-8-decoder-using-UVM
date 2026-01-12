class de_sequence extends uvm_sequence #(seq_item);
  `uvm_object_utils(de_sequence)
  seq_item item;
  function new(string name="de_sequence");
    super.new(name);
    `uvm_info("sequence class","inside constructor class",UVM_HIGH);
  endfunction
  task body();
    item=seq_item::type_id::create("item");
    start_item(item);
    item.randomize();
    finish_item(item);
  endtask
endclass

var slot_name = argument0;
var slot = ds_map_create();


ds_map_add_map(slot, "room", ds_map_create());
var globals = slot[? "room"];




ds_map_secure_save(slot,slot_name);
ds_map_destroy(slot);
var array_length = array_length_1d(global.key)


global.key[array_length] = key;

global.save[? key] = true;
save_map();
show_debug_message("==============game saved==============");


instance_destroy();
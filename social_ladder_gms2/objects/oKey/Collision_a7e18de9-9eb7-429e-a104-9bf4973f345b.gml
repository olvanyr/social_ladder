var array_length = array_length_1d(global.key)


global.key[array_length] = key;

global.save[? string(key)] = true;
save_instances();
save_map();

instance_destroy();
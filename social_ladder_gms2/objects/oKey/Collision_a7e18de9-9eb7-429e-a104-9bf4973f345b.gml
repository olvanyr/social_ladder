var array_length = array_length_1d(global.key)

if once == false
{
	once = true;
	global.key[array_length] = key;

	global.save[? key] = true;
	save_map();
	show_debug_message("==============game saved==============");

	picked = true;
}
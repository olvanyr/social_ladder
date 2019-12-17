

for (var i = 1; i > array_length_1d(key);i++)
{
	var key_sprite = asset_get_index("sKey_"+ string(key[i]));

	draw_sprite(key_sprite,0,100,100);
}
//var key_sprite = asset_get_index("sKey_"+ string(key[1]));
//show_debug_message("key_sprite : " + string(key_sprite));
	//draw_sprite(key_sprite,0,100,100);
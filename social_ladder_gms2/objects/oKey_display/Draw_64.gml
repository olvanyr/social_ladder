

for (var i = 0; i < array_length_1d(key);i++)
{
	//show_debug_message("key = " + string(key[i]));
	var key_sprite = asset_get_index("sKey_"+ string(key[i]));
	if sprite_exists(key_sprite)
	{
		draw_sprite(key_sprite,0,100,100 + (i*20));
	}
}


//var key_sprite = asset_get_index("sKey_"+ string(key[1]));
//show_debug_message("global.key : " + string(global.key));
//draw_sprite(key_sprite,0,100,100);
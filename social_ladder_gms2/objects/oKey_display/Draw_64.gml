gui_height = display_get_gui_height();
gui_width = display_get_gui_width();

var width = gui_width - (2*x_buffer);

var max_key_x = floor(width/s_width);
var width_frac = frac(width/s_width) / max_key_x;

var j = 0;
var _y = 0;

for (var i = 0; i < array_length_1d(key);i++)
{
	//show_debug_message("key = " + string(key[i]));
	var key_sprite = asset_get_index("sKey_"+ string(key[i]));
	
	if j == max_key_x j = 1;
	if j == 1 _y++;
	
	if sprite_exists(key_sprite)
	{
		draw_sprite(key_sprite,0,x_buffer + width_frac + (j*s_width),y_buffer + (_y*s_height));
	}
	j ++;
}


//var key_sprite = asset_get_index("sKey_"+ string(key[1]));
//show_debug_message("global.key : " + string(global.key));
//draw_sprite(key_sprite,0,100,100);

//show_debug_message("max key width : " + string(max_key_x));
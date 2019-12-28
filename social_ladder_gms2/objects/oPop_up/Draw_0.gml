var c = c_white;
if global.control == "keyboard"
{
	if letter != ""
	{
	var current_sprite = sprite;
	//show_debug_message("asset index : " + string (sprite_get_name(sprite) + "_keyboard"));
	if sprite_exists((asset_get_index( sprite_get_name(sprite) + "_keyboard")))
	{
		current_sprite = asset_get_index(sprite_get_name(sprite) + "_keyboard")
		sprite_animation(current_sprite,anim_speed,_x,_y);
		 	
	}
	
	sprite_animation(sKey,anim_speed,letter_x,letter_y);
	draw_set_font(fPop_up);
	draw_text_color(letter_x - (string_width(chr(letter))/2),letter_y,chr(letter),c,c,c,c,1);
	}
}

if global.control == "gamepad" || letter == ""
{
	sprite_animation(sprite,anim_speed,_x,_y);
}
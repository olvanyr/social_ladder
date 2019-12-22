draw_self();

if (instance_exists(oPlayer)) && (!instance_exists(oText))
{
	var c = c_white;
	if global.control == "keyboard"
	{	
		sprite_animation(sKey,0.05,letter_x,letter_y);
		draw_set_font(fPop_up);
		draw_text_color(letter_x - (string_width(chr(letter))/2),letter_y,chr(letter),c,c,c,c,1);
	}

	if global.control == "gamepad" || letter == ""
	{
		sprite_animation(sUse,0.05,x,y + 30);
	}
}



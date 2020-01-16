var gwidth = global.view_width

if tab == pause_tab.settings
{

	draw_sprite_ext(sMenu_tab_left,0,0,0,2,2,0,c_white,1);
	draw_sprite_ext(sMenu_tab_right,0,gwidth,0,2,2,0,c_white,1);
	if global.control == "keyboard"
	{
		var scale = 2;
		var c = c_white;
		var letter_left= "A";
		var letter_right= "E";
					
		draw_set_font(fPop_up);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_sprite_ext(sKey,0,6*4,2*4,1.6,1.6,0,c_white,1);
		draw_sprite_ext(sKey,0,gwidth - (5.5*4),2*4,1.6,1.6,0,c_white,1);
		//draw_text_color((string_width(letter_left)/2),2,letter_left,c,c,c,c,1);
		draw_text_ext_transformed_color(((string_width(letter_left)/2) + 2) *4,0,letter_left,0,100,scale,scale,0,c,c,c,c,1);
		draw_text_ext_transformed_color(gwidth -22,0,letter_right,0,100,scale,scale,0,c,c,c,c,1);
	}
}else
{
	var gwidth = global.view_width

	var scale = 0.5;
	draw_sprite_ext(sMenu_tab_left,0,0,0,scale,scale,0,c_white,1);
	draw_sprite_ext(sMenu_tab_right,0,gwidth - 0.5,0,scale,scale,0,c_white,1);

	if global.control == "keyboard"
	{
	
		var c = c_white;
		var letter_left= "A";
		var letter_right= "E";
					
		draw_set_font(fPop_up);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_center);
		draw_sprite_ext(sKey,0,6,2,0.4,0.4,0,c_white,1);
		draw_sprite_ext(sKey,0,gwidth - 6,2,0.4,0.4,0,c_white,1);
		//draw_text_color((string_width(letter_left)/2),2,letter_left,c,c,c,c,1);
		draw_text_ext_transformed_color((string_width(letter_left)/2) + 2,0,letter_left,0,100,scale,scale,0,c,c,c,c,1);
		draw_text_ext_transformed_color(gwidth - (string_width(letter_right)/2) - 2.5,0,letter_right,0,100,scale,scale,0,c,c,c,c,1);
	}
}


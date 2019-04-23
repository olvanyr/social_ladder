draw_set_alpha(1);
draw_set_color(c_text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(font);

draw_text(cam.x,cam.y + ybuffer, line_part);



var gwidth = global.view_width, gheight = global.view_height;
var c = make_color_rgb(105,152,214);

switch (state)
{
	case "wait" :
		if toggle = true
		{
			a = min(a + 0.005,1);
			var swidth = sprite_get_width(sMenu_start_background);
			var sheight = sprite_get_height(sMenu_start_background);
			draw_set_alpha(a);
			draw_rectangle_color(-10,-10,5000,5000,c,c,c,c,false);
			draw_sprite_ext(sMenu_start_background,0,gwidth/2 - swidth - 150,gheight/2 - sheight - 180,2.5,2.5,0,c_white,a);
			draw_sprite_ext(sMenu_start,-1,gwidth/2,gheight/2 + 300,2,2,0,c_white,a);
		}
	break;
}
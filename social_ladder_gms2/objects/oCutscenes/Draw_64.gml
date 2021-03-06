draw_set_alpha(1);
draw_set_color(c_text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(font);

var half_width = string_width(line)/2;
var half_height = string_height(line)/2;
if state = "text1" || state = "text2"
{
		nine_slice_box(sBox1,cam.x - text_buffer - half_width,cam.y - 250 + ybuffer - text_buffer,cam.x + string_width(line)/2 + text_buffer, cam.y - 250 + half_height + ybuffer + text_buffer*2);
		draw_text(cam.x,cam.y - 250 + ybuffer, line_part);
}



var gwidth = global.view_width, gheight = global.view_height;
var c = make_color_rgb(105,152,214);

switch (state)
{
	case "wait" :
		if toggle = true
		{
			a = min(a + 0.005,2);
			var swidth = sprite_get_width(sMenu_start_background);
			var sheight = sprite_get_height(sMenu_start_background);
			draw_set_alpha(a);
			draw_rectangle_color(-10,-10,5000,5000,c,c,c,c,false);
			draw_sprite_ext(sMenu_start_background,0,gwidth/2 - swidth - 150,gheight/2 - sheight - 180,2.5,2.5,0,c_white,a);
			draw_sprite_ext(sMenu_start,-1,gwidth/2,gheight/2 + 300,2,2,0,c_white,a-1);
		}
	break;
}
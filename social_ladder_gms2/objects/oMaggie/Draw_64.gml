draw_set_alpha(1);
draw_set_color(c_text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(font);


display_set_gui_size(global.ideal_width,global.ideal_height);
var halph_w = (display_get_gui_width() + oPlayer.x - oMaggie.x)/2;
var halph_h = display_get_gui_height()/2;



var half_width = string_width(line)/2;
var half_height = string_height(line)/2;





if state = "speak"
{
		nine_slice_box(sBox1,halph_w - text_buffer - half_width,halph_h - 250 + ybuffer - text_buffer,halph_w + string_width(line)/2 + text_buffer,halph_h - 250 + half_height + ybuffer + text_buffer*2);
		draw_text(halph_w,halph_h - 250 + ybuffer, line_part);
}
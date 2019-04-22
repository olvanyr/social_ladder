draw_set_alpha(1);
draw_set_color(c_text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(font);

draw_text(cam.x,cam.y + ybuffer, line_part);
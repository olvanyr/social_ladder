

if keyboard_check(ord("W"))
{
draw_set_font(fDial);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text(10,10,string(room_get_name(room)));

}